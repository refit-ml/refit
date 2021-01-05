package edu.cdl.iot.data.kafka.repository

import edu.cdl.iot.data.kafka.KafkaRepository
import edu.cdl.iot.protocol.ImportRequest.ImportRequest
import edu.cdl.iot.protocol.SensorData.SensorData

class KafkaSensorDataRepository(kafkaRepository: KafkaRepository) {

  def createSensorData(sensorData: SensorData): Unit =
    kafkaRepository.send(kafkaRepository.topics.data, sensorData.toByteArray)
}
