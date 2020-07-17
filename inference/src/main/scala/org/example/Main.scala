package org.example

import cdl.iot.SensorData.SensorData
import com.datastax.driver.core.Cluster
import org.apache.flink.api.common.functions.{MapFunction, RichMapFunction}
import org.apache.flink.api.common.serialization.{DeserializationSchema, SerializationSchema}
import org.apache.flink.api.common.state.ListState
import org.apache.flink.api.common.typeinfo.TypeInformation
import org.apache.flink.api.java.utils.ParameterTool
import org.apache.flink.configuration.Configuration
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment
import org.apache.flink.streaming.connectors.pulsar.{FlinkPulsarProducer, PulsarSourceBuilder}
import org.apache.flink.streaming.api.scala._
import org.apache.flink.streaming.connectors.cassandra.{CassandraSink, ClusterBuilder}
import org.apache.flink.streaming.connectors.pulsar.partitioner.PulsarKeyExtractor
import org.apache.spark.ml.classification.{RandomForestClassificationModel, RandomForestClassifier}
import org.apache.spark.ml.linalg.Vectors

//import org.apache.flink.configuration.Configuration

object Main {

  def main(args: Array[String]) {

    val env = StreamExecutionEnvironment.getExecutionEnvironment

    val params = ParameterTool.fromArgs(args)

    val serviceUrl = params.get("pulsarEndpoint", "pulsar://localhost:6650")
    val inputTopic = params.get("inputTopic", "persistent://sample/standalone/default/in")
    val outputTopic = params.get("outputTopic", "persistent://public/standalone/default/event-log")
    val subscribtionName = params.get("subscriptionName", "scala-sub-1")
    val cassandraHost = params.get("cassandraHost", "127.0.0.1")
    val cassandraUsername = params.get("cassandraUsername", "cassandra")
    val cassandraPassword = params.get("cassandraPassword", "cassandra")

    val model: RandomForestClassificationModel = RandomForestClassificationModel.load(s"${System.getProperty("user.dir")}/out")

    val src = PulsarSourceBuilder.builder(new SensorDataSchema)
      .serviceUrl(serviceUrl)
      .topic(inputTopic)
      .subscriptionName(subscribtionName)
      .build()

    val input = env.addSource(src)

    val inference = input
      .map(new MapFunction[SensorData, SensorData] {
        override def map(v: SensorData): SensorData = new SensorData(v.sensorId, v.timestamp, v.temperature, v.pressure, v.wind, model.predict(Vectors.dense(v.wind, v.pressure, v.temperature)))
      })
      .map(new SensorDataMapper)

    //val prediction = input.map( new SensorDataInference())

    CassandraSink.addSink(inference)
      .setClusterBuilder(
        new ClusterBuilder {
          override def buildCluster(builder: Cluster.Builder): Cluster = builder
            .withCredentials(cassandraUsername, cassandraPassword)
            .addContactPoint(cassandraHost)
            .build()
        }
      )
      .setQuery("INSERT INTO iot_prototype_training.sensor_data(key, value) values (?, ?);")
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


/*
public static class SensorDataInference extends RichMapFunction[Value, Prediction], CheckPointedFunction {

  private transient ListState<Model> modelState

  private transient Model model

  override public Prediction map(Value value) throws Exception {
    return model.predict(value)
  }

  override public void snapshotState(FunctionSnapshotContext context) throws Exception {
    // Shouldn't have to do anything here since model is not changing after startup
  }

  override public void initializeState(FunctionIntitializationContext context) throws Exception {

    ListStateDescriptor<Model> listStateDescriptor = new ListStateDescriptor<>("model", Model.class)

    modelState = context.getOperatorStateStore().getUnionListState(listStateDescriptor)

    if (context.isRestored()) {
      model = modelState.get().iterator().next()
    } else {
      public void open(Configuration parameters) {
        model = .... // read model from file
        // May need to Deserialize the model after reading it in
      }
      modelState.add(model)
    }

  }
}

public static class Model{}
public static class Value{}
public static class SensorDataInference{}
*/

class SensorDataMapper extends MapFunction[SensorData, org.apache.flink.api.java.tuple.Tuple2[String, String]] {
  override def map(value: SensorData): org.apache.flink.api.java.tuple.Tuple2[String, String] = new org.apache.flink.api.java.tuple.Tuple2(s"${value.timestamp}_${value.sensorId}", value.toProtoString)
}

class SensorDataKeyExtractor extends PulsarKeyExtractor[SensorData] {
  override def getKey(in: SensorData): String = in.timestamp
}

class SensorDataSerializer extends SerializationSchema[SensorData] {
  override def serialize(element: SensorData): Array[Byte] = s"${element.sensorId},${element.pressure},${element.temperature},${element.wind}".getBytes()
}

class SensorDataSchema extends DeserializationSchema[SensorData] {
  override def deserialize(message: Array[Byte]): SensorData = {
    val ret = SensorData.parseFrom(message)
    println(s"Recieved: SID: ${ret.sensorId}, temp: ${ret.temperature}, wind: ${ret.wind}, pressure: ${ret.pressure}")
    ret
  }

  override def isEndOfStream(nextElement: SensorData): Boolean = true

  override def getProducedType: TypeInformation[SensorData] = createTypeInformation[SensorData]
}
