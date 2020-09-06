name := "REFIT"
version := "1.0"
organization := "Center for Deep Learning - Northwestern University"

ThisBuild / scalaVersion := "2.11.12"
Compile / run / fork := true
Global / cancelable := true

lazy val protocol = project in file("protocol")

lazy val common = project in file("common")

lazy val dao = project in file("dao")

lazy val training = project in file("training")

lazy val db = project in file("db")

lazy val inference = project in file("inference")

lazy val ingestion = project in file("ingestion")

lazy val integrations = project in file("integrations")



