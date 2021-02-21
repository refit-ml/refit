package edu.cdl.iot.integrations.grafana.core.dto

case class GrafanaSensorDataDto(projectGuid: String,
                                `type`: String,
                                targets: List[String], // take in list of targets (list of strings)
                                sensorId: String = null,
                                data: List[Map[String, String]])

case class GrafanaSensorsDto(projectGuid: String,
                            `type`: String,
                            targets: List[String], //take in list of targets
                            sensors: List[String])