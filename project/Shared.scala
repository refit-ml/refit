import sbt.{file, project}

object Shared {
  lazy val protocol = (project in file("protocol"))
  lazy val common = (project in file("common"))
  lazy val dao = (project in file("dao"))
}
