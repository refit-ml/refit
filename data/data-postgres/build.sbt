Settings.default
name := "data-postgres"
libraryDependencies ++= Seq(
  Libraries.postgres,
  Libraries.jdbiPostgres,
  Libraries.jdbi,
  Libraries.jdbiSqlObject
)

dependsOn(Shared.common)