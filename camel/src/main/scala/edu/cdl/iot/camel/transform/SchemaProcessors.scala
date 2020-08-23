package edu.cdl.iot.camel.transform

import edu.cdl.iot.camel.dao.CassandraDao
import edu.cdl.iot.camel.dto.request.{QueryFilters, QueryRequest}
import edu.cdl.iot.common.schema.Schema
import org.apache.camel.{Exchange, Processor}
import org.joda.time.DateTime

import scala.collection.mutable

object SchemaProcessors {
  val SCHEMA_HEADER = "REFIT_SCHEMA"
  val ORG_HEADER = "REFIT_ORG"
  val QUERY_PARTITIONS = "REFIT_QUERY_PARTITIONS"

  private val isEqualToType: (QueryFilters, String) => Boolean =
    (filter: QueryFilters, key: String) =>
      filter.operator == "=" && filter.key == key


  val extractOrg: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val record = exchange.getIn.getBody(classOf[QueryRequest])
      val orgGuid = record.adhocFilters
        .filter(x => isEqualToType(x, "org"))
        .head.value
        .split(" - ")
        .last
        .trim

      exchange.getIn.setHeader(ORG_HEADER, orgGuid)
    }
  }

  val extractSchema: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val record = exchange.getIn.getBody(classOf[QueryRequest])
      val orgGuid = exchange.getIn.getHeader(ORG_HEADER, classOf[String])
      val projectGuid = record.adhocFilters
        .filter(x => isEqualToType(x, "project"))
        .head.value
        .split(" - ")
        .last
        .trim
      val schema = CassandraDao.getProjectSchema(orgGuid, projectGuid)
      exchange.getIn.setHeader(SCHEMA_HEADER, schema)
    }
  }

  val getQueryPartitions: Processor = new Processor {
    override def process(exchange: Exchange): Unit = {
      val record = exchange.getIn.getBody(classOf[QueryRequest])
      val schema = exchange.getIn.getHeader(SCHEMA_HEADER).asInstanceOf[Schema]
      val from = DateTime.parse(record.range.from)
      val to = DateTime.parse(record.range.to)

      val partitions = mutable.Set[String]()
      var cursor = from
      while (to.getMillis > cursor.getMillis) {
        partitions.add(schema.getPartitionString(cursor))
        cursor = schema.getNextPartition(cursor)
      }

      exchange.getIn.setHeader(QUERY_PARTITIONS, partitions.toList)

      println(s"Calculated ${partitions.size} partitions")
    }
  }


}
