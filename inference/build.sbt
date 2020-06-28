ThisBuild / resolvers ++= Seq(
  "Apache Development Snapshot Repository" at "https://repository.apache.org/content/repositories/snapshots/",
//  "BinTray" at "https://dl.bintray.com/streamnative/maven",
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

// make run command include the provided dependencies
Compile / run  := Defaults.runTask(Compile / fullClasspath,
  Compile / run / mainClass,
  Compile / run / runner
).evaluated

// stays inside the sbt console when we press "ctrl-c" while a Flink programme executes with "run" or "runMain"
Compile / run / fork := true
Global / cancelable := true

// exclude Scala library from assembly
// assembly / assemblyOption  := (assembly / assemblyOption).value.copy(includeScala = false)

assemblyJarName in assembly := "inference.jar"

assemblyMergeStrategy in assembly := {
 case PathList("META-INF", xs @ _*) => MergeStrategy.discard
 case x => MergeStrategy.first
}