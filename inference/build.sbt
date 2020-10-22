lazy val inference = (project in file("."))
  .settings(
    Settings.default,
    baseAssemblySettings,
    libraryDependencies ++= Dependencies.inference,
    /*val jacksonVersion = "2.11.2"
    libraryDependencies += "com.fasterxml.jackson.module" %% "jackson-module-parameter-names" % jacksonVersion,
    libraryDependencies += "com.fasterxml.jackson.datatype" %% "jackson-datatype-jdk8" % jacksonVersion,
    libraryDependencies += "com.fasterxml.jackson.datatype" %% "jackson-datatype-jsr310" % jacksonVersion,*/
    mainClass in assembly := Some("edu.cdl.iot.inference.Main"),
    assemblyJarName in assembly := "inference.jar",
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
  ).dependsOn(Shared.protocol, Shared.common)

