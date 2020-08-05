package edu.cdl.iot.ingestion.dao

import org.skife.jdbi.v2.sqlobject.{Bind, SqlQuery}

trait ModelDao {
  @SqlQuery("select model from models where project_guid = :project_guid and model_guid = :model_guid;")
  def getModel(@Bind("project_guid") projectGuid: String, @Bind("model_guid") modelGuid: String): java.util.List[Array[Byte]]
}
