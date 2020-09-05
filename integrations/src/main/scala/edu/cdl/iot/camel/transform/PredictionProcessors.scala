package edu.cdl.iot.camel.transform

import edu.cdl.iot.camel.dao.PredictionDao
import edu.cdl.iot.common.config.RefitConfig
import edu.cdl.iot.common.schema.Schema
import edu.cdl.iot.common.schema.enums.FieldClassification
import edu.cdl.iot.protocol.Prediction.Prediction
import org.apache.camel.{Exchange, Processor}
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.common.util.PredictionHelper

import scala.collection.mutable

class PredictionProcessors(private val config: RefitConfig,
                           private val predictionDao: PredictionDao) {

  val ENCRYPTION_KEY: String = config.getEncryptionKey()
  val SCHEMA_HEADER = "REFIT_SCHEMA"
  val ORG_HEADER = "REFIT_ORG"
  val QUERY_PARTITIONS_HEADER = "REFIT_QUERY_PARTITIONS"
  val decryptionHelpers: mutable.HashMap[String, EncryptionHelper] = new mutable.HashMap[String, EncryptionHelper]()


  val sendToCassandra: Processor = new Processor {
    val encryptionHelpers: mutable.HashMap[String, EncryptionHelper] = new mutable.HashMap[String, EncryptionHelper]()

    override def process(exchange: Exchange): Unit = {
      val record = exchange.getIn().getBody(classOf[Prediction])
      val schema = exchange.getIn.getHeader(SCHEMA_HEADER).asInstanceOf[Schema]
      val helper = encryptionHelpers.getOrElseUpdate(record.projectGuid, {
        // This is slow, so we delay evaluation and only compute once when we need it
        new EncryptionHelper(ENCRYPTION_KEY, record.projectGuid)
      })

      val readings = PredictionHelper.combineSensorReadings(record)
      val features = readings.filterKeys(key => schema.fields.exists(field => field.name.toLowerCase() == key && field.classification == FieldClassification.Feature))
      val labels = readings
        .filterKeys(key => schema.fields.exists(field => field.name.toLowerCase() == key && field.classification == FieldClassification.Label)).++(record.labels)

      val data = helper.transform(features)
      val actual = helper.transform(labels)
      val predictions = helper.transform(record.prediction)
      predictionDao.savePrediction(schema, record, data, predictions, actual)
    }
  }
}
