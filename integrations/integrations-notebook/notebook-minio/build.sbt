val `notebook-core` = project in file("../notebook-core")

name := "notebook-minio"
Settings.default

dependsOn(Shared.`data-minio`, `notebook-core`)