package edu.cdl.iot.ingestion.dto

import java.sql.Timestamp

case class Sensor(projectGuid: String,
                  sensorId: String,
                  createdAt: Timestamp)
