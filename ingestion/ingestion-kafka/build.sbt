val `data-kafka` = project in file("../../data/data-kafka")
val `ingestion-core` = project in file("../ingestion-core")
name := "ingestion-kafka"
Settings.default
baseAssemblySettings
dependsOn(`data-kafka`, `ingestion-core`)