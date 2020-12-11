object Dependencies {
  val shared = Seq(
    Libraries.protobuf,
    Libraries.joda,
    Libraries.selfForj,
    Libraries.selfForjSimple
  )

  val cassandraDependencies = Seq(
    Libraries.cassandra
  )

  val testDependencies = Seq(
    Libraries.scalaTest
  )

  val common = Seq(
    Libraries.codec,
    Libraries.snakeYaml
  )

  val inference = Seq(
    Libraries.flinkScala,
    Libraries.flinkStreaming,
    Libraries.flinkKafka,
    Libraries.flinkClients,
    Libraries.jpmml,
    Libraries.jaxb,
    Libraries.onnx,
    Libraries.scalaTest,
    Libraries.jackson,
    Libraries.gson
  )

  val ingestion = Seq(
    Libraries.camelCore,
    Libraries.camelJackson,
    Libraries.camelNetty,
    Libraries.camelRest,
    Libraries.minio,
    Libraries.kakfaCamel
  )

  val camel = Seq(
    Libraries.camelCore,
    Libraries.camelJackson,
    Libraries.camelNetty,
    Libraries.camelRest,
    Libraries.logBack
  )

  val integrations = Seq(
    Libraries.camelCore,
    Libraries.camelJackson,
    Libraries.camelNetty,
    Libraries.camelRest,
    Libraries.kakfaCamel
  )

}