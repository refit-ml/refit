
lazy val common = (project in file("."))
  .settings(
    Settings.default,
    resolvers ++= Seq(
      "Sonatype-public" at "https://oss.sonatype.org/content/groups/public/",
      Resolver.mavenLocal
    ),
    libraryDependencies ++= Seq(
      "commons-codec" % "commons-codec" % "1.14",
      "org.yaml" % "snakeyaml" % "1.26"
    ),
    libraryDependencies ++= Dependencies.testDependencies,
    assembly := null
  ).dependsOn(Shared.protocol)