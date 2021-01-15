package edu.cdl.iot.integrations.grafana.core.response

import java.time.Instant

import edu.cdl.iot.integrations.grafana.core.dto.Annotation

class AnnotationResponse(annotation: Annotation,
                         title: String,
                         time: Long,
                         text: String,
                         tags: String) {
  def getAnnotation: Annotation = annotation

  def getTitle: String = title

  def getTime: Long = time

  def getText: String = text

  def getTags: String = tags

}

object AnnotationFixtures {
  val response: Array[AnnotationResponse] = Array(
    new AnnotationResponse(
      new Annotation("Test Annotation", true),
      "Test Title",
      Instant.now().getEpochSecond,
      "text",
      "tags")
  )
}