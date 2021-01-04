
name := "common"
Settings.default
resolvers ++= Seq(
  "Sonatype-public" at "https://oss.sonatype.org/content/groups/public/",
  Resolver.mavenLocal
)
libraryDependencies ++= Seq(
  "commons-codec" % "commons-codec" % "1.14",
  "org.yaml" % "snakeyaml" % "1.26"
)
assembly := null
dependsOn(Shared.protocol)