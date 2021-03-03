package edu.cdl.iot.inference.application.transform

import edu.cdl.iot.common.factories.ConfigFactory
import edu.cdl.iot.data.minio.MinioRepository
import edu.cdl.iot.inference.application.Helpers
import edu.cdl.iot.inference.core.evaluator.{EvaluatorFactory, RefitEvaluator}
import edu.cdl.iot.inference.minio.InferenceMinioModelFileRepository
import edu.cdl.iot.protocol.Model.Model
import edu.cdl.iot.protocol.Prediction.Prediction
import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.flink.api.common.state.{MapState, MapStateDescriptor}
import org.apache.flink.configuration.Configuration
import org.apache.flink.runtime.state.{FunctionInitializationContext, FunctionSnapshotContext}
import org.apache.flink.streaming.api.checkpoint.CheckpointedFunction
import org.apache.flink.streaming.api.functions.co.KeyedCoProcessFunction
import org.apache.flink.util.Collector
import org.slf4j.LoggerFactory

class EvaluationProcessor extends KeyedCoProcessFunction[String, SensorData, Model, Prediction] with CheckpointedFunction {
  private lazy val logger = LoggerFactory.getLogger(classOf[EvaluationProcessor])
  private var evaluators: Map[String, RefitEvaluator] = _
  private var evaluatorState: MapState[String, Array[Byte]] = _

  private lazy val modelFileRepository = {
    val minioConfig = new ConfigFactory().getConfig.getMinioConfig()
    logger.info(s"Received minio config from environment: ${minioConfig.host}:${minioConfig.accessKey}:${minioConfig.secretKey}")
    val minioRepository = new MinioRepository(minioConfig)
    new InferenceMinioModelFileRepository(minioRepository)
  }

  override def processElement1(value: SensorData, ctx: KeyedCoProcessFunction[String, SensorData, Model, Prediction]#Context, out: Collector[Prediction]): Unit = {
    val key = ctx.getCurrentKey

    if (evaluators.contains(key)) {
      val evaluator = evaluators(key)
      val prediction = evaluator.getPrediction(value)
      logger.info(s"Prediction Made (${prediction} ${value})")
      out.collect(prediction)
    }
    else {
      println("No Model in state, empty prediction")
      out.collect(Helpers.emptyPrediction(value))
    }
  }

  override def processElement2(model: Model, ctx: KeyedCoProcessFunction[String, SensorData, Model, Prediction]#Context, out: Collector[Prediction]): Unit = {
    logger.info(s"Model update: ${model.modelGuid}")
    val modelBytes = modelFileRepository.getModel(model.path)
    val key = ctx.getCurrentKey
    try {
      evaluators += (
        key -> EvaluatorFactory.getEvaluator(model, modelBytes))
      println("Model updated")
    }
    catch {
      case ex: Throwable => println(s"Error parsing model: ${ex.toString}")
    }


  }

  override def open(conf: Configuration): Unit = {
    evaluators = Map[String, RefitEvaluator]()
  }

  override def initializeState(context: FunctionInitializationContext): Unit = {
    val evaluatorStateDescriptor = new MapStateDescriptor[String, Array[Byte]]("EvaluatorState", classOf[String], classOf[Array[Byte]])
    evaluatorState = context.getKeyedStateStore.getMapState[String, Array[Byte]](evaluatorStateDescriptor)
    evaluators = Map()
  }

  override def snapshotState(ctx: FunctionSnapshotContext): Unit = {
    //    val id = ctx.getCheckpointId
    //    evaluatorState.keys().asScala.foreach(evaluatorState.remove)
    //    println(s"Checkpointing: ${id}")
    //    evaluators.foreach(x => evaluatorState.put(x._1, x._2.toByteArray))
  }

}