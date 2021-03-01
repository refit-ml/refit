package edu.cdl.iot.data.postgres.mapper

import java.sql.ResultSet
import java.time.Instant
import java.util.UUID

import com.fasterxml.jackson.databind.ObjectMapper
import edu.cdl.iot.common.domain.StaticData
import org.jdbi.v3.core.mapper.RowMapper
import org.jdbi.v3.core.statement.StatementContext

import scala.collection.JavaConverters.mapAsScalaMapConverter

class StaticDataMapper extends RowMapper[StaticData] {
  private val mapper = new ObjectMapper()

  override def map(rs: ResultSet, ctx: StatementContext): StaticData = {
    StaticData(
      projectGuid = UUID.fromString(rs.getString("project_guid")),
      key = rs.getString("key"),
      createdAt = rs.getTimestamp("created_at").toInstant,
      doubles = mapper.readValue(rs.getString("doubles"), classOf[java.util.Map[String, Double]]).asScala.toMap,
      strings = mapper.readValue(rs.getString("strings"), classOf[java.util.Map[String, String]]).asScala.toMap,
      integers = mapper.readValue(rs.getString("integers"), classOf[java.util.Map[String, Int]]).asScala.toMap,
      timestamps = mapper.readValue(rs.getString("timestamps"), classOf[java.util.Map[String, Instant]]).asScala.toMap
    )
  }

}