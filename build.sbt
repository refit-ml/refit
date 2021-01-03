name := "REFIT"
version := "1.0"
organization := "Center for Deep Learning - Northwestern University"

ThisBuild / scalaVersion := "2.12.12"
Compile / run / fork := true
Global / cancelable := true

lazy val protocol = project in file("protocol")

lazy val common = project in file("common")

lazy val dao = project in file("dao")

lazy val db = project in file("db")

lazy val inference = project in file("inference")

lazy val `ingestion-application` = project in file("ingestion/ingestion-application")
lazy val `integrations-application` = project in file("integrations/integrations-application")
lazy val `demo-application` = project in file("demo/demo-application")





