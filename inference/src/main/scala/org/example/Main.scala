package org.example

import java.io.File

import cdl.iot.SensorData.SensorData
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


object Main {

  def env_var(name: String, defaultValue: String, params: ParameterTool): String =
    if (sys.env.contains("LOCAL"))
      if (sys.env.contains(name)) sys.env(name)
      else defaultValue
    else params.get(name, defaultValue)

  def main(args: Array[String]) {

    val env: StreamExecutionEnvironment = StreamExecutionEnvironment.getExecutionEnvironment

    val params = ParameterTool.fromArgs(args)


    val pulsarHost = env_var("PULSAR_HOST", "localhost", params)
    val inputTopic = env_var("INPUT_TOPIC", "persistent://sample/standalone/default/in", params)
    val outputTopic = env_var("OUTPUT_TOPIC", "persistent://public/standalone/default/event-log", params)
    val subscribtionName = env_var("SUBSCRIPTION_NAME", "scala-sub-1", params)
    val cassandraHost = env_var("CASSANDRA_HOST", "127.0.0.1", params)
    val cassandraUsername = env_var("CASSANDRA_USER", "cassandra", params)
    val cassandraPassword = env_var("CASSANDRA_PASSWORD", "cassandra", params)

    val serviceUrl = s"pulsar://${pulsarHost}:6650"
    val evaluator = new LoadingModelEvaluatorBuilder()
      .load(new File("model.pmml"))
      .build();


    val src = PulsarSourceBuilder.builder(new SensorDataSchema)
      .serviceUrl(serviceUrl)
      .topic(inputTopic)
      .subscriptionName(subscribtionName)
      .build()

    val input = env.addSource(src)

    val inference = input
      .map(new MapFunction[SensorData, SensorData] {
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
      })
      .map(new SensorDataMapper)


    CassandraSink.addSink(inference)
      .setClusterBuilder(
        new ClusterBuilder {
          override def buildCluster(builder: Cluster.Builder): Cluster = builder
            .withCredentials(cassandraUsername, cassandraPassword)
            .addContactPoint(cassandraHost)
            .build()
        }
      )
      .setQuery("INSERT INTO iot_prototype_training.sensor_data(key, data, prediction) values (?, ?, ?);")
      .build()

    input.addSink(new FlinkPulsarProducer(
      serviceUrl,
      outputTopic,
      new SensorDataSerializer,
      new SensorDataKeyExtractor
    ))

    env.execute("Test Job")
  }
}

class SensorDataMapper extends MapFunction[SensorData, org.apache.flink.api.java.tuple.Tuple3[String, java.util.Map[String, String], java.util.Map[String, String]]] {
  override def map(v: SensorData): org.apache.flink.api.java.tuple.Tuple3[String, java.util.Map[String, String], java.util.Map[String, String]] = {
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
    new org.apache.flink.api.java.tuple.Tuple3(s"${v.timestamp}_${v.sensorId}", data.asJava, v.prediction.asJava)
  }
}

class SensorDataKeyExtractor extends PulsarKeyExtractor[SensorData] {
  override def getKey(in: SensorData): String = in.timestamp
}

class SensorDataSerializer extends SerializationSchema[SensorData] {
  override def serialize(element: SensorData): Array[Byte] = element.toByteArray
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
