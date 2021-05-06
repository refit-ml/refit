name := "notebook-core"

Settings.default
libraryDependencies ++= Dependencies.jackson

dependsOn(Shared.`data-minio`, Shared.common)