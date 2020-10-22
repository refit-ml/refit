resolvers ++= Seq(
  Resolver.sonatypeRepo("public"),
  Resolver.bintrayRepo("scalaz", "releases")

)

resolvers ++= "Sonatype OSS Snapshots" at "https://oss.sonatype.org/content/repositories/snapshots"