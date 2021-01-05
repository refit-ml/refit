Settings.default
name := "data-kafka"
libraryDependencies ++= Dependencies.kafka
assembly := null
dependsOn(Shared.common)