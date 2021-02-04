lazy val `scheduler-core` = project in file("../scheduler-core")
name := "scheduler-kube"

Settings.default
libraryDependencies += Libraries.kubeClient

dependsOn(
  `scheduler-core`,
  Shared.common
)