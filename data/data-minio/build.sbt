Settings.default
name := "data-minio"
libraryDependencies ++= Dependencies.minio
assembly := null
dependsOn(Shared.common)