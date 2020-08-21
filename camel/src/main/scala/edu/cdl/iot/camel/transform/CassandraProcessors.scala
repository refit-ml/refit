package edu.cdl.iot.camel.transform

import edu.cdl.iot.camel.dao.CassandraDao
import edu.cdl.iot.camel.dto.QueryRequest
import edu.cdl.iot.protocol.Prediction.Prediction
import org.apache.camel.{Exchange, Processor}
import edu.cdl.iot.common.security.EncryptionHelper
import edu.cdl.iot.common.util.PredictionHelper

import scala.collection.mutable

object CassandraProcessors {


  val sendToCassandra: Processor = new Processor {
    val ENCRYPTION_KEY = "keyboard_cat"
    val encryptionHelpers: mutable.HashMap[String, EncryptionHelper] = new mutable.HashMap[String, EncryptionHelper]()

    override def process(exchange: Exchange): Unit = {
      val record = exchange.getIn().getBody(classOf[Prediction])
      val helper = encryptionHelpers.getOrElseUpdate(record.projectGuid, {
        // This is slow, so we delay evaluation and only compute once when we need it
        new EncryptionHelper(ENCRYPTION_KEY, record.projectGuid)
      })

      val data = helper.transform(PredictionHelper.combineSensorReadings(record))
      val predictions = helper.transform(record.prediction)
      CassandraDao.savePrediction(record, data, predictions)
    }
  }

  val processGrafanaQuery: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val body = exchange.getIn.getBody(classOf[QueryRequest])

    }
  }

}
