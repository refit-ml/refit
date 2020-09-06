package edu.cdl.iot.camel.dto

import org.joda.time.DateTime

case class GrafanaSensorDataDto(projectGuid: String,
                                `type`: String,
                                target: String,
                                sensorId: String = null,
                                data: List[Map[String, String]])

case class GrafanaSensorsDto(projectGuid: String,
                            `type`: String,
                            target: String,
                            sensors: List[String])