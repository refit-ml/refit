name := "REFIT"
version := "1.0"
organization := "Center for Deep Learning - Northwestern University"

ThisBuild / scalaVersion := "2.12.12"
Compile / run / fork := true
Global / cancelable := true

lazy val protocol = project in file("protocol")
lazy val common = project in file("common")
lazy val `data-cassandra` = project in file("data/data-cassandra")
lazy val `data-minio` = project in file("data/data-minio")
lazy val `data-kafka` = project in file("data/data-kafka")
lazy val `data-postgres` = project in file("data/data-postgres")

lazy val `inference-application` = project in file("applications/inference-application")
lazy val `ingestion-application` = project in file("applications/ingestion-application")
lazy val `integrations-application` = project in file("applications/integrations-application")
lazy val `demo-application` = project in file("applications/demo-application")


//libraryDependencies ++= Dependencies.jdbi


fork in Test := true