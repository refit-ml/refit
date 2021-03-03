val `notebook-core` = project in file("../notebook-core")

name := "notebook-cassandra"
Settings.default

dependsOn(Shared.`data-cassandra`, `notebook-core`)