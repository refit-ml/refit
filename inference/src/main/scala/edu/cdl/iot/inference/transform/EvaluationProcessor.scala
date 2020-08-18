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


  private var evaluator: Map[String, ModelEvaluator[_]] = _
  private var modelGuid: Map[String, String] = _
  private var evaluatorState: MapState[String, ModelEvaluator[_]] = _
  private var modelState: MapState[String, String] = _

  override def processElement1(value: SensorData, ctx: KeyedCoProcessFunction[String, SensorData, Model, Prediction]#Context, out: Collector[Prediction]): Unit = {
    if (evaluator != null) {
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
          modelGuid,
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
    modelGuid = model.key
    evaluator = new LoadingModelEvaluatorBuilder()
      .load(new ByteArrayInputStream(model.bytes.toByteArray))
      .build();
    println("Model updated")

  }

  override def open(conf: Configuration): Unit = {
    evaluator = null
  }

  override def initializeState(context: FunctionInitializationContext): Unit = {

    val ModelStateDescriptor = new MapStateDescriptor[String, String]("ModelState", classOf[String], classOf[String])
    modelState = getRuntimeContext.getMapState[String, String](ModelStateDescriptor)

    val EvaluatorStateDescriptor = new MapStateDescriptor[String, ModelEvaluator[_]]("EvaluatorState", classOf[String], classOf[ModelEvaluator[_]])
    evaluatorState = context.getKeyedStateStore.getMapState[String, ModelEvaluator[_]](EvaluatorStateDescriptor)


  }

  override def snapshotState(snapshotContext: FunctionSnapshotContext): Unit = {
    for ((guidkey, guid) <- modelGuid) {
      modelState.remove(guidkey)
      modelState.put(guidkey, guid)
    }

    for ((evalkey, eval) <- evaluator) {
      evaluatorState.remove(evalkey)
      evaluatorState.put(evalkey, eval)
    }

  }

}
