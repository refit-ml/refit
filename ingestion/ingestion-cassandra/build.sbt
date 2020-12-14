val `data-cassandra` = project in file("../../data/cassandra")
val `ingestion-core` = project in file("../ingestion-core")
name := "ingestion-cassandra"
Settings.default
baseAssemblySettings
dependsOn(`data-cassandra`, `ingestion-core`)