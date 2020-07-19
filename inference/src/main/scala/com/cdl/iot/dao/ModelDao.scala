package com.cdl.iot.dao

import com.cdl.iot.dto.Model
import org.skife.jdbi.v2.sqlobject.SqlQuery


trait ModelDao {
  @SqlQuery("select model from models;")
  def getModel: java.util.List[Array[Byte]]
}
