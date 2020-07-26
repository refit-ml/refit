package com.cdl.iot.transform

import java.io.ByteArrayInputStream
import java.util.concurrent.locks.{Lock, ReadWriteLock}

import cdl.iot.dto.Model.Model
import cdl.iot.dto.Prediction.Prediction
import cdl.iot.dto.SensorData.SensorData
import com.cdl.iot.util.helpers
import org.apache.flink.configuration.Configuration
import org.apache.flink.streaming.api.functions.co.CoProcessFunction
import org.apache.flink.util.Collector
import org.jpmml.evaluator.{EvaluatorUtil, LoadingModelEvaluatorBuilder, ModelEvaluator}

import scala.collection.JavaConverters.mapAsScalaMapConverter
import collection.JavaConverters.mapAsJavaMapConverter

class EvaluationProcessor extends CoProcessFunction[SensorData, Model, Prediction] {

  private var readWriteLock: ReadWriteLock = _
  private var evaluator: ModelEvaluator[_] = _
  private var modelGuid: String = "__NONE__"

  override def processElement1(value: SensorData, ctx: CoProcessFunction[SensorData, Model, Prediction]#Context, out: Collector[Prediction]): Unit = {
    if (evaluator != null) {
      val p = evaluator.evaluate(helpers.getVector(value).asJava)
      val results = EvaluatorUtil.decodeAll(p).asScala
      val prediction: Map[String, String] = results.map(
        { case (x, d) =>
          x -> d.toString
        }).toMap

      println(s"Prediction Made (modelGuid: ${modelGuid}): ${prediction}")

      out.collect(
        new Prediction(
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

  override def processElement2(model: Model, ctx: CoProcessFunction[SensorData, Model, Prediction]#Context, out: Collector[Prediction]): Unit = {
    println(s"Model update: ${model.key}")
    modelGuid = model.key
    evaluator = new LoadingModelEvaluatorBuilder()
      .load(new ByteArrayInputStream(model.bytes.toByteArray))
      .build();
  }

  override def open(conf: Configuration): Unit = {
    evaluator = null
    readWriteLock = new ReadWriteLock {
      override def readLock(): Lock = ???

      override def writeLock(): Lock = ???
    }

  }

}