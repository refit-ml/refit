package edu.cdl.iot.integrations.core.service

import java.util.UUID

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.domain.Sensor
import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.schema.enums.FieldClassification
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.common.util.{PredictionHelper, TimestampHelper}
import edu.cdl.iot.integrations.core.repository.{IntegrationsPredictionRepository, IntegrationsProjectRepository, IntegrationsSensorRepository}
import edu.cdl.iot.protocol.Prediction.Prediction
import org.joda.time.DateTimeZone

import scala.collection.mutable

class PredictionService(private val config: RefitConfig,
                        projectRepository: IntegrationsProjectRepository,
                        sensorRepository: IntegrationsSensorRepository,
                        predictionRepository: IntegrationsPredictionRepository) {

  private val ENCRYPTION_KEY: String = config.getEncryptionKey()

  val encryptionHelpers: mutable.HashMap[String, EncryptionHelper] = new mutable.HashMap[String, EncryptionHelper]()

  def getSchema(projectGuid: UUID): Schema =
    projectRepository.find(projectGuid).schema

  def savePrediction(prediction: Prediction, schema: Schema): Unit = {
    val helper = encryptionHelpers.getOrElseUpdate(prediction.projectGuid, {
      // This is slow, so we delay evaluation and only compute once when we need it
      new EncryptionHelper(ENCRYPTION_KEY, prediction.projectGuid)
    })
    val readings = PredictionHelper.combineSensorReadings(prediction)
    val features = readings.filterKeys(key => schema.fields.exists(field => field.name.toLowerCase() == key && field.classification == FieldClassification.Feature))
    val labels = readings
      .filterKeys(key => schema.fields.exists(field => field.name.toLowerCase() == key && field.classification == FieldClassification.Label)).++(prediction.labels)

    val data = helper.transform(features)
    val actual = helper.transform(labels)
    val predictions = helper.transform(prediction.prediction)

    val date = TimestampHelper.parseDate(prediction.timestamp).toDateTime(DateTimeZone.UTC)
    val timestamp = TimestampHelper.toTimestamp(date)
    val partition = schema.getPartitionString(date)

    predictionRepository.savePrediction(
      partition = partition,
      timestamp = timestamp,
      projectGuid = prediction.projectGuid,
      sensorId = prediction.sensorId,
      data = data,
      predictions = predictions,
      labels = actual
    )

    sensorRepository.createSensors(
      Seq(Sensor(
        projectGuid = prediction.projectGuid,
        sensorId = prediction.sensorId,
        createdAt = timestamp
      )))
  }

}
