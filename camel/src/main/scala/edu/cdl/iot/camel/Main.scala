package edu.cdl.iot.camel

import org.apache.camel.CamelContext
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.component.pulsar.PulsarComponent
import org.apache.camel.impl.{DefaultCamelContext, SimpleRegistry}
import org.apache.camel.spi
import org.apache.pulsar.client.api.PulsarClient

import scala.collection.immutable.HashMap

object Main {
  def main(args: Array[String]): Unit = {
    val client = PulsarClient.builder().serviceUrl("pulsar://127.0.0.1:6650").build()
    val registry = new SimpleRegistry
    registry.put("pulsarClient", client)

    val camel = new DefaultCamelContext(registry)
    val pulCompo = new PulsarComponent
    pulCompo.setPulsarClient(client)
    camel.addComponent("pulsar", pulCompo)
    camel.addRoutes(new RouteBuilder() {
      @throws[Exception]
      def configure(): Unit = {
        from("pulsar:persistent://sample/standalone/ns1/sensors").to("file:C:/Users/adity/Downloads/CDL Project/iot-prototype/camel/src/main/scala/edu/cdl/iot/camel/data/outbox/test.txt")
      }
    })

    camel.start()

    Thread.sleep(10000)

    camel.stop()
  }
}
