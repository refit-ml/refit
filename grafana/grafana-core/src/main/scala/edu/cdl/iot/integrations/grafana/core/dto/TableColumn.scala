package edu.cdl.iot.integrations.grafana.core.dto

class TableColumn(text: String, `type`: String) {
  def getText: String = text

  def getType: String = `type`

}
