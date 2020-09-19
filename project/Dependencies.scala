object Dependencies {
  val shared = Seq(
    Libraries.protobuf,
    Libraries.joda
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

  val common = Seq(
    Libraries.codec,
    Libraries.snakeYaml
  )

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

  val ingestion = Seq(
    Libraries.camelCore,
    Libraries.camelJackson,
    Libraries.camelNetty,
    Libraries.camelRest,
    Libraries.pulsar,
    Libraries.minio
  )

  val integrations = Seq(
    Libraries.camelCore,
    Libraries.camelJackson,
    Libraries.camelNetty,
    Libraries.camelRest,
    Libraries.pulsar
  )

}