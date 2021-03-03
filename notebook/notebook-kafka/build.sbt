val `notebook-core` = project in file("../notebook-core")

name := "notebook-kafka"
Settings.default

dependsOn(Shared.`data-kafka`, `notebook-core`)