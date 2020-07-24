package com.cdl.iot

import java.io.{ByteArrayInputStream, File}
import java.util.{Optional, Properties}

import cdl.iot.SensorData.SensorData
import com.cdl.iot.dao.ModelDao
import com.cdl.iot.dto.Model
import com.datastax.driver.core.Cluster
import org.apache.flink.api.common.functions.MapFunction
import org.apache.flink.api.common.serialization.{DeserializationSchema, SerializationSchema}
import org.apache.flink.api.common.typeinfo.TypeInformation
import org.apache.flink.api.java.utils.ParameterTool
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment
import org.apache.flink.streaming.connectors.pulsar.{FlinkPulsarProducer, PulsarSourceBuilder}
import org.apache.flink.streaming.api.scala._
import org.apache.flink.streaming.connectors.cassandra.{CassandraSink, ClusterBuilder}
import org.apache.flink.streaming.connectors.pulsar.partitioner.PulsarKeyExtractor
import org.dmg.pmml.FieldName

import collection.JavaConverters.mapAsJavaMapConverter
import scala.collection.JavaConverters.mapAsScalaMapConverter
import org.jpmml.evaluator.{EvaluatorUtil, FieldValue, FieldValueUtil, LoadingModelEvaluatorBuilder}
import org.skife.jdbi.v2.{DBI, Handle}
import org.skife.jdbi.v2.tweak.HandleCallback

import org.apache.flink.api.common.state.{ListState, ListStateDescriptor, ValueState, ValueStateDescriptor}
import org.apache.flink.runtime.state.{FunctionInitializationContext, FunctionSnapshotContext}
import org.apache.flink.streaming.api.checkpoint.CheckpointedFunction
import org.apache.flink.streaming.api.TimeCharacteristic
import org.apache.flink.util.Collector


object Main {

  def env_var(name: String, defaultValue: String, params: ParameterTool): String =
    if (sys.env.contains("LOCAL"))
      if (sys.env.contains(name)) sys.env(name)
      else defaultValue
    else params.get(name, defaultValue)

  def getModel(host: String, user: String, password: String, version: String): Model = {
    val props = new Properties()
    props.setProperty("user", user)
    props.setProperty("password", password)
    val jdbi = new DBI(s"jdbc:cassandra://${host}:9160/iot_prototype_training", props)

    jdbi.withHandle[Model](new HandleCallback[Model]() {
      override def withHandle(handle: Handle): Model = {
        val dao = handle.attach(classOf[ModelDao])
        Model("asdf", dao.getModel(version).get(0))
      }
    })
  }

  def main(args: Array[String]) {

    val env: StreamExecutionEnvironment = StreamExecutionEnvironment.getExecutionEnvironment
    
        // checkpoint every 5 seconds
    env.getCheckpointConfig.setCheckpointInterval(5 * 1000)

    val params = ParameterTool.fromArgs(args)


    val pulsarHost = env_var("PULSAR_HOST", "localhost", params)
    val inputTopic = env_var("INPUT_TOPIC", "persistent://sample/standalone/default/in", params)
    val outputTopic = env_var("OUTPUT_TOPIC", "persistent://public/standalone/default/event-log", params)
    val subscribtionName = env_var("SUBSCRIPTION_NAME", "scala-sub-1", params)
    val cassandraHost = env_var("CASSANDRA_HOST", "127.0.0.1", params)
    val cassandraUsername = env_var("CASSANDRA_USER", "cassandra", params)
    val cassandraPassword = env_var("CASSANDRA_PASSWORD", "cassandra", params)
    val modelVersion = env_var("MODEL_VERSION", "__latest__", params)
    val serviceUrl = s"pulsar://${pulsarHost}:6650"

    // So the general idea is that we will treat this as a state and update it with events from pulsar
    val evaluator = new LoadingModelEvaluatorBuilder()
      .load(new ByteArrayInputStream(getModel(cassandraHost, cassandraUsername, cassandraPassword, modelVersion).bytes))
      .build();


    val src = PulsarSourceBuilder.builder(new SensorDataSchema)
      .serviceUrl(serviceUrl)
      .topic(inputTopic)
      .subscriptionName(subscribtionName)
      .build()

    val input = env.addSource(src)

     val inference = input.map(new SensorDataInference[SensorData, SensorData])
  
    CassandraSink.addSink(inference.map(new SensorDataMapper))
      .setClusterBuilder(
        new ClusterBuilder {
          override def buildCluster(builder: Cluster.Builder): Cluster = builder
            .withCredentials(cassandraUsername, cassandraPassword)
            .addContactPoint(cassandraHost)
            .build()
        }
      )
      .setQuery("INSERT INTO iot_prototype_training.sensor_data(key,sensor_id, timestamp, data, prediction) values (?, ?, ?, ?, ?);")
      .build()


    inference.addSink(new FlinkPulsarProducer(
      serviceUrl,
      outputTopic,
      new SensorDataSerializer,
      new SensorDataKeyExtractor
    ))

    env.execute("Test Job")
  }
}

