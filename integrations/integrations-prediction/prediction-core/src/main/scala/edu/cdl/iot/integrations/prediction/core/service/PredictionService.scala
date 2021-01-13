package edu.cdl.iot.integrations.prediction.core.service

import java.util.UUID

import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.domain.Sensor
import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.schema.enums.FieldClassification
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.common.util.{PredictionHelper, TimestampHelper}
import edu.cdl.iot.integrations.prediction.core.repository.{PredictionProjectRepository, PredictionSensorDataRepository, PredictionSensorRepository}
import edu.cdl.iot.protocol.Prediction.Prediction
import org.joda.time.DateTimeZone

import scala.collection.mutable

class PredictionService(projectRepository: PredictionProjectRepository,
                        sensorRepository: PredictionSensorRepository,
                        predictionRepository: PredictionSensorDataRepository,
                        encryptionHelperProvider: String => EncryptionHelper) {

  def getSchema(projectGuid: UUID): Schema =
    projectRepository.find(projectGuid).schema

  def savePrediction(prediction: Prediction, schema: Schema): Unit = {
    val helper = encryptionHelperProvider(schema.projectGuid.toString)
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

    predictionRepository.save(
      partition = partition,
      timestamp = timestamp,
      projectGuid = prediction.projectGuid,
      sensorId = prediction.sensorId,
      data = data,
      predictions = predictions,
      labels = actual
    )

    sensorRepository.save(
      Seq(Sensor(
        projectGuid = prediction.projectGuid,
        sensorId = prediction.sensorId,
        createdAt = timestamp
      )))
  }

}
