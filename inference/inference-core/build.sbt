name := "inference-core"

Settings.default
libraryDependencies ++= Dependencies.onnx
libraryDependencies ++= Dependencies.pmml

dependsOn(Shared.common)