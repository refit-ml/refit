package edu.cdl.iot.common.domain

import java.sql.Timestamp

case class Sensor(projectGuid: String,
                  sensorId: String,
                  createdAt: Timestamp)
