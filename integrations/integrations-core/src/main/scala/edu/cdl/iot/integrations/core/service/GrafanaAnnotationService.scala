package edu.cdl.iot.integrations.core.service

import edu.cdl.iot.integrations.core.response.{AnnotationFixtures, AnnotationResponse}

class GrafanaAnnotationService {
  def getAnnotations: Array[AnnotationResponse] =
    AnnotationFixtures.response
}
