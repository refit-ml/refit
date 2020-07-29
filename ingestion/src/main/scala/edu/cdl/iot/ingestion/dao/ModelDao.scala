package edu.cdl.iot.ingestion.dao

import org.skife.jdbi.v2.sqlobject.{Bind, SqlQuery}

trait ModelDao {
  @SqlQuery("select model from models where key = :version;")
  def getModel(@Bind("version") version: String): java.util.List[Array[Byte]]
}
