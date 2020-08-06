package edu.cdl.iot.inference.transform

import java.io.ByteArrayInputStream
import java.util.concurrent.locks.{Lock, ReadWriteLock}

import edu.cdl.iot.inference.util.helpers
import edu.cdl.iot.protocol.Model.Model
import edu.cdl.iot.protocol.Prediction.Prediction
import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.flink.api.common.state.{ValueState, ValueStateDescriptor}
import org.apache.flink.configuration.Configuration
import org.apache.flink.runtime.state.FunctionSnapshotContext
import org.apache.flink.streaming.api.checkpoint.CheckpointedFunction
import org.apache.flink.streaming.api.functions.co.KeyedCoProcessFunction
import org.apache.flink.util.Collector
import org.jpmml.evaluator.{EvaluatorUtil, LoadingModelEvaluatorBuilder, ModelEvaluator}

import scala.collection.JavaConverters.mapAsScalaMapConverter
import collection.JavaConverters.mapAsJavaMapConverter

class EvaluationProcessor extends KeyedCoProcessFunction[String, SensorData, Model, Prediction] {

  private var evaluator: ModelEvaluator[_] = _
  private var modelGuid: String = "__NONE__"
  
  var ModelState: ValueState[String] = _

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
    
    //this.ModelState.update(model.key)

  }

  override def open(conf: Configuration): Unit = {
    evaluator = null
    
    //val ModelStateDescriptor = new ValueStateDescriptor[String]("ModelState", classOf[String])
    //ModelState = getRuntimeContext.getState[String](ModelStateDescriptor)

  }
  
  override def initializeState(context: FunctionInitializationContext): Unit = {

    val ModelStateDescriptor = new ValueStateDescriptor[String]("ModelState", classOf[String])
    ModelState = getRuntimeContext.getState[String](ModelStateDescriptor)
  }
  
  override def snapshotState(snapshotContext: FunctionSnapshotContext): Unit = {
    ModelState.clear()
    ModelState.update(modelGuid)
  }

}
