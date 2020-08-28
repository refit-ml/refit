package edu.cdl.iot.inference.transform

import edu.cdl.iot.inference.util.{Helpers, RefitEvaluator}
import edu.cdl.iot.protocol.Model.Model
import edu.cdl.iot.protocol.Prediction.Prediction
import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.flink.api.common.state.{MapState, MapStateDescriptor}
import org.apache.flink.configuration.Configuration
import org.apache.flink.runtime.state.{FunctionInitializationContext, FunctionSnapshotContext}
import org.apache.flink.streaming.api.checkpoint.CheckpointedFunction
import org.apache.flink.streaming.api.functions.co.KeyedCoProcessFunction
import org.apache.flink.util.Collector

import scala.collection.JavaConverters._

class EvaluationProcessor extends KeyedCoProcessFunction[String, SensorData, Model, Prediction] with CheckpointedFunction {

  private var evaluators: Map[String, RefitEvaluator] = _
  private var evaluatorState: MapState[String, Array[Byte]] = _

  override def processElement1(value: SensorData, ctx: KeyedCoProcessFunction[String, SensorData, Model, Prediction]#Context, out: Collector[Prediction]): Unit = {
    val key = ctx.getCurrentKey

    if (evaluators.contains(key)) {
      val evaluator = evaluators(key)
      val prediction = evaluator.getPrediction(value)
      println(s"Prediction Made (${prediction} ${value})")
      out.collect(prediction)
    }
    else {
      println("No Model in state, empty prediction")
      out.collect(Helpers.emptyPrediction(value))
    }
  }

  override def processElement2(model: Model, ctx: KeyedCoProcessFunction[String, SensorData, Model, Prediction]#Context, out: Collector[Prediction]): Unit = {
    println(s"Model update: ${model.key}")
    val key = ctx.getCurrentKey

    evaluators += (
      key -> new RefitEvaluator(model))

    println("Model updated")

  }

  override def open(conf: Configuration): Unit = {
    evaluators = Map[String, RefitEvaluator]()
  }

  override def initializeState(context: FunctionInitializationContext): Unit = {
    val evaluatorStateDescriptor = new MapStateDescriptor[String, Array[Byte]]("EvaluatorState", classOf[String], classOf[Array[Byte]])
    evaluatorState = context.getKeyedStateStore.getMapState[String, Array[Byte]](evaluatorStateDescriptor)

    evaluatorState.keys().asScala.foreach(
      key => evaluators +=
        (key -> new RefitEvaluator(evaluatorState.get(key))))

  }

  override def snapshotState(ctx: FunctionSnapshotContext): Unit = {
    val id = ctx.getCheckpointId
    println(s"Checkpointing: ${id}")
  }

}