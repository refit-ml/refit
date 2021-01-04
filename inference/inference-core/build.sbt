name := "inference-core"
Settings.default
baseAssemblySettings
libraryDependencies ++= Dependencies.onnx
libraryDependencies ++= Dependencies.pmml
dependsOn(Shared.common)