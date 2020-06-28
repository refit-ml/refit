
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
  "org.apache.flink" %% "flink-scala" % flinkVersion % "provided",
  "org.apache.flink" %% "flink-streaming-scala" % flinkVersion % "provided"
)

libraryDependencies += "org.apache.pulsar" % "pulsar-flink" % "2.3.2"
//libraryDependencies += "io.streamnative.connectors" % "pulsar-flink-connector_2.11" % "2.4.23"


lazy val root = (project in file(".")).
  settings(
    libraryDependencies ++= flinkDependencies
  )

assembly / mainClass := Some("org.example.Main")

Compile / run  := Defaults.runTask(Compile / fullClasspath,
  Compile / run / mainClass,
  Compile / run / runner
).evaluated

Compile / run / fork := true
Global / cancelable := true


assemblyJarName in assembly := "inference.jar"

assemblyMergeStrategy in assembly := {
 case PathList("META-INF", xs @ _*) => MergeStrategy.discard
 case x => MergeStrategy.first
}
libraryDependencies += "com.thesamet.scalapb" %% "scalapb-runtime" % "0.9.6"
PB.targets in Compile := Seq(
  scalapb.gen() -> (sourceManaged in Compile).value / "scalapb"
)