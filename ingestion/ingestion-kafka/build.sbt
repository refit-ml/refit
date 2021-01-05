val `ingestion-core` = project in file("../ingestion-core")
name := "ingestion-kafka"
Settings.default
baseAssemblySettings
dependsOn(Shared.`data-kafka`, `ingestion-core`)