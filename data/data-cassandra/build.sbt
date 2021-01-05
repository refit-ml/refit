Settings.default
name := "data-cassandra"
libraryDependencies ++= Dependencies.cassandra
assembly := null
dependsOn(Shared.common)