class SensorDataInference extends MapFunction [SensorData, SensorData] with CheckpointedFunction {

  private var checkpointedState: ListState[(String, Int)] = _

  override def map(v: SensorData): SensorData = {
    val input: Map[FieldName, FieldValue] = v.doubles.map({
      case (x, d) =>
        FieldName.create(x) -> FieldValueUtil.create(d)
    })
      .++(v.integers.map({
        case (x, d) =>
          FieldName.create(x) -> FieldValueUtil.create(d)
      }))
      .++(v.strings.map({
        case (x, d) =>
          FieldName.create(x) -> FieldValueUtil.create(d)
      }))

    val evaluation = evaluator.evaluate(input.asJava)

    val results = EvaluatorUtil.decodeAll(evaluation).asScala
    val prediction: Map[String, String] = results.map(
      { case (x, d) =>
        x -> d.toString
      }).toMap
    new SensorData(
      v.sensorId,
      v.timestamp,
      v.doubles,
      v.strings,
      v.integers,
      prediction
    )
  }

  override def initializeState(initContext: FuntionInitializationContext): Unit = {
    
    // Currently looking into the ListStateDescriptor method, 
    // Problem with saving state is coming from the following line.
    val descriptor = new ListStateDescriptor[(String, Int)]( "evaluator", TypeInformation.of(new TypeHint[(String, Int)](){}) )
    
    checkpointedState = initContext.getOperatorStateStore.getUnionListState(descriptor)

    if (context.isRestored()){
      
      evaluator = checkpointedState.get()
      
    } else {
      
      checkpointedState.clear
      
      // Idea for failsafe, but may not work, 
      // need to look into passing cassandraHost, cassandraUsername, etc. args to class
      evaluator = new LoadingModelEvaluatorBuilder()
        .load(new ByteArrayInputStream(getModel(cassandraHost, cassandraUsername, cassandraPassword, modelVersion).bytes))
        .build();

      checkpointedState.add(evaluator)
    }
  }

  override def snapshotState(snapshotContext: FunctionSnapshotContext): Unit = {
    checkpointedState.clear()
    checkpointedState.add(evaluator)
  }
}

class SensorDataMapper extends MapFunction[SensorData, org.apache.flink.api.java.tuple.Tuple5[String, String, String, java.util.Map[String, String], java.util.Map[String, String]]] {
  override def map(v: SensorData): org.apache.flink.api.java.tuple.Tuple5[String, String, String, java.util.Map[String, String], java.util.Map[String, String]] = {
    val data: Map[String, String] = v.integers.map({
      case (x, d) =>
        x -> d.toString
    })
      .++(v.doubles.map({
        case (x, d) =>
          x -> d.toString
      }))
      .++(v.strings.map({
        case (x, d) =>
          x -> d
      }))
    new org.apache.flink.api.java.tuple.Tuple5(
      s"${v.timestamp}_${v.sensorId}",
      v.sensorId.toString,
      v.timestamp,
      data.asJava,
      v.prediction.asJava)
  }
}

class SensorDataKeyExtractor extends PulsarKeyExtractor[SensorData] {
  override def getKey(in: SensorData): String = in.timestamp
}

class SensorDataSerializer extends SerializationSchema[SensorData] {
  override def serialize(element: SensorData): Array[Byte] = element.toProtoString.getBytes
}

class SensorDataSchema extends DeserializationSchema[SensorData] {
  override def deserialize(message: Array[Byte]): SensorData = {
    val ret = SensorData.parseFrom(message)
    println(s"Recieved: SID: ${ret.sensorId}, TMSP: ${ret.timestamp},  ${ret.doubles} ${ret.integers} ${ret.strings}")
    ret
  }

  override def isEndOfStream(nextElement: SensorData): Boolean = true

  override def getProducedType: TypeInformation[SensorData] = createTypeInformation[SensorData]
}
