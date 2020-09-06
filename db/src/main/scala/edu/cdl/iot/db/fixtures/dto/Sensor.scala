package edu.cdl.iot.db.fixtures.dto

import java.sql.Timestamp

case class Sensor(projectGuid: String,
                  sensorId: String,
                  createdAt: Timestamp)
