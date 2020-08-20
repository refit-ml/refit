package edu.cdl.iot.camel.dto

import java.time.Instant

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