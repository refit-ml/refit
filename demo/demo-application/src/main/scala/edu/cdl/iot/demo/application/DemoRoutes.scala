package edu.cdl.iot.demo.application

import edu.cdl.iot.common.yaml.KafkaConfig
import edu.cdl.iot.demo.core.DemoService
import edu.cdl.iot.protocol.SensorData.SensorData
import org.apache.camel.{CamelContext, Exchange}
import org.apache.camel.builder.RouteBuilder
import org.apache.camel.component.kafka.KafkaConstants

class DemoRoutes(kafkaConfig: KafkaConfig,
                 demoService: DemoService,
                 context: CamelContext) extends RouteBuilder(context) {
  private val PROCESS_INTERVAL = 5000
  private val PROJECT_GUID = "b6ee5bab-08dd-49b0-98b6-45cd0a28b12f"

  override def configure(): Unit = {
    from(s"timer://sensor-data?period=$PROCESS_INTERVAL")
      .process((exchange: Exchange) => {
        val readings = demoService.generateDemoData(PROJECT_GUID)
        exchange.getIn.setBody(readings)
      })
      .process((exchange: Exchange) => {
        val record = exchange.getIn.getBody(classOf[SensorData])
        val key = s"${record.projectGuid}_${record.sensorId}_${record.timestamp}".getBytes()
        exchange.getIn().setHeader(KafkaConstants.KEY, key)
        exchange.getIn.setBody(record.toByteArray)
      })
      .to(s"kafka:${kafkaConfig.topics.data}?brokers=${kafkaConfig.host}")
  }
}
