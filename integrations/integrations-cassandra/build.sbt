val `data-cassandra` = project in file("../../data/data-cassandra")
val `integrations-core` = project in file("../integrations-core")
name := "integrations-cassandra"
Settings.default
baseAssemblySettings
dependsOn(`data-cassandra`, `integrations-core`)