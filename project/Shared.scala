import sbt.{file, project}

object Shared {
  lazy val protocol = project in file("protocol")
  lazy val common = project in file("common")
  lazy val `data-cassandra` = project in file("data/data-cassandra")
  lazy val `data-minio` = project in file("data/data-minio")
  lazy val `data-kafka` = project in file("data/data-kafka")
}
