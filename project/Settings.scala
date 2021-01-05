import sbt.Keys._
import sbt._
import sbtassembly.AssemblyPlugin.autoImport.{MergeStrategy, assembly, assemblyMergeStrategy}
import sbtassembly.PathList

object Settings {
  lazy val camel = Seq(
    libraryDependencies ++= Dependencies.camel,
    assemblyMergeStrategy in assembly := {
      case PathList("META-INF", "io.netty.versions.properties", xs@_*) => MergeStrategy.last
      case PathList("META-INF", "jandex.idx", xs@_*) => MergeStrategy.last
      case "component.properties" => MergeStrategy.last
      case "language.properties" => MergeStrategy.last
      case "module-info.class" => MergeStrategy.last
      case "MANIFEST.MF" => MergeStrategy.last
      case PathList("javax", "activation", xs@_*) => MergeStrategy.last
      case PathList("org", "slf4j", "impl", xs@_*) => MergeStrategy.first
      case x =>
        val oldStrategy = (assemblyMergeStrategy in assembly).value
        oldStrategy(x)
    }
  )

  lazy val default = Seq(
    assembly := null,
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
