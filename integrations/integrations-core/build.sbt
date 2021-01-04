name := "integrations-core"
Settings.default
baseAssemblySettings
libraryDependencies ++= Dependencies.jackson
dependsOn(Shared.common)