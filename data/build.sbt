name := "data"

version := "1"

scalaVersion := "2.13.0"

mainClass in (assembly) := Some("Main")
assemblyJarName in assembly := "data.jar"

libraryDependencies += "com.sksamuel.pulsar4s" % "pulsar4s-core_2.13" % "2.5.4"

libraryDependencies += "com.thesamet.scalapb" %% "scalapb-runtime" % scalapb.compiler.Version.scalapbVersion % "protobuf"

PB.targets in Compile := Seq(
  scalapb.gen() -> (sourceManaged in Compile).value / "scalapb"
)

PB.protocVersion := "-v3.11.4"