val `demo-core` = project in file("../demo-core")
name := "demo-cassandra"
Settings.default
baseAssemblySettings
dependsOn(Shared.`data-cassandra`, `demo-core`)