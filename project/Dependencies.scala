object Dependencies {

  val training = Seq(
    Libraries.sparkCore,
    Libraries.sparkSql,
    Libraries.sparkMl,
    Libraries.sparkJpmml,
    Libraries.sparkMLeap,
    Libraries.sparkCassandra,
    Libraries.pulsar
  )

  val inference = Seq(
    Libraries.flinkScala,
    Libraries.flinkStreaming,
    Libraries.pulsarFlink,
    Libraries.jpmml,
    Libraries.jaxb,
    Libraries.onnx,
    Libraries.scalaTest
  )

  val shared = Seq(
    Libraries.protobuf,
    Libraries.joda
  )

  val common = Seq(
    Libraries.codec,
    Libraries.snakeYaml
  )

  val cassandraDependencies = Seq(
    Libraries.cassandra
  )

  val pulsarDependencies = Seq(
    Libraries.pulsar
  )

  val testDependencies = Seq(
    Libraries.scalaTest
  )

  val ingestion = Seq(
    Libraries.camelCore,
    Libraries.camelJackson,
    Libraries.camelNetty,
    Libraries.camelRest,
    Libraries.pulsar
  )

  val integrations = Seq(
    Libraries.camelCore,
    Libraries.camelJackson,
    Libraries.camelNetty,
    Libraries.camelRest,
    Libraries.pulsar
  )

}