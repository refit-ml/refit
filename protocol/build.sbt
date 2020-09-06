lazy val protocol = (project in file("."))
  .settings(
    Settings.default,
    PB.targets in Compile := Seq(
      scalapb.gen() -> (sourceManaged in Compile).value / "scalapb"
    ),
    PB.protocVersion := "-v3.11.4",
    assembly := null
  )