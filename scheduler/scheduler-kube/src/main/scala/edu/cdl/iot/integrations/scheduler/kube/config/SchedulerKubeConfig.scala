package edu.cdl.iot.integrations.scheduler.kube.config

import edu.cdl.iot.integrations.scheduler.kube.Constants


case class SchedulerKubeConfig(namespace: String = sys.env(Constants.NAMESPACE_KEY),
                               releasePrefix: String = sys.env(Constants.RELEASE_PREFIX),
                               minioHost: String = sys.env(Constants.MINIO_HOST),
                               minioBucket: String = sys.env(Constants.MINIO_BUCKET),
                               refitVersion: String = sys.env(Constants.REFIT_VERSION))
