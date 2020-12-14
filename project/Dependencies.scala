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

  val kafka = Seq(
    Libraries.kakfaCamel
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
    Libraries.minio
  )

  val camel = Seq(
    Libraries.camelCore,
    Libraries.camelJackson,
    Libraries.camelNetty,
    Libraries.camelRest,
    Libraries.logBack,
    Libraries.kakfaCamel
  )

  val integrations = Seq(
    Libraries.camelCore,
    Libraries.camelJackson,
    Libraries.camelNetty,
    Libraries.camelRest,
    Libraries.kakfaCamel
  )

  val minio = Seq(
    Libraries.minio
  )

}