
ThisBuild / resolvers ++= Seq(
  "Apache Development Snapshot Repository" at "https://repository.apache.org/content/repositories/snapshots/",
  "BinTray" at "https://dl.bintray.com/streamnative/maven",
  Resolver.mavenLocal
)

name := "Inference"

version := "1.0"

organization := "CDL"

ThisBuild / scalaVersion := "2.11.12"

val flinkVersion = "1.10.1"

val flinkDependencies = Seq(
  "org.apache.flink" %% "flink-scala" % flinkVersion, // % "provided",
  "org.apache.flink" %% "flink-streaming-scala" % flinkVersion, // % "provided",
  "org.apache.pulsar" % "pulsar-flink" % "2.3.2" //% "provided"
)

lazy val root = (project in file(".")).
  settings(
    libraryDependencies ++= flinkDependencies
  )

libraryDependencies += "org.apache.flink" %% "flink-connector-cassandra" % flinkVersion
libraryDependencies += "org.jpmml" % "pmml-evaluator-extension" % "1.5.1"
libraryDependencies += "org.glassfish.jaxb" % "jaxb-runtime" % "2.3.2"
libraryDependencies += "joda-time" % "joda-time" % "2.10.6"
//libraryDependencies += "org.apache.flink" % "statefun-sdk" % "2.1.0"
libraryDependencies += "com.thesamet.scalapb" %% "scalapb-runtime" % "0.9.6"
//libraryDependencies += "io.streamnative.connectors" %% "pulsar-flink-connector" % "2.4.23"


mainClass in assembly := Some("com.cdl.iot.Main")

Compile / run := Defaults.runTask(Compile / fullClasspath,
  Compile / run / mainClass,
  Compile / run / runner
).evaluated

Compile / run / fork := true
Global / cancelable := true


assemblyJarName in assembly := "inference.jar"



PB.targets in Compile := Seq(
  scalapb.gen() -> (sourceManaged in Compile).value / "scalapb"
)

baseAssemblySettings

assemblyMergeStrategy in assembly := {
  case PathList("javax", xs@_*) => MergeStrategy.first
  case "module-info.class" => MergeStrategy.first
  case PathList("google", "protobuf", xs@_*) => MergeStrategy.first
  case PathList("org", "apache", "avro", "reflect", xs@_*) => MergeStrategy.first
  case PathList("META-INF", "versions", "9", "javax", "xml", "bind", xs@_*) => MergeStrategy.last
  case PathList("META-INF", "io.netty.versions.properties", xs@_*) => MergeStrategy.last

  case x =>
    val oldStrategy = (assemblyMergeStrategy in assembly).value
    oldStrategy(x)
}