
lazy val `inference-core` = project in file("../inference-core")

name := "inference-application"
Settings.default
baseAssemblySettings
libraryDependencies ++= Dependencies.flink
libraryDependencies ++= Dependencies.gson
libraryDependencies ++= Dependencies.jackson
mainClass in assembly := Some("edu.cdl.iot.inference.Main")
assemblyJarName in assembly := "inference.jar"
assemblyMergeStrategy in assembly := {
  case PathList("javax", xs@_*) => MergeStrategy.first
  case "module-info.class" => MergeStrategy.first
  case PathList("google", "protobuf", xs@_*) => MergeStrategy.first
  case PathList("commons-configuration", "commons-configuration", xs@_*) => MergeStrategy.first
  case PathList("org", "apache", "avro", "reflect", xs@_*) => MergeStrategy.first
  case PathList("org", "apache", "spark", xs@_*) => MergeStrategy.first
  case PathList("META-INF", "versions", "9", "javax", "xml", "bind", xs@_*) => MergeStrategy.last
  case PathList("META-INF", "io.netty.versions.properties", xs@_*) => MergeStrategy.last
  case PathList("org", "slf4j", "impl", xs@_*) => MergeStrategy.first
  case x =>
    val oldStrategy = (assemblyMergeStrategy in assembly).value
    oldStrategy(x)
}
dependsOn(Shared.protocol, Shared.common, `inference-core`)

