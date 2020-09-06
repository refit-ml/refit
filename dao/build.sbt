lazy val dao = (project in file("."))
  .settings(
    Settings.default,
    libraryDependencies ++= Dependencies.cassandraDependencies,
    assembly := null
  ).dependsOn(Shared.common)