import sbt._

object Libraries {
  val protobuf = "com.thesamet.scalapb" %% "scalapb-runtime" % scalapb.compiler.Version.scalapbVersion % "protobuf"
  val joda = "joda-time" % "joda-time" % Versions.joda
  val cassandra = "com.datastax.cassandra" % "cassandra-driver-core" % Versions.cassandra
  val pulsar = "com.sksamuel.pulsar4s" %% "pulsar4s-core" % Versions.pulsar4s

  val camelCore = "org.apache.camel" % "camel-core" % Versions.camel
  val camelRest = "org.apache.camel" % "camel-rest" % Versions.camel
  val camelJackson = "org.apache.camel" % "camel-jackson" % Versions.camel
  val camelNetty = "org.apache.camel" % "camel-netty-http" % Versions.camel

  val flinkScala = "org.apache.flink" %% "flink-scala" % Versions.flink
  val flinkStreaming = "org.apache.flink" %% "flink-streaming-scala" % Versions.flink
  val pulsarFlink = "org.apache.pulsar" % "pulsar-flink" % "2.5.2"
  val jpmml = "org.jpmml" % "pmml-evaluator-extension" % Versions.pmml
  val jaxb = "org.glassfish.jaxb" % "jaxb-runtime" % Versions.jaxb
  val onnx = "com.microsoft.onnxruntime" % "onnxruntime" % Versions.onnx

  val sparkCore = "org.apache.spark" %% "spark-core" % Versions.spark
  val sparkSql = "org.apache.spark" %% "spark-sql" % Versions.spark
  val sparkMl = "org.apache.spark" %% "spark-mllib" % Versions.spark
  val sparkJpmml = "org.jpmml" % "jpmml-sparkml" % Versions.pmml
  val sparkMLeap = "ml.combust.mleap" %% "mleap-spark-extension" % Versions.sparkMLeap
  val sparkCassandra = "com.datastax.spark" %% "spark-cassandra-connector" % Versions.sparkCassandra

  val codec = "commons-codec" % "commons-codec" % Versions.codec
  val snakeYaml = "org.yaml" % "snakeyaml" % Versions.snakeYaml
  val minio = "io.minio" % "minio" % Versions.minio

  val flinkKafka = "org.apache.flink" %% "flink-connector-kafka" % Versions.flink
  val kakfa = "org.apache.kafka" %% "kafka" % Versions.kafka
  val kakfaCamel = "org.apache.camel" % "camel-kafka" % Versions.camel

  val selfForj = "org.slf4j" % "slf4j-api" % Versions.self4J
  val selfForjSimple = "org.slf4j" % "slf4j-simple" % Versions.self4J


  // test dependencies
  val scalaTest = "org.scalatest" %% "scalatest" % Versions.scalaTest % Test
}