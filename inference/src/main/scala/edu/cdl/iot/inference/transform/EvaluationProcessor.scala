package edu.cdl.iot.inference.transform

import java.io.ByteArrayInputStream

import edu.cdl.iot.inference.util.helpers
import edu.cdl.iot.protocol.Model.Model
import edu.cdl.iot.protocol.Prediction.Prediction
import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.commons.lang3.SerializationUtils
import org.apache.flink.api.common.state.{MapState, MapStateDescriptor}
import org.apache.flink.configuration.Configuration
import org.apache.flink.runtime.state.{FunctionInitializationContext, FunctionSnapshotContext}
import org.apache.flink.streaming.api.checkpoint.CheckpointedFunction
import org.apache.flink.streaming.api.functions.co.KeyedCoProcessFunction
import org.apache.flink.util.Collector
import org.jpmml.evaluator.{EvaluatorUtil, LoadingModelEvaluatorBuilder, ModelEvaluator}

import scala.collection.JavaConverters.{mapAsJavaMapConverter, mapAsScalaMapConverter, _}

class EvaluationProcessor extends KeyedCoProcessFunction[String, SensorData, Model, Prediction] with CheckpointedFunction {

  private var evaluators: Map[String, ModelEvaluator[_]] = _
  private var models: Map[String, String] = _
  private var evaluatorState: MapState[String, Array[Byte]] = _
  private var modelState: MapState[String, String] = _

  override def processElement1(value: SensorData, ctx: KeyedCoProcessFunction[String, SensorData, Model, Prediction]#Context, out: Collector[Prediction]): Unit = {
    val key = ctx.getCurrentKey

    if (evaluators.contains(key) && models.contains(key)) {
      val evaluator = evaluators(key)
      val modelGuid = models(key)
      println("Try make ")
      val p = evaluator.evaluate(helpers.getVector(value).asJava)
      val results = EvaluatorUtil.decodeAll(p).asScala
      val prediction: Map[String, String] = results.map(
        { case (x, d) =>
          x -> d.toString
        }).toMap

      println(s"Prediction Made (modelGuid: ${modelGuid}): ${prediction} ${value}")

      out.collect(
        new Prediction(
          value.projectGuid,
          value.sensorId,
          value.timestamp,
          modelGuid,
          value.doubles,
          value.strings,
          value.integers,
          prediction
        )
      )

    }
    else {
      println("No Model in state, empty prediction")
      out.collect(
        new Prediction(
          value.projectGuid,
          value.sensorId,
          value.timestamp,
          key,
          value.doubles,
          value.strings,
          value.integers,
          Map.empty[String, String]
        )
      )
    }
  }

  override def processElement2(model: Model, ctx: KeyedCoProcessFunction[String, SensorData, Model, Prediction]#Context, out: Collector[Prediction]): Unit = {
    println(s"Model update: ${model.key}")
    val key = ctx.getCurrentKey

    evaluators += (
      key -> new LoadingModelEvaluatorBuilder()
        .load(new ByteArrayInputStream(model.bytes.toByteArray))
        .build())
    models += (key -> model.key)

    println("Model updated")

  }

  override def open(conf: Configuration): Unit = {
    evaluators = Map[String, ModelEvaluator[_]]()
    models = Map[String, String]()
  }

  override def initializeState(context: FunctionInitializationContext): Unit = {

    val modelStateDescriptor = new MapStateDescriptor[String, String]("ModelState", classOf[String], classOf[String])
    modelState = getRuntimeContext.getMapState[String, String](modelStateDescriptor)

    val evaluatorStateDescriptor = new MapStateDescriptor[String, Array[Byte]]("EvaluatorState", classOf[String], classOf[Array[Byte]])
    evaluatorState = context.getKeyedStateStore.getMapState[String, Array[Byte]](evaluatorStateDescriptor)

    if(context.isRestored){

      val modelStateKeys = modelState.keys().asScala
      for(key <- modelStateKeys){
        models += (key -> modelState.get(key))
      }

      val evaluatorStateKeys = evaluatorState.keys().asScala
      for(key <- evaluatorStateKeys){
        val evaluatorBytes = evaluatorState.get(key)
        val evaluator: ModelEvaluator[_] = SerializationUtils.deserialize(evaluatorBytes)
        evaluators += (key -> evaluator)
      }

    }

  }

  override def snapshotState(ctx: FunctionSnapshotContext): Unit = {

    val id = ctx.getCheckpointId
    println(s"Checkpointing: ${id}")

    modelState.clear()
    evaluatorState.clear()

    models.foreach(model => modelState.put(model._1, model._2))

    val evaluatorKeys = evaluators.keys
    for(key <- evaluatorKeys){
      val evaluator = evaluators(key)
      val evaluatorBytes: Array[Byte] = SerializationUtils.serialize(evaluator.isInstanceOf[Serializable])
      evaluatorState.put(key, evaluatorBytes)
    }

  }

}
