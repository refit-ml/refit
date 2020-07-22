package com.cdl.iot

import java.io.ByteArrayInputStream
import java.util.UUID

import cdl.iot.dto.Model.Model
import cdl.iot.dto.SensorData.SensorData
import com.cdl.iot.models.Evaluator
import com.datastax.driver.core.Cluster
import org.apache.flink.api.common.functions.MapFunction
import org.apache.flink.api.common.serialization.{DeserializationSchema, SerializationSchema}
import org.apache.flink.api.common.typeinfo.{BasicTypeInfo, TypeHint, TypeInformation}
import org.apache.flink.api.java.utils.ParameterTool
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment
import org.apache.flink.streaming.connectors.pulsar.{FlinkPulsarProducer, PulsarSourceBuilder}
import org.apache.flink.streaming.api.scala._
import org.apache.flink.streaming.connectors.cassandra.{CassandraSink, ClusterBuilder}
import org.apache.flink.streaming.connectors.pulsar.partitioner.PulsarKeyExtractor
import org.dmg.pmml.FieldName

import collection.JavaConverters.mapAsJavaMapConverter
import scala.collection.JavaConverters.mapAsScalaMapConverter
import org.jpmml.evaluator.{EvaluatorUtil, FieldValue, FieldValueUtil, LoadingModelEvaluatorBuilder, ModelEvaluator}
import org.apache.flink.api.common.state.{ListState, ListStateDescriptor, MapStateDescriptor, ValueState, ValueStateDescriptor}
import org.apache.flink.api.java.functions.KeySelector
import org.apache.flink.configuration.Configuration
import org.apache.flink.runtime.state.{FunctionInitializationContext, FunctionSnapshotContext}
import org.apache.flink.streaming.api.checkpoint.CheckpointedFunction
import org.apache.flink.streaming.api.TimeCharacteristic
import org.apache.flink.streaming.api.functions.co.{BroadcastProcessFunction, CoMapFunction, CoProcessFunction, KeyedBroadcastProcessFunction, KeyedCoProcessFunction}
import org.apache.flink.util.Collector


object Main {

  def env_var(name: String, defaultValue: String, params: ParameterTool): String =
    if (sys.env.contains("LOCAL"))
      if (sys.env.contains(name)) sys.env(name)
      else defaultValue
    else params.get(name, defaultValue)

  def getVector(v: SensorData): Map[FieldName, FieldValue] = {
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
    input
  }

