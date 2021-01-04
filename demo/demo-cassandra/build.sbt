val `data-cassandra` = project in file("../../data/data-cassandra")
val `demo-core` = project in file("../demo-core")
name := "demo-cassandra"
Settings.default
baseAssemblySettings
dependsOn(`data-cassandra`, `demo-core`)