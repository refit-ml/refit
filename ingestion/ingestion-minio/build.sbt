val `data-minio` = project in file("../../data/minio")
val `ingestion-core` = project in file("../ingestion-core")
name := "ingestion-minio"
Settings.default
baseAssemblySettings
dependsOn(`data-minio`, `ingestion-core`)