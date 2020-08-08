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
  "joda-time" % "joda-time" % "2.10.6",
)

val jdbiDependencies = Seq(
  "org.jdbi" % "jdbi" % "2.78",
  "org.apache-extras.cassandra-jdbc" % "cassandra-jdbc" % "1.2.5",
  "org.apache.cassandra" % "cassandra-all" % "4.0-alpha4"
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
  ),
  Compile / run := Defaults.runTask(Compile / fullClasspath,
    Compile / run / mainClass,
    Compile / run / runner
  ).evaluated,
  libraryDependencies ++= commonDependencies,

)



lazy val protocol = (project in file("protocol"))
  .settings(
    settings,
    PB.targets in Compile := Seq(
      scalapb.gen() -> (sourceManaged in Compile).value / "scalapb"
    ),
    PB.protocVersion := "-v3.11.4",
  )

val camelVersion = "2.25.2"

lazy val camel = (project in file("camel"))
  .settings(
    settings,
    libraryDependencies ++= commonDependencies,
    libraryDependencies ++= Seq(
      "org.apache.camel" % "camel-core" % camelVersion,
      "org.apache.camel" % "camel-scala" % camelVersion,
      "com.sksamuel.pulsar4s" %% "pulsar4s-core" % pulsar4sVersion,
    ),
    libraryDependencies ++= jdbiDependencies,
    mainClass in run := Some("edu.cdl.iot.camel.Main")
  ).dependsOn(protocol, common)

lazy val inference = (project in file("inference"))
  .settings(
    settings,
    baseAssemblySettings,
    libraryDependencies ++= Seq(
      "org.apache.flink" %% "flink-scala" % flinkVersion,
      "org.apache.flink" %% "flink-streaming-scala" % flinkVersion,
      "org.apache.pulsar" % "pulsar-flink" % "2.5.2",
      "org.apache.flink" %% "flink-connector-cassandra" % flinkVersion,
      "org.jpmml" % "pmml-evaluator-extension" % pmmlVersion,
      "org.glassfish.jaxb" % "jaxb-runtime" % "2.3.2"
    ),
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
      case x =>
        val oldStrategy = (assemblyMergeStrategy in assembly).value
        oldStrategy(x)
    }
  ).dependsOn(protocol)

lazy val training = (project in file("training"))
  .settings(
    settings,
    libraryDependencies ++= Seq(
      "org.apache.spark" %% "spark-core" % sparkVersion,
      "org.apache.spark" %% "spark-sql" % sparkVersion,
      "org.apache.spark" %% "spark-mllib" % sparkVersion,
      "com.sksamuel.pulsar4s" %% "pulsar4s-core" % pulsar4sVersion,
      "org.jpmml" % "jpmml-sparkml" % pmmlVersion,
      "ml.combust.mleap" %% "mleap-spark-extension" % "0.16.0",
      "com.datastax.spark" %% "spark-cassandra-connector" % "2.5.1",
    ),
    excludeDependencies ++= Seq(
      ExclusionRule("org.slf4j", "slf4j-log4j12")
    ),
    dependencyOverrides ++= {
      Seq(
        "com.fasterxml.jackson.module" % "jackson-module-scala_2.11" % "2.8.1",
        "com.fasterxml.jackson.core" % "jackson-databind" % "2.8.1",
      )
    },
    assembly := null,
  ).dependsOn(protocol, db)

lazy val common = (project in file("common"))
  .settings(
    settings,
    libraryDependencies ++= Seq(
      "commons-codec" % "commons-codec" % "1.14",
      "org.scalatest" %% "scalatest" % "3.2.0" % Test
    ),
    assembly := null,
  )

lazy val db = (project in file("db"))
  .settings(
    settings,
    libraryDependencies ++= Seq(
      "org.apache.spark" %% "spark-core" % "2.4.5",
      "org.apache.spark" %% "spark-sql" % "2.4.5",
      "org.apache.spark" %% "spark-mllib" % sparkVersion,
      "ml.combust.mleap" %% "mleap-spark-extension" % "0.16.0",
      "com.sksamuel.pulsar4s" %% "pulsar4s-core" % pulsar4sVersion,
      "com.datastax.spark" %% "spark-cassandra-connector" % "2.5.1"
    ),
    libraryDependencies ++= jdbiDependencies,
    excludeDependencies ++= Seq(
      ExclusionRule("org.slf4j", "slf4j-log4j12")
    ),
    dependencyOverrides ++= {
      Seq(
        "com.fasterxml.jackson.module" % "jackson-module-scala_2.11" % "2.8.1",
        "com.fasterxml.jackson.core" % "jackson-databind" % "2.8.1",
      )
    },
    assemblyJarName in assembly := "data.jar",
    assembly := null
  ).dependsOn(protocol)


lazy val ingestion = (project in file("ingestion"))
  .settings(
    settings,
    baseAssemblySettings,
    libraryDependencies ++= Seq(
      "com.sksamuel.pulsar4s" %% "pulsar4s-core" % pulsar4sVersion,
      "org.jdbi" % "jdbi" % "2.78",
      "org.apache-extras.cassandra-jdbc" % "cassandra-jdbc" % "1.2.5",
      "org.apache.cassandra" % "cassandra-all" % "4.0-alpha4"
    ),
    assemblyJarName in assembly := "ingestion.jar",
    mainClass in (run / assembly) := Some("edu.cdl.iot.ingestion.Main"),
    assemblyMergeStrategy in assembly := {
      case PathList("git.properties", xs@_*) => MergeStrategy.first
      case PathList("git.properties", xs@_*) => MergeStrategy.first
      case PathList("jetty-dir.css", xs@_*) => MergeStrategy.first
      case PathList("javax", xs@_*) => MergeStrategy.first
      case PathList("commons-configuration", "commons-configuration", xs@_*) => MergeStrategy.first
      case PathList("org", "apache", "spark", xs@_*) => MergeStrategy.first
      case PathList("org", "apache", "pulsar", xs@_*) => MergeStrategy.first
      case PathList("org", "apache", "log4j", xs@_*) => MergeStrategy.first
      case PathList("org", "apache", "commons", "collections", xs@_*) => MergeStrategy.first
      case PathList("org", "apache", "hadoop", xs@_*) => MergeStrategy.first
      case PathList("org", "apache", "cassandra", xs@_*) => MergeStrategy.first
      case PathList("org", "apache", "avro", xs@_*) => MergeStrategy.first
      case PathList("org", "aopalliance", xs@_*) => MergeStrategy.first
      case PathList("META-INF", "io.netty.versions.properties", xs@_*) => MergeStrategy.last
      case PathList("META-INF", "native", xs@_*) => MergeStrategy.last
      case PathList("sun", "activation", xs@_*) => MergeStrategy.last
      case PathList("com", "sun", "activation", xs@_*) => MergeStrategy.last
      case "properties.dtd" => MergeStrategy.first
      case "PropertyList-1.0.dtd" => MergeStrategy.first
      case "digesterRules.xml" => MergeStrategy.first
      case PathList("META-INF", "MANIFEST.MF") => MergeStrategy.discard
      case x =>
        val oldStrategy = (assemblyMergeStrategy in assembly).value
        oldStrategy(x)
    }
  ).dependsOn(protocol, db)
