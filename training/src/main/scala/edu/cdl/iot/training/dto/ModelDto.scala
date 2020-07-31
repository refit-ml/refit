package edu.cdl.iot.training.dto

case class ModelDto(project_guid: String,
                     model_guid: String,
                     timestamp: Long,
                     model: Array[Byte])