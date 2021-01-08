val `integrations-core` = project in file("../integrations-core")

name := "integrations-cassandra"
Settings.default

dependsOn(Shared.`data-cassandra`, `integrations-core`)