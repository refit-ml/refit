val `grafana-core` = project in file("../grafana-core")

name := "grafana-cassandra"
Settings.default

dependsOn(Shared.`data-cassandra`, `grafana-core`)