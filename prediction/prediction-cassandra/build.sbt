val `prediction-core` = project in file("../prediction-core")

name := "prediction-cassandra"
Settings.default

dependsOn(Shared.`data-cassandra`, `prediction-core`)