  def main(args: Array[String]) {

    val env: StreamExecutionEnvironment = StreamExecutionEnvironment.getExecutionEnvironment

    // checkpoint every 60 seconds
    env.getCheckpointConfig.setCheckpointInterval(60 * 1000)

    val params = ParameterTool.fromArgs(args)


    val pulsarHost = env_var("PULSAR_HOST", "localhost", params)
    val inputTopic = env_var("INPUT_TOPIC", "persistent://sample/standalone/default/in", params)
    val outputTopic = env_var("OUTPUT_TOPIC", "persistent://public/standalone/default/event-log", params)
    val subscribtionName = env_var("SUBSCRIPTION_NAME", "scala-sub-1", params)
    val cassandraHost = env_var("CASSANDRA_HOST", "127.0.0.1", params)
    val cassandraUsername = env_var("CASSANDRA_USER", "cassandra", params)
    val cassandraPassword = env_var("CASSANDRA_PASSWORD", "cassandra", params)
    val modelVersion = env_var("MODEL_VERSION", "__latest__", params)
    val modelTopic = env_var("MODEL_TOPIC", "persistent://sample/standalone/default/models", params)
    val serviceUrl = s"pulsar://${pulsarHost}:6650"



    // So the general idea is that we will treat this as a state and update it with events from pulsar


    val modelsrc = PulsarSourceBuilder.builder(new ModelSchema)
      .serviceUrl(serviceUrl)
      .topic(modelTopic)
      .subscriptionName(subscribtionName)
      .build()

    val d = new MapStateDescriptor[String, Evaluator](
      "ModelDescriptor",
      BasicTypeInfo.STRING_TYPE_INFO,
      TypeInformation.of(new TypeHint[Evaluator]() {})
    )

    val model = env
      .addSource(modelsrc)
      .map(new MapFunction[Model, Evaluator] {
        override def map(value: Model): Evaluator = {
//          println(s"Recieved Model: ${value.key}")
          val evaluator = new LoadingModelEvaluatorBuilder()
            .load(new ByteArrayInputStream(value.bytes.toByteArray))
            .build();

          Evaluator(value.key, evaluator)
        }
      })
      //      .keyBy(new KeySelector[Evaluator, String] {
      //        override def getKey(value: Evaluator): String = s"${value.key}_${UUID.randomUUID().toString}"
      //      })
      .broadcast()


    val eventSrc = PulsarSourceBuilder.builder(new SensorDataSchema)
      .serviceUrl(serviceUrl)
      .topic(inputTopic)
      .subscriptionName(subscribtionName)
      .build()

    val input = env.addSource(eventSrc)

    val inference = input
      .connect(model)

      .process(new BroadcastProcessFunction[SensorData, Evaluator, SensorData] {
        var evaluator: Evaluator = _

        override def processElement(value: SensorData, ctx: BroadcastProcessFunction[SensorData, Evaluator, SensorData]#ReadOnlyContext, out: Collector[SensorData]): Unit = {
          if (evaluator != null) {
            println(s"Use model - ${evaluator.key}")
            val p = evaluator.evaluator.evaluate(getVector(value).asJava)

            val results = EvaluatorUtil.decodeAll(p).asScala
            val prediction: Map[String, String] = results.map(
              { case (x, d) =>
                x -> d.toString
              }).toMap
            out.collect(
              new SensorData(
                value.sensorId,
                value.timestamp,
                value.doubles,
                value.strings,
                value.integers,
                prediction
              )
            )
          }

        }

        override def processBroadcastElement(value: Evaluator, ctx: BroadcastProcessFunction[SensorData, Evaluator, SensorData]#Context, out: Collector[SensorData]): Unit = {
          evaluator = value
        }
      })
    //      .process(new CoProcessFunction[SensorData, Evaluator, SensorData] {
    //        // Current model
    //        var currentEvaluator: ValueState[Option[Evaluator]] = _
    //        var newEvaluator: ValueState[Option[Evaluator]] = _
    //        // New model
    //
    //        override def processElement2(model: Evaluator, ctx: CoProcessFunction[SensorData, Evaluator, SensorData]#Context, out: Collector[SensorData]): Unit = {
    //          // Ensure that the state is initialized
    //          if (newEvaluator.value == null) newEvaluator.update(None)
    //          if (currentEvaluator.value == null) currentEvaluator.update(None)
    //
    //          Some(model) match {
    //            case Some(evaluator) => {
    //              println(s"Update model ${model.key}")
    //              newEvaluator.update(Some(model))
    //            }
    //            case _ => println(s"Cannot update model ${model.key}")
    //          }
    //
    //        }
    //
    //        override def processElement1(value: SensorData, ctx: CoProcessFunction[SensorData, Evaluator, SensorData]#Context, out: Collector[SensorData]): Unit = {
    //          println(s"Process prediction ${currentEvaluator.value()}")
    //          if (newEvaluator.value == null) newEvaluator.update(None)
    //          if (currentEvaluator.value == null) currentEvaluator.update(None)
    //          newEvaluator.value.foreach { ev =>
    //            // close current model first
    //            // Update model
    //            currentEvaluator.update(newEvaluator.value())
    //            newEvaluator.update(None)
    //          }
    //
    //          currentEvaluator.value match {
    //            case Some(evaluator) => {
    //              println(s"Use model - ${evaluator.key}")
    //              val p = evaluator.evaluator.evaluate(getVector(value).asJava)
    //
    //              val results = EvaluatorUtil.decodeAll(p).asScala
    //              val prediction: Map[String, String] = results.map(
    //                { case (x, d) =>
    //                  x -> d.toString
    //                }).toMap
    //              out.collect(
    //                new SensorData(
    //                  value.sensorId,
    //                  value.timestamp,
    //                  value.doubles,
    //                  value.strings,
    //                  value.integers,
    //                  prediction
    //                )
    //              )
    //            }
    //            case _ => {
    //              println("No model available")
    //            }
    //          }
    //        }
    //
    //
    //        override def open(parameters: Configuration): Unit = {
    //          val currentEvaluatorStateDesc = new ValueStateDescriptor[Option[Evaluator]](
    //            "current-evaluator-desc",
    //            createTypeInformation[Option[Evaluator]]
    //          )
    //          currentEvaluatorStateDesc.setQueryable("current-evaluator-query")
    //          currentEvaluator = getRuntimeContext.getState(currentEvaluatorStateDesc)
    //
    //          val newEvaluatorStateDesc = new ValueStateDescriptor[Option[Evaluator]](
    //            "new-evaluator-desc",
    //            createTypeInformation[Option[Evaluator]]
    //          )
    //          newEvaluatorStateDesc.setQueryable("new-evaluator-query")
    //          newEvaluator = getRuntimeContext.getState(newEvaluatorStateDesc)
    //
    //        }
    //      })


    //        override def initializeState(initContext: FuntionInitializationContext): Unit = {
    //          val descriptor = new ListStateDescriptor[(String, Int)]( "evaluator", TypeInformation.of(new TypeHint[(String, Int)](){}) )
    //          checkpointedState = initContext.getOperatorStateStore.getUnionListState(descriptor)
    //          evaluator = checkpointedState.get()
    //        }

    //        override def snapshotState(snapshotContext: FunctionSnapshotContext): Unit = {
    //          checkpointedState.clear()
    //          checkpointedState.add(evaluator)
    //        }


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

class ModelSchema extends DeserializationSchema[Model] {
  override def deserialize(message: Array[Byte]): Model = {
    val ret = Model.parseFrom(message)
    println(s"Recieved Model:")
    ret
  }

  override def isEndOfStream(nextElement: Model): Boolean = true

  override def getProducedType: TypeInformation[Model] = createTypeInformation[Model]
}