
lazy val `inference-core` = project in file("../inference-core")
lazy val `inference-minio` = project in file("../inference-minio")
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
  `inference-minio`
)

