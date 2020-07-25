name := "models"

version := "1.0"

scalaVersion := "2.12.10"

libraryDependencies ++= Seq(
  "org.apache.spark" %% "spark-core" % "2.4.5",
  "org.apache.spark" %% "spark-sql" % "2.4.5",
  "org.apache.spark" %% "spark-mllib" % "2.4.5"
)
libraryDependencies += "com.sksamuel.pulsar4s" %% "pulsar4s-core" % "2.5.4"
libraryDependencies += "org.jpmml" % "jpmml-sparkml" % "1.5.1"
libraryDependencies += "ml.combust.mleap" %% "mleap-spark-extension" % "0.16.0"
libraryDependencies += "com.datastax.spark" %% "spark-cassandra-connector" % "2.5.1"
libraryDependencies += "org.deeplearning4j" %% "dl4j-spark" % "1.0.0-beta7"

libraryDependencies += "com.thesamet.scalapb" %% "scalapb-runtime" % scalapb.compiler.Version.scalapbVersion % "protobuf"

PB.targets in Compile := Seq(
  scalapb.gen() -> (sourceManaged in Compile).value / "scalapb"
)

PB.protocVersion := "-v3.11.4"

mainClass in (Compile, run) := Some("org.cdl.iot.ModelTraining")
