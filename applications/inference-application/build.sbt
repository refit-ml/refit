
lazy val `inference-core` = project in file("../../inference/inference-core")
lazy val `inference-minio` = project in file("../../inference/inference-minio")
lazy val `inference-jdbi` = project in file("../../inference/inference-jdbi")
name := "inference-application"
Settings.assembly

libraryDependencies ++= Dependencies.flink
libraryDependencies ++= Dependencies.gson
libraryDependencies ++= Dependencies.jackson
mainClass in assembly := Some("edu.cdl.iot.inference.application.Main")
assemblyJarName in assembly := "inference.jar"

dependsOn(
  Shared.protocol,
  Shared.common,
  `inference-core`,
  `inference-minio`,
  `inference-jdbi`
)

