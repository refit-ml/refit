package edu.cdl.iot.ingestion.constants

object PulsarConstants {
  val SUBSCRIPTION_NAME = "ingestion-consumer-subscription"
  val MESSAGE_ID_HEADER = "MESSAGE_ID_HEADER"
  val POLL_INTERVAL_MILLS = 5000
}
