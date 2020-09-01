package edu.cdl.iot.ingestion.transform

import com.google.protobuf.ByteString
import edu.cdl.iot.ingestion.dao.ModelDao
import edu.cdl.iot.protocol.Model.{Model, SerializationFormat}
import org.apache.camel.{Exchange, Processor}

object ModelProcessors {
  val getProjects: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val projects = ModelDao.getProjects
      exchange.getIn.setBody(projects)
    }
  }
  val getModels: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val projects = exchange.getIn.getBody(classOf[List[String]])
      val models = projects.map(project_guid => {
        val modelGuid = ModelDao.getModelGuid(project_guid)
        val modelBytes = ModelDao.getModel(project_guid, modelGuid)
        Model(project_guid, modelGuid, ByteString.copyFrom(modelBytes), SerializationFormat.PMML)
      })
      exchange.getIn.setBody(models)
    }
  }
}
