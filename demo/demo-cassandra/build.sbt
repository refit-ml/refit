val `demo-core` = project in file("../demo-core")

name := "demo-cassandra"
baseAssemblySettings
Settings.default

dependsOn(Shared.`data-cassandra`, `demo-core`)