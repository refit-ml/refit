package edu.cdl.iot.camel

import org.apache.camel.CamelContext
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.impl.DefaultCamelContext

object Main {
  def main(args: Array[String]): Unit = {
    val camel = new DefaultCamelContext

    camel.addRoutes(new RouteBuilder() {
      @throws[Exception]
      def configure(): Unit = {
//        from("pulsar:persistent://sample/standalone/ns1/sensors").to("file:C:/Users/adity/Downloads/CDL Project/iot-prototype/camel/src/main/scala/edu/cdl/iot/camel/data/outbox/test.txt")
      }
    })

    camel.start()

    Thread.sleep(10000)

    camel.stop()
  }
}
