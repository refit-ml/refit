val `integrations-core` = project in file("../integrations-core")
name := "integrations-cassandra"
Settings.default
baseAssemblySettings
dependsOn(Shared.`data-cassandra`, `integrations-core`)