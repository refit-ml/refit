package edu.cdl.iot.integrations.grafana.core.service

import edu.cdl.iot.integrations.grafana.core.response.{AnnotationFixtures, AnnotationResponse}

class GrafanaAnnotationService {
  def getAnnotations: Array[AnnotationResponse] =
    AnnotationFixtures.response
}
