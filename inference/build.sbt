
// The simplest possible sbt build file is just one line:

scalaVersion := "2.10.4"

name := "inference"
organization := "CDL-IOT"
version := "1.0"

libraryDependencies += "org.apache.spark" %% "spark-core" % "1.2.0"

