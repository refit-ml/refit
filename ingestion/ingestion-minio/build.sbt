val `ingestion-core` = project in file("../ingestion-core")

name := "ingestion-minio"
Settings.default

dependsOn(Shared.`data-minio`, `ingestion-core`)