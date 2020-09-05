lazy val dao = (project in file("."))
  .settings(
    Settings.default,
    libraryDependencies ++= Dependencies.cassandraDependencies
  ).dependsOn(Shared.common)