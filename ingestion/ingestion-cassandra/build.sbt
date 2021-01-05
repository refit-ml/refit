val `ingestion-core` = project in file("../ingestion-core")

name := "ingestion-cassandra"
Settings.default

dependsOn(Shared.`data-cassandra`, `ingestion-core`)