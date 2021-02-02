import sbt._

object Libraries {
  val protobuf = "com.thesamet.scalapb" %% "scalapb-runtime" % scalapb.compiler.Version.scalapbVersion % "protobuf"
  val joda = "joda-time" % "joda-time" % Versions.joda
//  val cassandra = "com.datastax.cassandra" % "cassandra-driver-core" % Versions.cassandra
  val cassandra =  "com.datastax.oss" % "java-driver-core" % Versions.cassandra
  val pulsar = "com.sksamuel.pulsar4s" %% "pulsar4s-core" % Versions.pulsar4s

  val camelCore = "org.apache.camel" % "camel-core" % Versions.camel
  val camelRest = "org.apache.camel" % "camel-rest" % Versions.camel
  val camelJackson = "org.apache.camel" % "camel-jackson" % Versions.camel
  val camelNetty = "org.apache.camel" % "camel-netty-http" % Versions.camel
  val camelQuartz = "org.apache.camel" % "camel-quartz" % Versions.camel

  val logBack = "ch.qos.logback" % "logback-classic" % Versions.logback

  val flinkScala = "org.apache.flink" %% "flink-scala" % Versions.flink
  val flinkStreaming = "org.apache.flink" %% "flink-streaming-scala" % Versions.flink
  val flinkClients = "org.apache.flink" %% "flink-clients" % Versions.flink
  val pulsarFlink = "org.apache.pulsar" % "pulsar-flink" % "2.5.2"

  val postgres = "org.postgresql" % "postgresql" % Versions.postgres

  val jpmml = "org.jpmml" % "pmml-evaluator-extension" % Versions.pmml
  val jaxb = "org.glassfish.jaxb" % "jaxb-runtime" % Versions.jaxb
  val onnx = "com.microsoft.onnxruntime" % "onnxruntime" % Versions.onnx

  val codec = "commons-codec" % "commons-codec" % Versions.codec
  val snakeYaml = "org.yaml" % "snakeyaml" % Versions.snakeYaml
  val minio = "io.minio" % "minio" % Versions.minio

  val flinkKafka = "org.apache.flink" %% "flink-connector-kafka" % Versions.flink
  val kakfa = "org.apache.kafka" %% "kafka" % Versions.kafka
  val kakfaCamel = "org.apache.camel" % "camel-kafka" % Versions.camel

  val kubeClient = "io.kubernetes" % "client-java" % Versions.kubeClient

  val selfForj = "org.slf4j" % "slf4j-api" % Versions.self4J
  val selfForjSimple = "org.slf4j" % "slf4j-simple" % Versions.self4J

  val jackson = "com.fasterxml.jackson.module" %% "jackson-module-scala" % Versions.jackson
  val jdbi = "org.jdbi" % "jdbi3-core" % Versions.jdbi
  val jdbiSqlObject = "org.jdbi" % "jdbi3-sqlobject" % Versions.jdbi
  val jdbiPostgres = "org.jdbi" % "jdbi3-postgres" % Versions.jdbi


  val gson = "com.google.code.gson" % "gson" % Versions.gson

  // test dependencies
  val scalaTest = "org.scalatest" %% "scalatest" % Versions.scalaTest % Test


}