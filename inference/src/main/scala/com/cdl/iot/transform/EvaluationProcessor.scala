package com.cdl.iot.transform

import java.io.ByteArrayInputStream

import cdl.iot.dto.Model.Model
import cdl.iot.dto.SensorData.SensorData
import com.cdl.iot.util.helpers
import org.apache.flink.configuration.Configuration
import org.apache.flink.streaming.api.functions.co.CoProcessFunction
import org.apache.flink.util.Collector
import org.jpmml.evaluator.{EvaluatorUtil, LoadingModelEvaluatorBuilder, ModelEvaluator}

import scala.collection.JavaConverters.mapAsScalaMapConverter
import collection.JavaConverters.mapAsJavaMapConverter

class EvaluationProcessor extends CoProcessFunction[SensorData, Model, SensorData] {

  private var evaluator: ModelEvaluator[_] = _

  override def processElement1(value: SensorData, ctx: CoProcessFunction[SensorData, Model, SensorData]#Context, out: Collector[SensorData]): Unit = {
    if (evaluator != null) {
      val p = evaluator.evaluate(helpers.getVector(value).asJava)
      val results = EvaluatorUtil.decodeAll(p).asScala
      val prediction: Map[String, String] = results.map(
        { case (x, d) =>
          x -> d.toString
        }).toMap

      println(s"Prediction Made: ${prediction}")

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
    else {
      println("No Model in state, skipping")
    }

  }

  override def processElement2(model: Model, ctx: CoProcessFunction[SensorData, Model, SensorData]#Context, out: Collector[SensorData]): Unit = {
    println(s"Model update: ${model.key}")
    evaluator = new LoadingModelEvaluatorBuilder()
      .load(new ByteArrayInputStream(model.bytes.toByteArray))
      .build();
  }

  override def open(conf: Configuration): Unit = {
    evaluator = null

  }

}