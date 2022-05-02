object Dependencies {
  val shared = Seq(
    Libraries.protobuf,
    Libraries.joda,
    Libraries.selfForj,
    Libraries.selfForjSimple,
    Libraries.scalaTest
  )

  val cassandra = Seq(
    Libraries.cassandra
  )

  val kafka = Seq(
    Libraries.kakfa
  )

  val flink = Seq(
    Libraries.flinkScala,
    Libraries.flinkStreaming,
    Libraries.flinkKafka,
    Libraries.flinkClients
  )

  val jackson = Seq(
    Libraries.jackson
  )

  val gson = Seq(
    Libraries.gson
  )

  val pmml = Seq(
    Libraries.jpmml,
    Libraries.jaxb
  )

  val onnx = Seq(
    Libraries.onnx
  )

  val camel = Seq(
    Libraries.camelCore,
    Libraries.camelJackson,
    Libraries.camelNetty,
    Libraries.camelRest,
    Libraries.logBack,
    Libraries.kakfaCamel
  )

  val jdbi = Seq(
    Libraries.jdbi,
    Libraries.jdbiPostgres,
    Libraries.jdbiSqlObject
  )


  val minio = Seq(
    Libraries.minio
  )

  val caching = Seq(
    Libraries.scaffine
  )

}