package edu.cdl.iot.ingestion

import com.sksamuel.pulsar4s.PulsarClient
import edu.cdl.iot.ingestion.actions.{Ingestion, Models, Predictions}

object Main {

  def env(name: String, default: String): String = if (sys.env.contains(name)) sys.env(name) else default


  def main(args: Array[String]) {
    val sleepIntervalMils = env("INTERVAL_MILS", "5000").toInt
    val hostName = env("PULSAR_HOST", "127.0.0.1")
    val topicName = env("TOPIC_NAME", "sensors")
    val modelTopic = env("MODEL_TOPIC", "models")
    val namespace = env("NAMESPACE_NAME", "ns1")
    val cassandraHost = env("CASSANDRA_HOST", "127.0.0.1")
    val cassandraUsername = env("CASSANDRA_USER", "cassandra")
    val cassandraPassword = env("CASSANDRA_PASSWORD", "cassandra")
    val modelVersion = env("MODEL_VERSION", "__latest__")
    val action = env("ACTION", "ingest")

    println(s"Run with action: $action")
    val client = PulsarClient(s"pulsar://$hostName:6650")

    action match {
      case "ingest" => Ingestion.simulate(client,
        namespace,
        topicName,
        sleepIntervalMils)
      case "model" => Models.sendModel(client,
        cassandraHost,
        cassandraUsername,
        cassandraPassword,
        modelVersion,
        namespace,
        modelTopic)
      case "inference" => Predictions.simulate(client,
        namespace,
        "predictions",
        sleepIntervalMils)
      case _ => println("No action specified")
    }

    client.close()
  }
}
