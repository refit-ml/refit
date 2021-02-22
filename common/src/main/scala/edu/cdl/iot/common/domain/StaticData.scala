package edu.cdl.iot.common.domain

import java.time.Instant
import java.util.UUID

case class StaticData(projectGuid: UUID,
                      key: String,
                      createdAt: Instant,
                      doubles: Map[String, Double],
                      strings: Map[String, String],
                      integers: Map[String, Int],
                      timestamps: Map[String, Instant])
