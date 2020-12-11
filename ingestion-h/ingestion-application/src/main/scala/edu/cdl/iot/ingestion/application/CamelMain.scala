package edu.cdl.iot.ingestion.application

import edu.cdl.iot.ingestion.cassandra.Test
import edu.cdl.iot.ingestion.core.CoreTest

object CamelMain {
  def main(args: Array[String]) {
    println(f"Hello, world! ${Test.one} ${CoreTest.one}")
  }
}
