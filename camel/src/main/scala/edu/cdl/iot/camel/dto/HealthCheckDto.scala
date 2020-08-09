package edu.cdl.iot.camel.dto

// This has to be a java POJO unfortunatly
// So we need to specify the getMessage getter to get a
// "message" item in our JSON response
class HealthCheckDto(message: String = "pong") {
  def getMessage: String = message
}
