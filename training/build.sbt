
lazy val training = (project in file("."))
  .settings(
    Settings.default,
    libraryDependencies ++= Dependencies.training,
    dependencyOverrides ++= {
      Seq(
        "com.fasterxml.jackson.module" % "jackson-module-scala_2.11" % "2.8.1",
        "com.fasterxml.jackson.core" % "jackson-databind" % "2.8.1",
      )
    },
    assembly := null,
  ).dependsOn(Shared.protocol, Shared.common, Shared.dao)