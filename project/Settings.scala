import sbt.Keys._
import sbt._

object Settings {
  lazy val default = Seq(
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
    libraryDependencies ++= Dependencies.shared
  )
}
