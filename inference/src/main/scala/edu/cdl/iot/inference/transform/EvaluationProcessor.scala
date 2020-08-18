package edu.cdl.iot.inference.transform

import java.io.ByteArrayInputStream

import edu.cdl.iot.inference.util.helpers
import edu.cdl.iot.protocol.Model.Model
import edu.cdl.iot.protocol.Prediction.Prediction
import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.flink.api.common.state.{MapState, MapStateDescriptor}
import org.apache.flink.configuration.Configuration
import org.apache.flink.runtime.state.{FunctionInitializationContext, FunctionSnapshotContext}
import org.apache.flink.streaming.api.checkpoint.CheckpointedFunction
import org.apache.flink.streaming.api.functions.co.KeyedCoProcessFunction
import org.apache.flink.util.Collector
import org.jpmml.evaluator.{EvaluatorUtil, LoadingModelEvaluatorBuilder, ModelEvaluator}

import scala.collection.JavaConverters.{mapAsJavaMapConverter, mapAsScalaMapConverter}

class EvaluationProcessor extends KeyedCoProcessFunction[String, SensorData, Model, Prediction] with CheckpointedFunction {

  private var evaluators: Map[String, ModelEvaluator[_]] = _
  private var models: Map[String, String] = _
  private var evaluatorState: MapState[String, ModelEvaluator[_]] = _
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

    val ModelStateDescriptor = new MapStateDescriptor[String, String]("ModelState", classOf[String], classOf[String])
    modelState = getRuntimeContext.getMapState[String, String](ModelStateDescriptor)

    val EvaluatorStateDescriptor = new MapStateDescriptor[String, ModelEvaluator[_]]("EvaluatorState", classOf[String], classOf[ModelEvaluator[_]])
    evaluatorState = context.getKeyedStateStore.getMapState[String, ModelEvaluator[_]](EvaluatorStateDescriptor)


    // modelState.keys()(key => models(key) = modelState.get(key))
    // Different syntax but should be doing the same as below

    val Keys = modelState.keys()
    for(key <- Keys){
      models += (key -> modelState.get(key))
    }

    // TODO: We need to add the elements from modelState to models HERE

    // TODO: We need to add the elements from evaluatorState to evaluators HERE


  }

  override def snapshotState(ctx: FunctionSnapshotContext): Unit = {
    val id = ctx.getCheckpointId
    println(s"Checkpointing: ${id}")
    modelState.clear()
    evaluatorState.clear()

    models.foreach(model => modelState.put(model._1, model._2))
    evaluators.foreach(evaluator => evaluatorState.put(evaluator._1, evaluator._2))
  }

}
