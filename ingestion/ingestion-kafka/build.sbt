val `ingestion-core` = project in file("../ingestion-core")

name := "ingestion-kafka"
Settings.default

dependsOn(Shared.`data-kafka`, `ingestion-core`)