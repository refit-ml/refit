
lazy val `inference-core` = project in file("../inference-core")

name := "inference-application"
Settings.assembly

libraryDependencies ++= Dependencies.flink
libraryDependencies ++= Dependencies.gson
libraryDependencies ++= Dependencies.jackson
mainClass in assembly := Some("edu.cdl.iot.inference.Main")
assemblyJarName in assembly := "inference.jar"

dependsOn(Shared.protocol, Shared.common, `inference-core`)

