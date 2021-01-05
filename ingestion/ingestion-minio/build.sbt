val `ingestion-core` = project in file("../ingestion-core")
name := "ingestion-minio"
Settings.default
baseAssemblySettings
dependsOn(Shared.`data-minio`, `ingestion-core`)