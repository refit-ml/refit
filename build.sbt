name := "CDL IoT"
version := "1.0"
organization := "CDL"


ThisBuild / scalaVersion := "2.11.12"

Compile / run / fork := true
Global / cancelable := true

val flinkVersion = "1.10.1"
val pmmlVersion = "1.5.1"
val sparkVersion = "2.4.5"
val pulsar4sVersion = "2.4.0"

val commonDependencies = Seq(
  "com.thesamet.scalapb" %% "scalapb-runtime" % scalapb.compiler.Version.scalapbVersion % "protobuf",
)

lazy val settings = Seq(
  scalacOptions ++= Seq(
    "-unchecked",
    "-feature",
    "-language:existentials",
    "-language:higherKinds",
    "-language:implicitConversions",
    "-language:postfixOps",
    "-deprecation",
    "-encoding",
    "utf8"
  ),
  resolvers ++= Seq(
    "Apache Development Snapshot Repository" at "https://repository.apache.org/content/repositories/snapshots/",
    "BinTray" at "https://dl.bintray.com/streamnative/maven",
    Resolver.mavenLocal
  )
)




lazy val protocol = (project in file("protocol"))
  .settings(
    settings,
    libraryDependencies ++= commonDependencies,
    PB.targets in Compile := Seq(
      scalapb.gen() -> (sourceManaged in Compile).value / "scalapb"
    ),
    PB.protocVersion := "-v3.11.4",
  )




lazy val inference = (project in file("inference"))
  .settings(
    settings,
    libraryDependencies ++= commonDependencies,
    libraryDependencies ++=  Seq(
      "org.apache.flink" %% "flink-scala" % flinkVersion,
      "org.apache.flink" %% "flink-streaming-scala" % flinkVersion,
      "org.apache.pulsar" % "pulsar-flink" % "2.5.2",
      "org.apache.flink" %% "flink-connector-cassandra" % flinkVersion,
      "org.jpmml" % "pmml-evaluator-extension" % pmmlVersion,
      "org.glassfish.jaxb" % "jaxb-runtime" % "2.3.2",
      "joda-time" % "joda-time" % "2.10.6",

    ),
    mainClass in assembly := Some("com.cdl.iot.Main"),
    Compile / run := Defaults.runTask(Compile / fullClasspath,
      Compile / run / mainClass,
      Compile / run / runner
    ).evaluated,
    assemblyJarName in assembly := "inference.jar",
    baseAssemblySettings,
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
  ).dependsOn(protocol)

lazy val training = (project in file("training"))
  .settings(
    settings,
    libraryDependencies ++= commonDependencies,
    libraryDependencies ++= Seq(
      "org.apache.spark" %% "spark-core" % sparkVersion,
      "org.apache.spark" %% "spark-sql" % sparkVersion,
      "org.apache.spark" %% "spark-mllib" % sparkVersion,
      "com.sksamuel.pulsar4s" %% "pulsar4s-core" % pulsar4sVersion,
      "org.jpmml" % "jpmml-sparkml" % pmmlVersion,
      "ml.combust.mleap" %% "mleap-spark-extension" % "0.16.0",
      "com.datastax.spark" %% "spark-cassandra-connector" % "2.5.1",
    ),
    assembly := null,
  ).dependsOn(protocol)

lazy val db = (project in file("db"))
  .settings(
    settings,
    libraryDependencies ++= commonDependencies,
    libraryDependencies ++= Seq(
      "org.apache.spark" %% "spark-core" % "2.4.5",
      "org.apache.spark" %% "spark-sql" % "2.4.5",
      "com.sksamuel.pulsar4s" %% "pulsar4s-core" % pulsar4sVersion,
      "com.datastax.spark" %% "spark-cassandra-connector" % "2.5.1",
    ),
    assemblyJarName in assembly := "data.jar",
    assembly := null
  ).dependsOn(protocol)


lazy val ingestion = (project in file("ingestion"))
  .settings(
    settings,
    libraryDependencies ++= commonDependencies,
    libraryDependencies ++= Seq(
      "com.sksamuel.pulsar4s" %% "pulsar4s-core" % pulsar4sVersion,
      "org.jdbi" % "jdbi" % "2.78",
      "org.apache-extras.cassandra-jdbc" % "cassandra-jdbc" % "1.2.5",
      "org.apache.cassandra" % "cassandra-all" % "4.0-alpha4"
    ),
    assemblyJarName in assembly := "ingestion.jar",
    mainClass in run := Some("edu.cdl.iot.ingestion.Main"),
    assembly := null
  ).dependsOn(protocol)
