[AppClassLoader@18b4aac2] info AspectJ Weaver Version 1.9.2 built on Wednesday Oct 24, 2018 at 15:43:33 GMT
[AppClassLoader@18b4aac2] info register classloader sun.misc.Launcher$AppClassLoader@18b4aac2
[AppClassLoader@18b4aac2] info using configuration file:/pulsar/lib/org.apache.pulsar-pulsar-zookeeper-utils-2.6.0.jar!/META-INF/aop.xml
[AppClassLoader@18b4aac2] info using configuration file:/pulsar/lib/org.apache.pulsar-pulsar-zookeeper-2.6.0.jar!/META-INF/aop.xml
[AppClassLoader@18b4aac2] info register aspect org.apache.pulsar.broker.zookeeper.aspectj.ClientCnxnAspect
[AppClassLoader@18b4aac2] info register aspect org.apache.pulsar.zookeeper.FinalRequestProcessorAspect
[AppClassLoader@18b4aac2] info register aspect org.apache.pulsar.zookeeper.ZooKeeperServerAspect
03:18:53.307 [main] INFO  org.apache.pulsar.zookeeper.LocalBookkeeperEnsemble - Running 1 bookie(s) and advertised them at 127.0.0.1.
03:18:53.318 [main] INFO  org.apache.pulsar.zookeeper.LocalBookkeeperEnsemble - Starting ZK server
[AppClassLoader@18b4aac2] info processing reweavable type org.apache.zookeeper.server.ZooKeeperServer: org/apache/zookeeper/server/ZooKeeperServer.java
[AppClassLoader@18b4aac2] info successfully verified type org.apache.pulsar.zookeeper.ZooKeeperServerAspect exists.  Originates from org/apache/pulsar/zookeeper/ZooKeeperServerAspect.java
03:18:53.595 [main] INFO  org.apache.zookeeper.server.ZooKeeperServer - Server environment:zookeeper.version=3.5.7-f0fdd52973d373ffd9c86b81d99842dc2c7f660e, built on 02/10/2020 11:30 GMT
03:18:53.595 [main] INFO  org.apache.zookeeper.server.ZooKeeperServer - Server environment:host.name=pulsar-standalone-666465565b-hkm56
03:18:53.596 [main] INFO  org.apache.zookeeper.server.ZooKeeperServer - Server environment:java.version=1.8.0_252
03:18:53.596 [main] INFO  org.apache.zookeeper.server.ZooKeeperServer - Server environment:java.vendor=Oracle Corporation
03:18:53.596 [main] INFO  org.apache.zookeeper.server.ZooKeeperServer - Server environment:java.home=/usr/local/openjdk-8/jre
03:18:53.596 [main] INFO  org.apache.zookeeper.server.ZooKeeperServer - Server environment:java.class.path=/pulsar/conf:::/pulsar/lib/org.yaml-snakeyaml-1.24.jar:/pulsar/lib/com.fasterxml.jackson.jaxrs-jackson-jaxrs-base-2.10.1.jar:/pulsar/lib/org.apache.pulsar-pulsar-client-tools-2.6.0.jar:/pulsar/lib/org.apache.logging.log4j-log4j-core-2.10.0.jar:/pulsar/lib/com.squareup.okhttp-okhttp-ws-2.7.5.jar:/pulsar/lib/org.eclipse.jetty.websocket-websocket-common-9.4.20.v20190813.jar:/pulsar/lib/io.prometheus-simpleclient_hotspot-0.5.0.jar:/pulsar/lib/org.glassfish.hk2-hk2-api-2.5.0-b42.jar:/pulsar/lib/org.eclipse.jetty-jetty-server-9.4.20.v20190813.jar:/pulsar/lib/commons-lang-commons-lang-2.6.jar:/pulsar/lib/io.vertx-vertx-web-3.4.1.jar:/pulsar/lib/io.swagger-swagger-models-1.5.21.jar:/pulsar/lib/org.glassfish.jersey.core-jersey-client-2.27.jar:/pulsar/lib/net.jodah-typetools-0.5.0.jar:/pulsar/lib/org.glassfish.hk2-osgi-resource-locator-1.0.1.jar:/pulsar/lib/com.squareup.okhttp-logging-interceptor-2.7.5.jar:/pulsar/lib/org.apache.pulsar-pulsar-broker-common-2.6.0.jar:/pulsar/lib/javax.validation-validation-api-1.1.0.Final.jar:/pulsar/lib/io.netty-netty-handler-proxy-4.1.48.Final.jar:/pulsar/lib/io.vertx-vertx-auth-common-3.4.1.jar:/pulsar/lib/org.eclipse.jetty.websocket-websocket-client-9.4.20.v20190813.jar:/pulsar/lib/com.fasterxml.jackson.dataformat-jackson-dataformat-yaml-2.10.1.jar:/pulsar/lib/org.eclipse.jetty-jetty-xml-9.4.20.v20190813.jar:/pulsar/lib/org.jctools-jctools-core-2.1.2.jar:/pulsar/lib/org.glassfish.jersey.media-jersey-media-multipart-2.27.jar:/pulsar/lib/com.google.guava-guava-25.1-jre.jar:/pulsar/lib/io.grpc-grpc-protobuf-1.18.0.jar:/pulsar/lib/org.apache.httpcomponents-httpcore-4.4.9.jar:/pulsar/lib/org.apache.pulsar-pulsar-io-core-2.6.0.jar:/pulsar/lib/com.typesafe.netty-netty-reactive-streams-2.0.4.jar:/pulsar/lib/io.prometheus-simpleclient_httpserver-0.5.0.jar:/pulsar/lib/org.apache.distributedlog-distributedlog-core-4.10.0-tests.jar:/pulsar/lib/org.apache.bookkeeper-cpu-affinity-4.10.0.jar:/pulsar/lib/org.slf4j-jcl-over-slf4j-1.7.25.jar:/pulsar/lib/org.apache.distributedlog-distributedlog-protocol-4.10.0.jar:/pulsar/lib/org.apache.bookkeeper-stream-storage-java-client-base-4.10.0.jar:/pulsar/lib/org.reactivestreams-reactive-streams-1.0.3.jar:/pulsar/lib/org.apache.commons-commons-compress-1.19.jar:/pulsar/lib/org.inferred-freebuilder-1.14.9.jar:/pulsar/lib/io.grpc-grpc-testing-1.18.0.jar:/pulsar/lib/commons-cli-commons-cli-1.2.jar:/pulsar/lib/org.apache.bookkeeper.http-http-server-4.10.0.jar:/pulsar/lib/org.apache.avro-avro-1.9.1.jar:/pulsar/lib/net.jcip-jcip-annotations-1.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-transaction-common-2.6.0.jar:/pulsar/lib/io.netty-netty-handler-4.1.48.Final.jar:/pulsar/lib/com.google.j2objc-j2objc-annotations-1.1.jar:/pulsar/lib/org.rocksdb-rocksdbjni-5.13.3.jar:/pulsar/lib/io.netty-netty-codec-http2-4.1.48.Final.jar:/pulsar/lib/org.eclipse.jetty.websocket-websocket-servlet-9.4.20.v20190813.jar:/pulsar/lib/org.glassfish.jersey.ext-jersey-entity-filtering-2.27.jar:/pulsar/lib/org.apache.pulsar-pulsar-client-messagecrypto-bc-2.6.0.jar:/pulsar/lib/org.glassfish.jersey.containers-jersey-container-servlet-core-2.27.jar:/pulsar/lib/org.eclipse.jetty-jetty-util-9.4.20.v20190813.jar:/pulsar/lib/com.squareup.okio-okio-1.13.0.jar:/pulsar/lib/org.apache.logging.log4j-log4j-slf4j-impl-2.10.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-functions-local-runner-original-2.6.0.jar:/pulsar/lib/org.eclipse.jetty-jetty-security-9.4.20.v20190813.jar:/pulsar/lib/com.google.code.findbugs-jsr305-3.0.2.jar:/pulsar/lib/org.apache.zookeeper-zookeeper-jute-3.5.7.jar:/pulsar/lib/org.apache.pulsar-pulsar-functions-proto-2.6.0.jar:/pulsar/lib/org.apache.bookkeeper.stats-codahale-metrics-provider-4.10.0.jar:/pulsar/lib/org.apache.bookkeeper.stats-prometheus-metrics-provider-4.10.0.jar:/pulsar/lib/org.jvnet.mimepull-mimepull-1.9.6.jar:/pulsar/lib/commons-configuration-commons-configuration-1.10.jar:/pulsar/lib/org.glassfish.hk2.external-aopalliance-repackaged-2.5.0-b42.jar:/pulsar/lib/com.sun.activation-javax.activation-1.2.0.jar:/pulsar/lib/io.grpc-grpc-context-1.18.0.jar:/pulsar/lib/io.vertx-vertx-core-3.4.1.jar:/pulsar/lib/org.apache.bookkeeper-stream-storage-server-4.10.0.jar:/pulsar/lib/io.jsonwebtoken-jjwt-api-0.11.1.jar:/pulsar/lib/org.glassfish.hk2.external-javax.inject-2.5.0-b42.jar:/pulsar/lib/log4j-log4j-1.2.17.jar:/pulsar/lib/io.netty-netty-transport-native-unix-common-4.1.48.Final.jar:/pulsar/lib/com.squareup.okhttp-okhttp-2.5.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-client-admin-original-2.6.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-zookeeper-utils-2.6.0.jar:/pulsar/lib/org.apache.bookkeeper-stream-storage-proto-4.10.0.jar:/pulsar/lib/io.prometheus-simpleclient-0.5.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-metadata-2.6.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-broker-2.6.0.jar:/pulsar/lib/io.grpc-grpc-stub-1.18.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-client-auth-sasl-2.6.0.jar:/pulsar/lib/org.apache.curator-curator-recipes-4.0.1.jar:/pulsar/lib/org.apache.yetus-audience-annotations-0.5.0.jar:/pulsar/lib/io.dropwizard.metrics-metrics-core-3.1.0.jar:/pulsar/lib/org.apache.bookkeeper-stream-storage-common-4.10.0.jar:/pulsar/lib/org.slf4j-jul-to-slf4j-1.7.25.jar:/pulsar/lib/com.beust-jcommander-1.48.jar:/pulsar/lib/org.apache.pulsar-pulsar-functions-instance-2.6.0.jar:/pulsar/lib/org.eclipse.jetty.websocket-javax-websocket-client-impl-9.4.20.v20190813.jar:/pulsar/lib/javax.xml.bind-jaxb-api-2.3.1.jar:/pulsar/lib/org.apache.logging.log4j-log4j-web-2.10.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-proxy-2.6.0.jar:/pulsar/lib/org.eclipse.jetty-jetty-client-9.4.20.v20190813.jar:/pulsar/lib/org.apache.pulsar-pulsar-client-original-2.6.0.jar:/pulsar/lib/io.netty-netty-common-4.1.48.Final.jar:/pulsar/lib/org.apache.distributedlog-distributedlog-common-4.10.0.jar:/pulsar/lib/org.hamcrest-hamcrest-core-1.3.jar:/pulsar/lib/org.slf4j-slf4j-api-1.7.25.jar:/pulsar/lib/org.eclipse.jetty-jetty-servlet-9.4.20.v20190813.jar:/pulsar/lib/io.prometheus-simpleclient_servlet-0.5.0.jar:/pulsar/lib/org.apache.bookkeeper-bookkeeper-common-4.10.0.jar:/pulsar/lib/com.google.api.grpc-proto-google-common-protos-1.12.0.jar:/pulsar/lib/org.apache.bookkeeper-bookkeeper-tools-framework-4.10.0.jar:/pulsar/lib/org.apache.bookkeeper-stream-storage-java-client-4.10.0.jar:/pulsar/lib/org.eclipse.jetty-jetty-continuation-9.4.20.v20190813.jar:/pulsar/lib/com.yahoo.datasketches-sketches-core-0.8.3.jar:/pulsar/lib/javax.websocket-javax.websocket-client-api-1.0.jar:/pulsar/lib/jakarta.xml.bind-jakarta.xml.bind-api-2.3.2.jar:/pulsar/lib/org.glassfish.jersey.media-jersey-media-json-jackson-2.27.jar:/pulsar/lib/org.apache.pulsar-protobuf-shaded-2.1.0-incubating.jar:/pulsar/lib/org.eclipse.jetty-jetty-http-9.4.20.v20190813.jar:/pulsar/lib/org.javassist-javassist-3.25.0-GA.jar:/pulsar/lib/io.dropwizard.metrics-metrics-jvm-3.1.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-common-2.6.0.jar:/pulsar/lib/org.apache.pulsar-managed-ledger-2.6.0.jar:/pulsar/lib/com.fasterxml.jackson.core-jackson-core-2.10.1.jar:/pulsar/lib/org.apache.bookkeeper.stats-bookkeeper-stats-api-4.10.0.jar:/pulsar/lib/org.apache.avro-avro-protobuf-1.9.1.jar:/pulsar/lib/io.opencensus-opencensus-api-0.18.0.jar:/pulsar/lib/javax.ws.rs-javax.ws.rs-api-2.1.jar:/pulsar/lib/io.swagger-swagger-annotations-1.5.21.jar:/pulsar/lib/org.apache.bookkeeper-stream-storage-api-4.10.0.jar:/pulsar/lib/io.dropwizard.metrics-metrics-graphite-3.1.0.jar:/pulsar/lib/org.apache.commons-commons-lang3-3.6.jar:/pulsar/lib/io.grpc-grpc-netty-1.18.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-functions-worker-2.6.0.jar:/pulsar/lib/org.apache.httpcomponents-httpclient-4.5.5.jar:/pulsar/lib/javax.servlet-javax.servlet-api-3.1.0.jar:/pulsar/lib/org.checkerframework-checker-qual-2.0.0.jar:/pulsar/lib/javax.annotation-javax.annotation-api-1.2.jar:/pulsar/lib/io.grpc-grpc-core-1.18.0.jar:/pulsar/lib/org.eclipse.jetty.websocket-websocket-server-9.4.20.v20190813.jar:/pulsar/lib/io.netty-netty-codec-4.1.48.Final.jar:/pulsar/lib/com.google.auth-google-auth-library-credentials-0.9.0.jar:/pulsar/lib/io.netty-netty-buffer-4.1.48.Final.jar:/pulsar/lib/org.apache.pulsar-pulsar-functions-api-2.6.0.jar:/pulsar/lib/commons-logging-commons-logging-1.1.1.jar:/pulsar/lib/org.glassfish.jersey.inject-jersey-hk2-2.27.jar:/pulsar/lib/com.fasterxml.jackson.module-jackson-module-jsonSchema-2.10.1.jar:/pulsar/lib/io.opencensus-opencensus-contrib-grpc-metrics-0.18.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-broker-auth-sasl-2.6.0.jar:/pulsar/lib/io.netty-netty-transport-native-unix-common-4.1.48.Final-linux-x86_64.jar:/pulsar/lib/io.kubernetes-client-java-api-2.0.0.jar:/pulsar/lib/org.eclipse.jetty.websocket-websocket-api-9.4.20.v20190813.jar:/pulsar/lib/org.codehaus.mojo-animal-sniffer-annotations-1.14.jar:/pulsar/lib/io.grpc-grpc-auth-1.18.0.jar:/pulsar/lib/org.apache.bookkeeper.http-vertx-http-server-4.10.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-websocket-2.6.0.jar:/pulsar/lib/org.apache.curator-curator-client-4.0.1.jar:/pulsar/lib/org.glassfish.hk2-hk2-utils-2.5.0-b42.jar:/pulsar/lib/org.glassfish.jersey.core-jersey-common-2.27.jar:/pulsar/lib/org.glassfish.jersey.core-jersey-server-2.27.jar:/pulsar/lib/org.glassfish.hk2-hk2-locator-2.5.0-b42.jar:/pulsar/lib/org.aspectj-aspectjweaver-1.9.2.jar:/pulsar/lib/io.netty-netty-codec-http-4.1.48.Final.jar:/pulsar/lib/org.apache.pulsar-pulsar-discovery-service-2.6.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-testclient-2.6.0.jar:/pulsar/lib/io.netty-netty-transport-native-epoll-4.1.48.Final.jar:/pulsar/lib/commons-collections-commons-collections-3.2.2.jar:/pulsar/lib/io.prometheus-simpleclient_caffeine-0.5.0.jar:/pulsar/lib/com.github.ben-manes.caffeine-caffeine-2.6.2.jar:/pulsar/lib/org.apache.pulsar-pulsar-functions-api-examples-2.6.0.jar:/pulsar/lib/com.yahoo.datasketches-memory-0.8.3.jar:/pulsar/lib/com.carrotsearch-hppc-0.7.3.jar:/pulsar/lib/org.apache.pulsar-pulsar-functions-runtime-2.6.0.jar:/pulsar/lib/com.google.protobuf-protobuf-java-util-3.5.1.jar:/pulsar/lib/io.netty-netty-codec-dns-4.1.48.Final.jar:/pulsar/lib/joda-time-joda-time-2.10.1.jar:/pulsar/lib/org.apache.commons-commons-collections4-4.1.jar:/pulsar/lib/jakarta.activation-jakarta.activation-api-1.2.1.jar:/pulsar/lib/io.grpc-grpc-all-1.18.0.jar:/pulsar/lib/com.fasterxml.jackson.jaxrs-jackson-jaxrs-json-provider-2.10.1.jar:/pulsar/lib/io.netty-netty-transport-native-epoll-4.1.48.Final-linux-x86_64.jar:/pulsar/lib/io.netty-netty-resolver-dns-4.1.48.Final.jar:/pulsar/lib/org.eclipse.jetty-jetty-servlets-9.4.20.v20190813.jar:/pulsar/lib/io.prometheus-simpleclient_jetty-0.5.0.jar:/pulsar/lib/org.apache.bookkeeper-bookkeeper-common-allocator-4.10.0.jar:/pulsar/lib/io.prometheus.jmx-collector-0.12.0.jar:/pulsar/lib/org.asynchttpclient-async-http-client-netty-utils-2.12.1.jar:/pulsar/lib/io.prometheus-simpleclient_common-0.5.0.jar:/pulsar/lib/com.fasterxml.jackson.core-jackson-annotations-2.10.1.jar:/pulsar/lib/io.netty-netty-transport-native-kqueue-4.1.48.Final-osx-x86_64.jar:/pulsar/lib/com.fasterxml.jackson.module-jackson-module-jaxb-annotations-2.10.1.jar:/pulsar/lib/io.grpc-grpc-protobuf-nano-1.18.0.jar:/pulsar/lib/org.apache.bookkeeper-bookkeeper-server-4.10.0.jar:/pulsar/lib/io.jsonwebtoken-jjwt-jackson-0.11.1.jar:/pulsar/lib/org.apache.bookkeeper-stream-storage-service-api-4.10.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-functions-utils-2.6.0.jar:/pulsar/lib/org.apache.logging.log4j-log4j-api-2.10.0.jar:/pulsar/lib/org.eclipse.jetty-jetty-proxy-9.4.20.v20190813.jar:/pulsar/lib/org.apache.pulsar-pulsar-client-api-2.6.0.jar:/pulsar/lib/com.google.protobuf.nano-protobuf-javanano-3.0.0-alpha-5.jar:/pulsar/lib/io.kubernetes-client-java-2.0.0.jar:/pulsar/lib/org.apache.bookkeeper.tests-stream-storage-tests-common-4.10.0.jar:/pulsar/lib/com.google.code.gson-gson-2.8.2.jar:/pulsar/lib/com.google.errorprone-error_prone_annotations-2.1.3.jar:/pulsar/lib/org.glassfish.jersey.media-jersey-media-jaxb-2.27.jar:/pulsar/lib/org.eclipse.jetty-jetty-io-9.4.20.v20190813.jar:/pulsar/lib/io.netty-netty-codec-socks-4.1.48.Final.jar:/pulsar/lib/io.jsonwebtoken-jjwt-impl-0.11.1.jar:/pulsar/lib/org.apache.pulsar-pulsar-transaction-coordinator-2.6.0.jar:/pulsar/lib/io.swagger-swagger-core-1.5.21.jar:/pulsar/lib/org.apache.bookkeeper-stream-storage-service-impl-4.10.0.jar:/pulsar/lib/com.github.zafarkhaja-java-semver-0.9.0.jar:/pulsar/lib/io.kubernetes-client-java-proto-2.0.0.jar:/pulsar/lib/org.aspectj-aspectjrt-1.9.2.jar:/pulsar/lib/org.apache.bookkeeper-bookkeeper-proto-4.10.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-zookeeper-2.6.0.jar:/pulsar/lib/org.checkerframework-checker-compat-qual-2.5.2.jar:/pulsar/lib/io.prometheus-simpleclient_log4j2-0.5.0.jar:/pulsar/lib/org.apache.curator-curator-framework-4.0.1.jar:/pulsar/lib/io.grpc-grpc-protobuf-lite-1.18.0.jar:/pulsar/lib/org.asynchttpclient-async-http-client-2.12.1.jar:/pulsar/lib/io.airlift-aircompressor-0.16.jar:/pulsar/lib/com.google.protobuf-protobuf-java-3.5.1.jar:/pulsar/lib/commons-codec-commons-codec-1.10.jar:/pulsar/lib/org.hdrhistogram-HdrHistogram-2.1.9.jar:/pulsar/lib/org.apache.bookkeeper-statelib-4.10.0.jar:/pulsar/lib/org.apache.distributedlog-distributedlog-core-4.10.0.jar:/pulsar/lib/io.netty-netty-resolver-4.1.48.Final.jar:/pulsar/lib/org.apache.bookkeeper-circe-checksum-4.10.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-functions-secrets-2.6.0.jar:/pulsar/lib/io.netty-netty-transport-4.1.48.Final.jar:/pulsar/lib/javax.inject-javax.inject-1.jar:/pulsar/lib/io.grpc-grpc-okhttp-1.18.0.jar:/pulsar/lib/net.java.dev.jna-jna-4.2.0.jar:/pulsar/lib/com.fasterxml.jackson.core-jackson-databind-2.10.1.jar:/pulsar/lib/commons-io-commons-io-2.5.jar:/pulsar/lib/io.netty-netty-tcnative-boringssl-static-2.0.30.Final.jar:/pulsar/lib/org.glassfish.jersey.containers-jersey-container-servlet-2.27.jar:/pulsar/lib/org.apache.pulsar-bouncy-castle-bc-shaded-2.6.0.jar::/pulsar/lib/org.aspectj-aspectjweaver-1.9.2.jar
03:18:53.598 [main] INFO  org.apache.zookeeper.server.ZooKeeperServer - Server environment:java.library.path=/usr/java/packages/lib/amd64:/usr/lib64:/lib64:/lib:/usr/lib
03:18:53.598 [main] INFO  org.apache.zookeeper.server.ZooKeeperServer - Server environment:java.io.tmpdir=/tmp
03:18:53.599 [main] INFO  org.apache.zookeeper.server.ZooKeeperServer - Server environment:java.compiler=<NA>
03:18:53.599 [main] INFO  org.apache.zookeeper.server.ZooKeeperServer - Server environment:os.name=Linux
03:18:53.599 [main] INFO  org.apache.zookeeper.server.ZooKeeperServer - Server environment:os.arch=amd64
03:18:53.600 [main] INFO  org.apache.zookeeper.server.ZooKeeperServer - Server environment:os.version=4.19.107
03:18:53.600 [main] INFO  org.apache.zookeeper.server.ZooKeeperServer - Server environment:user.name=root
03:18:53.600 [main] INFO  org.apache.zookeeper.server.ZooKeeperServer - Server environment:user.home=/root
03:18:53.600 [main] INFO  org.apache.zookeeper.server.ZooKeeperServer - Server environment:user.dir=/pulsar
03:18:53.600 [main] INFO  org.apache.zookeeper.server.ZooKeeperServer - Server environment:os.memory.free=1991MB
03:18:53.600 [main] INFO  org.apache.zookeeper.server.ZooKeeperServer - Server environment:os.memory.max=2048MB
03:18:53.601 [main] INFO  org.apache.zookeeper.server.ZooKeeperServer - Server environment:os.memory.total=2048MB
03:18:53.606 [main] INFO  org.apache.zookeeper.server.persistence.FileTxnSnapLog - zookeeper.snapshot.trust.empty : true
03:18:53.633 [main] INFO  org.apache.zookeeper.server.ZKDatabase - zookeeper.snapshotSizeFactor = 0.33
03:18:53.642 [main] INFO  org.apache.zookeeper.server.ZooKeeperServer - minSessionTimeout set to 6000
03:18:53.642 [main] INFO  org.apache.zookeeper.server.ZooKeeperServer - maxSessionTimeout set to 60000
03:18:53.645 [main] INFO  org.apache.zookeeper.server.ZooKeeperServer - Created server with tickTime 3000 minSessionTimeout 6000 maxSessionTimeout 60000 datadir /pulsar/data/standalone/zookeeper/version-2 snapdir /pulsar/data/standalone/zookeeper/version-2
03:18:53.741 [main] INFO  org.apache.zookeeper.server.NIOServerCnxnFactory - Configuring NIO connection handler with 10s sessionless connection timeout, 1 selector thread(s), 2 worker threads, and 64 kB direct buffers.
03:18:53.756 [main] INFO  org.apache.zookeeper.server.NIOServerCnxnFactory - binding to port 0.0.0.0/0.0.0.0:2181
03:18:53.770 [main] INFO  org.apache.zookeeper.server.persistence.FileTxnSnapLog - Snapshotting: 0x0 to /pulsar/data/standalone/zookeeper/version-2/snapshot.0
03:18:53.777 [main] INFO  org.apache.zookeeper.server.persistence.FileTxnSnapLog - Snapshotting: 0x0 to /pulsar/data/standalone/zookeeper/version-2/snapshot.0
[AppClassLoader@18b4aac2] info processing reweavable type org.apache.zookeeper.server.FinalRequestProcessor: org/apache/zookeeper/server/FinalRequestProcessor.java
[AppClassLoader@18b4aac2] info successfully verified type org.apache.pulsar.zookeeper.FinalRequestProcessorAspect exists.  Originates from org/apache/pulsar/zookeeper/FinalRequestProcessorAspect.java
03:18:53.931 [NIOWorkerThread-1] INFO  org.apache.zookeeper.server.command.FourLetterCommands - The list of known four letter word commands is : [{1936881266=srvr, 1937006964=stat, 2003003491=wchc, 1685417328=dump, 1668445044=crst, 1936880500=srst, 1701738089=envi, 1668247142=conf, -720899=telnet close, 2003003507=wchs, 2003003504=wchp, 1684632179=dirs, 1668247155=cons, 1835955314=mntr, 1769173615=isro, 1920298859=ruok, 1735683435=gtmk, 1937010027=stmk}]
03:18:53.934 [NIOWorkerThread-1] INFO  org.apache.zookeeper.server.command.FourLetterCommands - The list of enabled four letter word commands is : [[wchs, stat, wchp, dirs, stmk, conf, ruok, mntr, srvr, wchc, envi, srst, isro, dump, gtmk, telnet close, crst, cons]]
03:18:53.934 [NIOWorkerThread-1] INFO  org.apache.zookeeper.server.NIOServerCnxn - Processing stat command from /127.0.0.1:43462
03:18:53.953 [NIOWorkerThread-1] INFO  org.apache.zookeeper.server.command.AbstractFourLetterCommand - Stat command output
03:18:53.959 [main] INFO  org.apache.pulsar.zookeeper.LocalBookkeeperEnsemble - Server UP
03:18:53.961 [main] INFO  org.apache.pulsar.zookeeper.LocalBookkeeperEnsemble - ZooKeeper server up: true
03:18:53.962 [main] INFO  org.apache.pulsar.zookeeper.LocalBookkeeperEnsemble - Instantiate ZK Client
03:18:53.981 [main] INFO  org.apache.zookeeper.ZooKeeper - Client environment:zookeeper.version=3.5.7-f0fdd52973d373ffd9c86b81d99842dc2c7f660e, built on 02/10/2020 11:30 GMT
03:18:53.981 [main] INFO  org.apache.zookeeper.ZooKeeper - Client environment:host.name=pulsar-standalone-666465565b-hkm56
03:18:53.981 [main] INFO  org.apache.zookeeper.ZooKeeper - Client environment:java.version=1.8.0_252
03:18:53.981 [main] INFO  org.apache.zookeeper.ZooKeeper - Client environment:java.vendor=Oracle Corporation
03:18:53.981 [main] INFO  org.apache.zookeeper.ZooKeeper - Client environment:java.home=/usr/local/openjdk-8/jre
03:18:53.981 [main] INFO  org.apache.zookeeper.ZooKeeper - Client environment:java.class.path=/pulsar/conf:::/pulsar/lib/org.yaml-snakeyaml-1.24.jar:/pulsar/lib/com.fasterxml.jackson.jaxrs-jackson-jaxrs-base-2.10.1.jar:/pulsar/lib/org.apache.pulsar-pulsar-client-tools-2.6.0.jar:/pulsar/lib/org.apache.logging.log4j-log4j-core-2.10.0.jar:/pulsar/lib/com.squareup.okhttp-okhttp-ws-2.7.5.jar:/pulsar/lib/org.eclipse.jetty.websocket-websocket-common-9.4.20.v20190813.jar:/pulsar/lib/io.prometheus-simpleclient_hotspot-0.5.0.jar:/pulsar/lib/org.glassfish.hk2-hk2-api-2.5.0-b42.jar:/pulsar/lib/org.eclipse.jetty-jetty-server-9.4.20.v20190813.jar:/pulsar/lib/commons-lang-commons-lang-2.6.jar:/pulsar/lib/io.vertx-vertx-web-3.4.1.jar:/pulsar/lib/io.swagger-swagger-models-1.5.21.jar:/pulsar/lib/org.glassfish.jersey.core-jersey-client-2.27.jar:/pulsar/lib/net.jodah-typetools-0.5.0.jar:/pulsar/lib/org.glassfish.hk2-osgi-resource-locator-1.0.1.jar:/pulsar/lib/com.squareup.okhttp-logging-interceptor-2.7.5.jar:/pulsar/lib/org.apache.pulsar-pulsar-broker-common-2.6.0.jar:/pulsar/lib/javax.validation-validation-api-1.1.0.Final.jar:/pulsar/lib/io.netty-netty-handler-proxy-4.1.48.Final.jar:/pulsar/lib/io.vertx-vertx-auth-common-3.4.1.jar:/pulsar/lib/org.eclipse.jetty.websocket-websocket-client-9.4.20.v20190813.jar:/pulsar/lib/com.fasterxml.jackson.dataformat-jackson-dataformat-yaml-2.10.1.jar:/pulsar/lib/org.eclipse.jetty-jetty-xml-9.4.20.v20190813.jar:/pulsar/lib/org.jctools-jctools-core-2.1.2.jar:/pulsar/lib/org.glassfish.jersey.media-jersey-media-multipart-2.27.jar:/pulsar/lib/com.google.guava-guava-25.1-jre.jar:/pulsar/lib/io.grpc-grpc-protobuf-1.18.0.jar:/pulsar/lib/org.apache.httpcomponents-httpcore-4.4.9.jar:/pulsar/lib/org.apache.pulsar-pulsar-io-core-2.6.0.jar:/pulsar/lib/com.typesafe.netty-netty-reactive-streams-2.0.4.jar:/pulsar/lib/io.prometheus-simpleclient_httpserver-0.5.0.jar:/pulsar/lib/org.apache.distributedlog-distributedlog-core-4.10.0-tests.jar:/pulsar/lib/org.apache.bookkeeper-cpu-affinity-4.10.0.jar:/pulsar/lib/org.slf4j-jcl-over-slf4j-1.7.25.jar:/pulsar/lib/org.apache.distributedlog-distributedlog-protocol-4.10.0.jar:/pulsar/lib/org.apache.bookkeeper-stream-storage-java-client-base-4.10.0.jar:/pulsar/lib/org.reactivestreams-reactive-streams-1.0.3.jar:/pulsar/lib/org.apache.commons-commons-compress-1.19.jar:/pulsar/lib/org.inferred-freebuilder-1.14.9.jar:/pulsar/lib/io.grpc-grpc-testing-1.18.0.jar:/pulsar/lib/commons-cli-commons-cli-1.2.jar:/pulsar/lib/org.apache.bookkeeper.http-http-server-4.10.0.jar:/pulsar/lib/org.apache.avro-avro-1.9.1.jar:/pulsar/lib/net.jcip-jcip-annotations-1.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-transaction-common-2.6.0.jar:/pulsar/lib/io.netty-netty-handler-4.1.48.Final.jar:/pulsar/lib/com.google.j2objc-j2objc-annotations-1.1.jar:/pulsar/lib/org.rocksdb-rocksdbjni-5.13.3.jar:/pulsar/lib/io.netty-netty-codec-http2-4.1.48.Final.jar:/pulsar/lib/org.eclipse.jetty.websocket-websocket-servlet-9.4.20.v20190813.jar:/pulsar/lib/org.glassfish.jersey.ext-jersey-entity-filtering-2.27.jar:/pulsar/lib/org.apache.pulsar-pulsar-client-messagecrypto-bc-2.6.0.jar:/pulsar/lib/org.glassfish.jersey.containers-jersey-container-servlet-core-2.27.jar:/pulsar/lib/org.eclipse.jetty-jetty-util-9.4.20.v20190813.jar:/pulsar/lib/com.squareup.okio-okio-1.13.0.jar:/pulsar/lib/org.apache.logging.log4j-log4j-slf4j-impl-2.10.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-functions-local-runner-original-2.6.0.jar:/pulsar/lib/org.eclipse.jetty-jetty-security-9.4.20.v20190813.jar:/pulsar/lib/com.google.code.findbugs-jsr305-3.0.2.jar:/pulsar/lib/org.apache.zookeeper-zookeeper-jute-3.5.7.jar:/pulsar/lib/org.apache.pulsar-pulsar-functions-proto-2.6.0.jar:/pulsar/lib/org.apache.bookkeeper.stats-codahale-metrics-provider-4.10.0.jar:/pulsar/lib/org.apache.bookkeeper.stats-prometheus-metrics-provider-4.10.0.jar:/pulsar/lib/org.jvnet.mimepull-mimepull-1.9.6.jar:/pulsar/lib/commons-configuration-commons-configuration-1.10.jar:/pulsar/lib/org.glassfish.hk2.external-aopalliance-repackaged-2.5.0-b42.jar:/pulsar/lib/com.sun.activation-javax.activation-1.2.0.jar:/pulsar/lib/io.grpc-grpc-context-1.18.0.jar:/pulsar/lib/io.vertx-vertx-core-3.4.1.jar:/pulsar/lib/org.apache.bookkeeper-stream-storage-server-4.10.0.jar:/pulsar/lib/io.jsonwebtoken-jjwt-api-0.11.1.jar:/pulsar/lib/org.glassfish.hk2.external-javax.inject-2.5.0-b42.jar:/pulsar/lib/log4j-log4j-1.2.17.jar:/pulsar/lib/io.netty-netty-transport-native-unix-common-4.1.48.Final.jar:/pulsar/lib/com.squareup.okhttp-okhttp-2.5.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-client-admin-original-2.6.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-zookeeper-utils-2.6.0.jar:/pulsar/lib/org.apache.bookkeeper-stream-storage-proto-4.10.0.jar:/pulsar/lib/io.prometheus-simpleclient-0.5.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-metadata-2.6.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-broker-2.6.0.jar:/pulsar/lib/io.grpc-grpc-stub-1.18.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-client-auth-sasl-2.6.0.jar:/pulsar/lib/org.apache.curator-curator-recipes-4.0.1.jar:/pulsar/lib/org.apache.yetus-audience-annotations-0.5.0.jar:/pulsar/lib/io.dropwizard.metrics-metrics-core-3.1.0.jar:/pulsar/lib/org.apache.bookkeeper-stream-storage-common-4.10.0.jar:/pulsar/lib/org.slf4j-jul-to-slf4j-1.7.25.jar:/pulsar/lib/com.beust-jcommander-1.48.jar:/pulsar/lib/org.apache.pulsar-pulsar-functions-instance-2.6.0.jar:/pulsar/lib/org.eclipse.jetty.websocket-javax-websocket-client-impl-9.4.20.v20190813.jar:/pulsar/lib/javax.xml.bind-jaxb-api-2.3.1.jar:/pulsar/lib/org.apache.logging.log4j-log4j-web-2.10.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-proxy-2.6.0.jar:/pulsar/lib/org.eclipse.jetty-jetty-client-9.4.20.v20190813.jar:/pulsar/lib/org.apache.pulsar-pulsar-client-original-2.6.0.jar:/pulsar/lib/io.netty-netty-common-4.1.48.Final.jar:/pulsar/lib/org.apache.distributedlog-distributedlog-common-4.10.0.jar:/pulsar/lib/org.hamcrest-hamcrest-core-1.3.jar:/pulsar/lib/org.slf4j-slf4j-api-1.7.25.jar:/pulsar/lib/org.eclipse.jetty-jetty-servlet-9.4.20.v20190813.jar:/pulsar/lib/io.prometheus-simpleclient_servlet-0.5.0.jar:/pulsar/lib/org.apache.bookkeeper-bookkeeper-common-4.10.0.jar:/pulsar/lib/com.google.api.grpc-proto-google-common-protos-1.12.0.jar:/pulsar/lib/org.apache.bookkeeper-bookkeeper-tools-framework-4.10.0.jar:/pulsar/lib/org.apache.bookkeeper-stream-storage-java-client-4.10.0.jar:/pulsar/lib/org.eclipse.jetty-jetty-continuation-9.4.20.v20190813.jar:/pulsar/lib/com.yahoo.datasketches-sketches-core-0.8.3.jar:/pulsar/lib/javax.websocket-javax.websocket-client-api-1.0.jar:/pulsar/lib/jakarta.xml.bind-jakarta.xml.bind-api-2.3.2.jar:/pulsar/lib/org.glassfish.jersey.media-jersey-media-json-jackson-2.27.jar:/pulsar/lib/org.apache.pulsar-protobuf-shaded-2.1.0-incubating.jar:/pulsar/lib/org.eclipse.jetty-jetty-http-9.4.20.v20190813.jar:/pulsar/lib/org.javassist-javassist-3.25.0-GA.jar:/pulsar/lib/io.dropwizard.metrics-metrics-jvm-3.1.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-common-2.6.0.jar:/pulsar/lib/org.apache.pulsar-managed-ledger-2.6.0.jar:/pulsar/lib/com.fasterxml.jackson.core-jackson-core-2.10.1.jar:/pulsar/lib/org.apache.bookkeeper.stats-bookkeeper-stats-api-4.10.0.jar:/pulsar/lib/org.apache.avro-avro-protobuf-1.9.1.jar:/pulsar/lib/io.opencensus-opencensus-api-0.18.0.jar:/pulsar/lib/javax.ws.rs-javax.ws.rs-api-2.1.jar:/pulsar/lib/io.swagger-swagger-annotations-1.5.21.jar:/pulsar/lib/org.apache.bookkeeper-stream-storage-api-4.10.0.jar:/pulsar/lib/io.dropwizard.metrics-metrics-graphite-3.1.0.jar:/pulsar/lib/org.apache.commons-commons-lang3-3.6.jar:/pulsar/lib/io.grpc-grpc-netty-1.18.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-functions-worker-2.6.0.jar:/pulsar/lib/org.apache.httpcomponents-httpclient-4.5.5.jar:/pulsar/lib/javax.servlet-javax.servlet-api-3.1.0.jar:/pulsar/lib/org.checkerframework-checker-qual-2.0.0.jar:/pulsar/lib/javax.annotation-javax.annotation-api-1.2.jar:/pulsar/lib/io.grpc-grpc-core-1.18.0.jar:/pulsar/lib/org.eclipse.jetty.websocket-websocket-server-9.4.20.v20190813.jar:/pulsar/lib/io.netty-netty-codec-4.1.48.Final.jar:/pulsar/lib/com.google.auth-google-auth-library-credentials-0.9.0.jar:/pulsar/lib/io.netty-netty-buffer-4.1.48.Final.jar:/pulsar/lib/org.apache.pulsar-pulsar-functions-api-2.6.0.jar:/pulsar/lib/commons-logging-commons-logging-1.1.1.jar:/pulsar/lib/org.glassfish.jersey.inject-jersey-hk2-2.27.jar:/pulsar/lib/com.fasterxml.jackson.module-jackson-module-jsonSchema-2.10.1.jar:/pulsar/lib/io.opencensus-opencensus-contrib-grpc-metrics-0.18.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-broker-auth-sasl-2.6.0.jar:/pulsar/lib/io.netty-netty-transport-native-unix-common-4.1.48.Final-linux-x86_64.jar:/pulsar/lib/io.kubernetes-client-java-api-2.0.0.jar:/pulsar/lib/org.eclipse.jetty.websocket-websocket-api-9.4.20.v20190813.jar:/pulsar/lib/org.codehaus.mojo-animal-sniffer-annotations-1.14.jar:/pulsar/lib/io.grpc-grpc-auth-1.18.0.jar:/pulsar/lib/org.apache.bookkeeper.http-vertx-http-server-4.10.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-websocket-2.6.0.jar:/pulsar/lib/org.apache.curator-curator-client-4.0.1.jar:/pulsar/lib/org.glassfish.hk2-hk2-utils-2.5.0-b42.jar:/pulsar/lib/org.glassfish.jersey.core-jersey-common-2.27.jar:/pulsar/lib/org.glassfish.jersey.core-jersey-server-2.27.jar:/pulsar/lib/org.glassfish.hk2-hk2-locator-2.5.0-b42.jar:/pulsar/lib/org.aspectj-aspectjweaver-1.9.2.jar:/pulsar/lib/io.netty-netty-codec-http-4.1.48.Final.jar:/pulsar/lib/org.apache.pulsar-pulsar-discovery-service-2.6.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-testclient-2.6.0.jar:/pulsar/lib/io.netty-netty-transport-native-epoll-4.1.48.Final.jar:/pulsar/lib/commons-collections-commons-collections-3.2.2.jar:/pulsar/lib/io.prometheus-simpleclient_caffeine-0.5.0.jar:/pulsar/lib/com.github.ben-manes.caffeine-caffeine-2.6.2.jar:/pulsar/lib/org.apache.pulsar-pulsar-functions-api-examples-2.6.0.jar:/pulsar/lib/com.yahoo.datasketches-memory-0.8.3.jar:/pulsar/lib/com.carrotsearch-hppc-0.7.3.jar:/pulsar/lib/org.apache.pulsar-pulsar-functions-runtime-2.6.0.jar:/pulsar/lib/com.google.protobuf-protobuf-java-util-3.5.1.jar:/pulsar/lib/io.netty-netty-codec-dns-4.1.48.Final.jar:/pulsar/lib/joda-time-joda-time-2.10.1.jar:/pulsar/lib/org.apache.commons-commons-collections4-4.1.jar:/pulsar/lib/jakarta.activation-jakarta.activation-api-1.2.1.jar:/pulsar/lib/io.grpc-grpc-all-1.18.0.jar:/pulsar/lib/com.fasterxml.jackson.jaxrs-jackson-jaxrs-json-provider-2.10.1.jar:/pulsar/lib/io.netty-netty-transport-native-epoll-4.1.48.Final-linux-x86_64.jar:/pulsar/lib/io.netty-netty-resolver-dns-4.1.48.Final.jar:/pulsar/lib/org.eclipse.jetty-jetty-servlets-9.4.20.v20190813.jar:/pulsar/lib/io.prometheus-simpleclient_jetty-0.5.0.jar:/pulsar/lib/org.apache.bookkeeper-bookkeeper-common-allocator-4.10.0.jar:/pulsar/lib/io.prometheus.jmx-collector-0.12.0.jar:/pulsar/lib/org.asynchttpclient-async-http-client-netty-utils-2.12.1.jar:/pulsar/lib/io.prometheus-simpleclient_common-0.5.0.jar:/pulsar/lib/com.fasterxml.jackson.core-jackson-annotations-2.10.1.jar:/pulsar/lib/io.netty-netty-transport-native-kqueue-4.1.48.Final-osx-x86_64.jar:/pulsar/lib/com.fasterxml.jackson.module-jackson-module-jaxb-annotations-2.10.1.jar:/pulsar/lib/io.grpc-grpc-protobuf-nano-1.18.0.jar:/pulsar/lib/org.apache.bookkeeper-bookkeeper-server-4.10.0.jar:/pulsar/lib/io.jsonwebtoken-jjwt-jackson-0.11.1.jar:/pulsar/lib/org.apache.bookkeeper-stream-storage-service-api-4.10.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-functions-utils-2.6.0.jar:/pulsar/lib/org.apache.logging.log4j-log4j-api-2.10.0.jar:/pulsar/lib/org.eclipse.jetty-jetty-proxy-9.4.20.v20190813.jar:/pulsar/lib/org.apache.pulsar-pulsar-client-api-2.6.0.jar:/pulsar/lib/com.google.protobuf.nano-protobuf-javanano-3.0.0-alpha-5.jar:/pulsar/lib/io.kubernetes-client-java-2.0.0.jar:/pulsar/lib/org.apache.bookkeeper.tests-stream-storage-tests-common-4.10.0.jar:/pulsar/lib/com.google.code.gson-gson-2.8.2.jar:/pulsar/lib/com.google.errorprone-error_prone_annotations-2.1.3.jar:/pulsar/lib/org.glassfish.jersey.media-jersey-media-jaxb-2.27.jar:/pulsar/lib/org.eclipse.jetty-jetty-io-9.4.20.v20190813.jar:/pulsar/lib/io.netty-netty-codec-socks-4.1.48.Final.jar:/pulsar/lib/io.jsonwebtoken-jjwt-impl-0.11.1.jar:/pulsar/lib/org.apache.pulsar-pulsar-transaction-coordinator-2.6.0.jar:/pulsar/lib/io.swagger-swagger-core-1.5.21.jar:/pulsar/lib/org.apache.bookkeeper-stream-storage-service-impl-4.10.0.jar:/pulsar/lib/com.github.zafarkhaja-java-semver-0.9.0.jar:/pulsar/lib/io.kubernetes-client-java-proto-2.0.0.jar:/pulsar/lib/org.aspectj-aspectjrt-1.9.2.jar:/pulsar/lib/org.apache.bookkeeper-bookkeeper-proto-4.10.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-zookeeper-2.6.0.jar:/pulsar/lib/org.checkerframework-checker-compat-qual-2.5.2.jar:/pulsar/lib/io.prometheus-simpleclient_log4j2-0.5.0.jar:/pulsar/lib/org.apache.curator-curator-framework-4.0.1.jar:/pulsar/lib/io.grpc-grpc-protobuf-lite-1.18.0.jar:/pulsar/lib/org.asynchttpclient-async-http-client-2.12.1.jar:/pulsar/lib/io.airlift-aircompressor-0.16.jar:/pulsar/lib/com.google.protobuf-protobuf-java-3.5.1.jar:/pulsar/lib/commons-codec-commons-codec-1.10.jar:/pulsar/lib/org.hdrhistogram-HdrHistogram-2.1.9.jar:/pulsar/lib/org.apache.bookkeeper-statelib-4.10.0.jar:/pulsar/lib/org.apache.distributedlog-distributedlog-core-4.10.0.jar:/pulsar/lib/io.netty-netty-resolver-4.1.48.Final.jar:/pulsar/lib/org.apache.bookkeeper-circe-checksum-4.10.0.jar:/pulsar/lib/org.apache.pulsar-pulsar-functions-secrets-2.6.0.jar:/pulsar/lib/io.netty-netty-transport-4.1.48.Final.jar:/pulsar/lib/javax.inject-javax.inject-1.jar:/pulsar/lib/io.grpc-grpc-okhttp-1.18.0.jar:/pulsar/lib/net.java.dev.jna-jna-4.2.0.jar:/pulsar/lib/com.fasterxml.jackson.core-jackson-databind-2.10.1.jar:/pulsar/lib/commons-io-commons-io-2.5.jar:/pulsar/lib/io.netty-netty-tcnative-boringssl-static-2.0.30.Final.jar:/pulsar/lib/org.glassfish.jersey.containers-jersey-container-servlet-2.27.jar:/pulsar/lib/org.apache.pulsar-bouncy-castle-bc-shaded-2.6.0.jar::/pulsar/lib/org.aspectj-aspectjweaver-1.9.2.jar
03:18:53.984 [main] INFO  org.apache.zookeeper.ZooKeeper - Client environment:java.library.path=/usr/java/packages/lib/amd64:/usr/lib64:/lib64:/lib:/usr/lib
03:18:53.985 [main] INFO  org.apache.zookeeper.ZooKeeper - Client environment:java.io.tmpdir=/tmp
03:18:53.985 [main] INFO  org.apache.zookeeper.ZooKeeper - Client environment:java.compiler=<NA>
03:18:53.985 [main] INFO  org.apache.zookeeper.ZooKeeper - Client environment:os.name=Linux
03:18:53.986 [main] INFO  org.apache.zookeeper.ZooKeeper - Client environment:os.arch=amd64
03:18:53.986 [main] INFO  org.apache.zookeeper.ZooKeeper - Client environment:os.version=4.19.107
03:18:53.987 [main] INFO  org.apache.zookeeper.ZooKeeper - Client environment:user.name=root
03:18:53.987 [main] INFO  org.apache.zookeeper.ZooKeeper - Client environment:user.home=/root
03:18:53.987 [main] INFO  org.apache.zookeeper.ZooKeeper - Client environment:user.dir=/pulsar
03:18:53.988 [main] INFO  org.apache.zookeeper.ZooKeeper - Client environment:os.memory.free=1964MB
03:18:53.988 [main] INFO  org.apache.zookeeper.ZooKeeper - Client environment:os.memory.max=2048MB
03:18:53.988 [main] INFO  org.apache.zookeeper.ZooKeeper - Client environment:os.memory.total=2048MB
03:18:53.998 [main] INFO  org.apache.zookeeper.ZooKeeper - Initiating client connection, connectString=127.0.0.1:2181 sessionTimeout=5000 watcher=org.apache.pulsar.zookeeper.LocalBookkeeperEnsemble$ZKConnectionWatcher@437e951d
03:18:54.017 [main] INFO  org.apache.zookeeper.common.X509Util - Setting -D jdk.tls.rejectClientInitiatedRenegotiation=true to disable client-initiated TLS renegotiation
03:18:54.030 [main] INFO  org.apache.zookeeper.ClientCnxnSocket - jute.maxbuffer value is 10485760 Bytes
03:18:54.053 [main] INFO  org.apache.zookeeper.ClientCnxn - zookeeper.request.timeout value is 0. feature enabled=
03:18:54.077 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Opening socket connection to server localhost/127.0.0.1:2181. Will not attempt to authenticate using SASL (unknown error)
03:18:54.079 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Socket connection established, initiating session, client: /127.0.0.1:43464, server: localhost/127.0.0.1:2181
03:18:54.096 [SyncThread:0] INFO  org.apache.zookeeper.server.persistence.FileTxnLog - Creating new log file: log.1
03:18:54.144 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Session establishment complete on server localhost/127.0.0.1:2181, sessionid = 0x1000035b0490000, negotiated timeout = 6000
03:18:54.202 [main] INFO  org.apache.pulsar.zookeeper.LocalBookkeeperEnsemble - Starting Bookie(s)
03:18:54.293 [main] INFO  org.apache.bookkeeper.proto.BookieServer - {
  "loadBalancerNamespaceBundleMaxBandwidthMbytes" : "100",
  "exposeTopicLevelMetricsInPrometheus" : "true",
  "tlsCertificateFilePath" : "",
  "managedLedgerCursorBackloggedThreshold" : "1000",
  "exposePreciseBacklogInPrometheus" : "false",
  "brokerPublisherThrottlingMaxByteRate" : "0",
  "bookkeeperClientHealthCheckErrorThresholdPerInterval" : "5",
  "brokerDeduplicationEntriesInterval" : "1000",
  "authenticateOriginalAuthData" : "false",
  "anonymousUserRole" : "",
  "dbStorage_rocksDB_numLevels" : "-1",
  "managedLedgerDigestType" : "CRC32C",
  "loadBalancerAutoBundleSplitEnabled" : "true",
  "bookkeeperClientAuthenticationParametersName" : "",
  "managedLedgerDefaultAckQuorum" : "1",
  "loadBalancerBrokerThresholdShedderPercentage" : "10",
  "tlsRequireTrustedClientCertOnConnect" : "false",
  "webSocketConnectionsPerBroker" : "8",
  "zkServers" : "127.0.0.1:2181",
  "dbStorage_rocksDB_maxSizeInLevel1MB" : "256",
  "brokerServicePort" : "6650",
  "loadBalancerReportUpdateMaxIntervalMinutes" : "15",
  "managedLedgerNumSchedulerThreads" : "4",
  "clientLibraryVersionCheckEnabled" : "false",
  "tokenAuthClaim" : "",
  "bookkeeperClientReorderReadSequenceEnabled" : "false",
  "dbStorage_rocksDB_blockCacheSize" : "",
  "brokerShutdownTimeoutMs" : "60000",
  "maxConsumersPerSubscription" : "0",
  "tokenAudience" : "",
  "maxNumPartitionsPerPartitionedTopic" : "0",
  "brokerClientTlsTrustStore" : "",
  "tlsEnabled" : "false",
  "managedLedgerMinLedgerRolloverTimeMinutes" : "10",
  "tlsProvider" : "",
  "bookkeeperTLSTrustCertsFilePath" : "",
  "clusterName" : "standalone",
  "superUserRoles" : "",
  "authenticationProviders" : "",
  "tlsCiphers" : "",
  "brokerClientTlsCiphers" : "",
  "dispatchThrottlingRateRelativeToPublishRate" : "false",
  "bookiePort" : "3181",
  "managedLedgerCacheSizeMB" : "",
  "advertisedAddress" : "127.0.0.1",
  "bookkeeperClientRegionawarePolicyEnabled" : "false",
  "brokerDeduplicationEnabled" : "false",
  "topicPublisherThrottlingTickTimeMillis" : "2",
  "dispatchThrottlingOnNonBacklogConsumerEnabled" : "true",
  "bookkeeperTLSTrustCertTypes" : "PEM",
  "webSocketServiceEnabled" : "true",
  "bookkeeperTLSCertificateFilePath" : "",
  "numHttpServerThreads" : "",
  "managedLedgerCacheEvictionWatermark" : "0.9",
  "loadBalancerNamespaceBundleMaxMsgRate" : "30000",
  "bookkeeperClientHealthCheckIntervalSeconds" : "60",
  "webSocketSessionIdleTimeoutMillis" : "300000",
  "allowAutoTopicCreationType" : "non-partitioned",
  "managedLedgerMaxSizePerLedgerMbytes" : "2048",
  "exposePublisherStats" : "true",
  "tlsKeyStoreType" : "JKS",
  "maxUnackedMessagesPerConsumer" : "50000",
  "replicationConnectionsPerBroker" : "16",
  "bookkeeperTLSTrustStorePasswordPath" : "",
  "managedLedgerMetadataOperationsTimeoutSeconds" : "60",
  "webServicePort" : "8080",
  "ledgerStorageClass" : "org.apache.bookkeeper.bookie.storage.ldb.DbLedgerStorage",
  "gcWaitTime" : "300000",
  "enableNonPersistentTopics" : "true",
  "managedLedgerPrometheusStatsLatencyRolloverSeconds" : "60",
  "loadBalancerNamespaceBundleMaxTopics" : "1000",
  "brokerClientTlsTrustStorePassword" : "",
  "managedLedgerCursorMaxEntriesPerLedger" : "50000",
  "brokerClientAuthenticationPlugin" : "",
  "maxPendingPublishdRequestsPerConnection" : "1000",
  "loadBalancerMemoryResourceWeight" : "1.0",
  "bookkeeperClientMinAvailableBookiesInIsolationGroups" : "",
  "athenzDomainNames" : "",
  "dbStorage_rocksDB_writeBufferSizeMB" : "4",
  "proxyRoles" : "",
  "managedLedgerNumWorkerThreads" : "4",
  "loadBalancerReportUpdateThresholdPercentage" : "10",
  "dbStorage_rocksDB_sstSizeInMB" : "4",
  "brokerDeleteInactiveTopicsEnabled" : "true",
  "diskUsageThreshold" : "0.99",
  "bookkeeperClientRackawarePolicyEnabled" : "true",
  "managedLedgerMaxUnackedRangesToPersist" : "10000",
  "maxConcurrentTopicLoadRequest" : "5000",
  "enablePersistentTopics" : "true",
  "managedLedgerTraceTaskExecution" : "true",
  "loadBalancerAutoUnloadSplitBundlesEnabled" : "true",
  "dbStorage_rocksDB_blockSize" : "4096",
  "zooKeeperOperationTimeoutSeconds" : "30",
  "bookkeeperTLSKeyFilePath" : "",
  "allowLoopback" : "true",
  "webSocketMaxTextFrameSize" : "1048576",
  "loadBalancerCPUResourceWeight" : "1.0",
  "backlogQuotaCheckEnabled" : "true",
  "allowAutoTopicCreation" : "true",
  "bookkeeperClientIsolationGroups" : "",
  "configurationStoreServers" : "",
  "maxUnackedMessagesPerSubscriptionOnBrokerBlocked" : "0.16",
  "dbStorage_writeCacheMaxSizeMb" : "",
  "brokerClientTlsProtocols" : "",
  "authorizationEnabled" : "false",
  "loadBalancerSheddingIntervalMinutes" : "1",
  "loadManagerClassName" : "org.apache.pulsar.broker.loadbalance.NoopLoadManager",
  "bookkeeperClientHealthCheckQuarantineTimeInSeconds" : "1800",
  "loadBalancerSheddingGracePeriodMinutes" : "30",
  "backlogQuotaCheckIntervalInSeconds" : "60",
  "loadBalancerBandwithInResourceWeight" : "1.0",
  "loadBalancerBandwithOutResourceWeight" : "1.0",
  "bookkeeperClientTimeoutInSeconds" : "30",
  "tlsTrustCertsFilePath" : "",
  "managedLedgerCacheEvictionFrequency" : "100.0",
  "autoSkipNonRecoverableData" : "false",
  "bookkeeperClientHealthCheckEnabled" : "true",
  "dbStorage_rocksDB_numFilesInLevel0" : "4",
  "brokerDeleteInactiveTopicsFrequencySeconds" : "60",
  "managedLedgerReadEntryTimeoutSeconds" : "0",
  "loadBalancerBrokerMaxTopics" : "50000",
  "managedLedgerAddEntryTimeoutSeconds" : "0",
  "loadBalancerDirectMemoryResourceWeight" : "1.0",
  "managedLedgerMaxEntriesPerLedger" : "50000",
  "loadBalancerNamespaceMaximumBundles" : "128",
  "managedLedgerCacheCopyEntries" : "false",
  "tlsCertRefreshCheckDurationSec" : "300",
  "journalSyncData" : "false",
  "bindAddress" : "0.0.0.0",
  "transactionMetadataStoreProviderClassName" : "org.apache.pulsar.transaction.coordinator.impl.InMemTransactionMetadataStoreProvider",
  "tlsAllowInsecureConnection" : "false",
  "allowEphemeralPorts" : "true",
  "maxProducersPerTopic" : "0",
  "subscriptionExpirationTimeMinutes" : "0",
  "numWorkerThreadsForNonPersistentTopic" : "8",
  "maxConcurrentNonPersistentMessagePerConnection" : "1000",
  "managedLedgerNewEntriesCheckDelayInMillis" : "10",
  "bookkeeperClientAuthenticationParameters" : "",
  "authenticationEnabled" : "false",
  "numIOThreads" : "",
  "replicatioPolicyCheckDurationSeconds" : "600",
  "allocatorPoolingPolicy" : "UnpooledHeap",
  "topicLevelPoliciesEnabled" : "false",
  "brokerClientTlsEnabledWithKeyStore" : "false",
  "maxConsumersPerTopic" : "0",
  "brokerClientTlsTrustStoreType" : "JKS",
  "subscriptionRedeliveryTrackerEnabled" : "true",
  "dispatchThrottlingRatePerTopicInByte" : "0",
  "managedLedgerCursorRolloverTimeInSeconds" : "14400",
  "globalZookeeperServers" : "",
  "defaultNumberOfNamespaceBundles" : "4",
  "loadBalancerEnabled" : "false",
  "dbStorage_readAheadCacheMaxSizeMb" : "",
  "activeConsumerFailoverDelayTimeMillis" : "1000",
  "managedLedgerDefaultEnsembleSize" : "1",
  "loadBalancerHistoryResourcePercentage" : "0.9",
  "dbStorage_readAheadCacheBatchSize" : "1000",
  "authorizationProvider" : "org.apache.pulsar.broker.authorization.PulsarAuthorizationProvider",
  "tlsTrustStore" : "",
  "zookeeperServers" : "",
  "defaultRetentionSizeInMB" : "0",
  "defaultNumPartitions" : "1",
  "bookkeeperTLSProviderFactoryClass" : "org.apache.bookkeeper.tls.TLSContextFactory",
  "brokerClientSslProvider" : "",
  "preciseDispatcherFlowControl" : "false",
  "maxConcurrentLookupRequest" : "50000",
  "skipBrokerShutdownOnOOM" : "false",
  "bookkeeperTLSKeyStorePasswordPath" : "",
  "defaultRetentionTimeInMinutes" : "0",
  "brokerPublisherThrottlingMaxMessageRate" : "0",
  "bookkeeperExplicitLacIntervalInMills" : "0",
  "replicationProducerQueueSize" : "1000",
  "loadBalancerNamespaceBundleMaxSessions" : "1000",
  "tlsProtocols" : "",
  "managedLedgerDefaultWriteQuorum" : "1",
  "zooKeeperSessionTimeoutMillis" : "30000",
  "statusFilePath" : "/usr/local/apache/htdocs",
  "bookkeeperClientSecondaryIsolationGroups" : "",
  "tokenAudienceClaim" : "",
  "brokerServicePurgeInactiveFrequencyInSeconds" : "60",
  "journalMaxGroupWaitMSec" : "1",
  "dbStorage_rocksDB_bloomFilterBitsPerKey" : "10",
  "brokerDeduplicationMaxNumberOfProducers" : "10000",
  "diskUsageWarnThreshold" : "0.99",
  "brokerDeduplicationProducerInactivityTimeoutMinutes" : "360",
  "tlsKeyFilePath" : "",
  "bookkeeperClientAuthenticationPlugin" : "",
  "bookkeeperDiskWeightBasedPlacementEnabled" : "false",
  "tlsTrustStoreType" : "JKS",
  "authorizationAllowWildcardsMatching" : "false",
  "subscriptionKeySharedConsistentHashingReplicaPoints" : "100",
  "managedLedgerDefaultMarkDeleteRateLimit" : "0.1",
  "managedLedgerMaxLedgerRolloverTimeMinutes" : "240",
  "subscriptionExpiryCheckIntervalInMinutes" : "5",
  "maxUnackedMessagesPerBroker" : "0",
  "tlsKeyStore" : "",
  "keepAliveIntervalSeconds" : "30",
  "flushInterval" : "60000",
  "brokerClientAuthenticationParameters" : "",
  "tlsEnabledWithKeyStore" : "false",
  "managedLedgerCacheEvictionTimeThresholdMillis" : "1000",
  "replicationMetricsEnabled" : "true",
  "bookkeeperClientSpeculativeReadTimeoutInMillis" : "0",
  "bookkeeperTLSKeyFileType" : "PEM",
  "ttlDurationDefaultInSeconds" : "0",
  "backlogQuotaDefaultLimitGB" : "10",
  "ledgerDirectories" : "data/standalone/bookkeeper0",
  "zooKeeperCacheExpirySeconds" : "300",
  "journalDirectories" : "data/standalone/bookkeeper0",
  "bookkeeperTLSClientAuthentication" : "false",
  "managedLedgerMaxUnackedRangesToPersistInZooKeeper" : "1000",
  "loadBalancerBundleUnloadMinThroughputThreshold" : "10",
  "dispatchThrottlingRatePerTopicInMsg" : "0",
  "maxUnackedMessagesPerSubscription" : "200000",
  "tlsTrustStorePassword" : "",
  "failureDomainsEnabled" : "false",
  "managedLedgerUnackedRangesOpenCacheSetEnabled" : "true",
  "webSocketNumIoThreads" : "8",
  "subscriptionKeySharedUseConsistentHashing" : "false",
  "brokerPublisherThrottlingTickTimeMillis" : "50",
  "tlsKeyStorePassword" : "",
  "systemTopicEnabled" : "false",
  "allowAutoSubscriptionCreation" : "true",
  "messageExpiryCheckIntervalInMinutes" : "5",
  "loadBalancerHostUsageCheckIntervalMinutes" : "1",
  "loadBalancerResourceQuotaUpdateIntervalMinutes" : "15"
}
03:18:54.963 [main] INFO  org.apache.bookkeeper.meta.MetadataDrivers - BookKeeper metadata driver manager initialized
03:18:54.963 [main] INFO  org.apache.bookkeeper.meta.MetadataDrivers - BookKeeper metadata driver manager initialized
03:18:54.964 [main] INFO  org.apache.bookkeeper.meta.MetadataDrivers - BookKeeper metadata driver manager initialized
03:18:54.973 [main] INFO  org.apache.bookkeeper.meta.zk.ZKMetadataDriverBase - Initialize zookeeper metadata driver at metadata service uri zk+null://127.0.0.1:2181/ledgers : zkServers = 127.0.0.1:2181, ledgersRootPath = /ledgers.
03:18:54.982 [main] INFO  org.apache.zookeeper.ZooKeeper - Initiating client connection, connectString=127.0.0.1:2181 sessionTimeout=10000 watcher=org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase@4e38d975
03:18:54.983 [main] INFO  org.apache.zookeeper.ClientCnxnSocket - jute.maxbuffer value is 10485760 Bytes
03:18:54.984 [main] INFO  org.apache.zookeeper.ClientCnxn - zookeeper.request.timeout value is 0. feature enabled=
03:18:54.987 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Opening socket connection to server localhost/127.0.0.1:2181. Will not attempt to authenticate using SASL (unknown error)
03:18:54.994 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Socket connection established, initiating session, client: /127.0.0.1:43470, server: localhost/127.0.0.1:2181
03:18:55.001 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Session establishment complete on server localhost/127.0.0.1:2181, sessionid = 0x1000035b0490001, negotiated timeout = 10000
03:18:55.003 [main-EventThread] INFO  org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase - ZooKeeper client is connected now.
03:18:55.046 [main] INFO  org.apache.bookkeeper.discover.ZKRegistrationManager - INSTANCEID not exists in zookeeper. Not considering it for data verification
03:18:55.109 [main] INFO  org.apache.bookkeeper.bookie.Bookie - Stamping new cookies on all dirs [data/standalone/bookkeeper0/current] [data/standalone/bookkeeper0/current]
03:18:55.335 [main] INFO  org.apache.bookkeeper.bookie.Bookie - instantiate ledger manager org.apache.bookkeeper.meta.HierarchicalLedgerManagerFactory
03:18:55.374 [main] ERROR org.apache.bookkeeper.bookie.Journal - Problems reading from data/standalone/bookkeeper0/current/lastMark (this is okay if it is the first time starting this bookie
03:18:55.378 [main] INFO  org.apache.bookkeeper.bookie.Bookie - Using ledger storage: org.apache.bookkeeper.bookie.storage.ldb.DbLedgerStorage
03:18:55.384 [main] INFO  org.apache.bookkeeper.bookie.storage.ldb.DbLedgerStorage - Started Db Ledger Storage
03:18:55.384 [main] INFO  org.apache.bookkeeper.bookie.storage.ldb.DbLedgerStorage -  - Number of directories: 1
03:18:55.384 [main] INFO  org.apache.bookkeeper.bookie.storage.ldb.DbLedgerStorage -  - Write cache size: 1024 MB
03:18:55.384 [main] INFO  org.apache.bookkeeper.bookie.storage.ldb.DbLedgerStorage -  - Read Cache: 1024 MB
03:18:55.406 [main] INFO  org.apache.bookkeeper.bookie.storage.ldb.DbLedgerStorage - Creating single directory db ledger storage on data/standalone/bookkeeper0/current
03:18:56.160 [main] INFO  org.apache.bookkeeper.bookie.ScanAndCompareGarbageCollector - Over Replicated Ledger Deletion : enabled=true, interval=86400000
03:18:56.203 [main] INFO  org.apache.bookkeeper.bookie.GarbageCollectorThread - Minor Compaction : enabled=true, threshold=0.20000000298023224, interval=3600000
03:18:56.203 [main] INFO  org.apache.bookkeeper.bookie.GarbageCollectorThread - Major Compaction : enabled=true, threshold=0.800000011920929, interval=86400000
03:18:56.404 [main] INFO  org.apache.bookkeeper.bookie.Bookie - Finished replaying journal in 8 ms.
03:18:56.477 [SyncThread-7-1] INFO  org.apache.bookkeeper.bookie.SyncThread - Flush ledger storage at checkpoint CheckpointList{checkpoints=[LogMark: logFileId - 0 , logFileOffset - 0]}.
03:18:56.484 [main] INFO  org.apache.bookkeeper.bookie.Bookie - Finished reading journal, starting bookie
03:18:56.492 [BookieJournal-3181] INFO  org.apache.bookkeeper.bookie.Journal - Starting journal on data/standalone/bookkeeper0/current
03:18:56.500 [ForceWriteThread] INFO  org.apache.bookkeeper.bookie.Journal - ForceWrite Thread started
03:18:56.537 [BookieJournal-3181] INFO  org.apache.bookkeeper.bookie.JournalChannel - Opening journal data/standalone/bookkeeper0/current/17389216ef3.txn
03:18:56.885 [main] WARN  org.apache.curator.retry.ExponentialBackoffRetry - maxRetries too large (2147483647). Pinning to 29
03:18:57.627 [main] INFO  org.apache.curator.framework.imps.CuratorFrameworkImpl - Starting
03:18:57.648 [main] INFO  org.apache.zookeeper.ZooKeeper - Initiating client connection, connectString=127.0.0.1:2181 sessionTimeout=60000 watcher=org.apache.curator.ConnectionState@62891fc8
03:18:57.650 [main] INFO  org.apache.zookeeper.ClientCnxnSocket - jute.maxbuffer value is 10485760 Bytes
03:18:57.650 [main] INFO  org.apache.zookeeper.ClientCnxn - zookeeper.request.timeout value is 0. feature enabled=
03:18:57.658 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Opening socket connection to server localhost/127.0.0.1:2181. Will not attempt to authenticate using SASL (unknown error)
03:18:57.659 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Socket connection established, initiating session, client: /127.0.0.1:43486, server: localhost/127.0.0.1:2181
03:18:57.666 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Session establishment complete on server localhost/127.0.0.1:2181, sessionid = 0x1000035b0490002, negotiated timeout = 60000
03:18:57.726 [main-EventThread] INFO  org.apache.curator.framework.state.ConnectionStateManager - State change: CONNECTED
03:18:57.727 [main] INFO  org.apache.curator.framework.imps.CuratorFrameworkImpl - Default schema
03:18:57.750 [main-EventThread] INFO  org.apache.curator.framework.imps.EnsembleTracker - New config event received: {}
03:18:57.751 [main-EventThread] INFO  org.apache.curator.framework.imps.EnsembleTracker - New config event received: {}
03:18:57.820 [main] INFO  org.apache.bookkeeper.stream.storage.impl.cluster.ZkClusterInitializer - Initializing the stream cluster with 2 storage containers with segment store path {}.
03:18:59.333 [main] INFO  org.apache.bookkeeper.stream.storage.impl.cluster.ZkClusterInitializer - Successfully initialized the stream cluster : 
num_storage_containers: 2

03:18:59.337 [Curator-Framework-0] INFO  org.apache.curator.framework.imps.CuratorFrameworkImpl - backgroundOperationsLoop exiting
03:18:59.465 [main] INFO  org.apache.zookeeper.ZooKeeper - Session: 0x1000035b0490002 closed
03:18:59.466 [main-EventThread] INFO  org.apache.zookeeper.ClientCnxn - EventThread shut down for session: 0x1000035b0490002
03:18:59.520 [main] INFO  org.apache.bookkeeper.stream.server.StorageServer - Dlog configuration : {
  "bkcEnsembleSize" : "1",
  "bkcWriteQuorumSize" : "1",
  "bkcAckQuorumSize" : "1"
}
03:18:59.521 [main] INFO  org.apache.bookkeeper.stream.server.StorageServer - Storage configuration : {
  "range.store.dirs" : "data/standalone/bookkeeper/ranges/data"
}
03:18:59.521 [main] INFO  org.apache.bookkeeper.stream.server.StorageServer - Server configuration : {
  "grpc.port" : "4181"
}
03:18:59.560 [main] WARN  org.apache.curator.retry.ExponentialBackoffRetry - maxRetries too large (2147483647). Pinning to 29
03:18:59.715 [main] INFO  org.apache.bookkeeper.meta.zk.ZKMetadataDriverBase - Initialize zookeeper metadata driver at metadata service uri zk://127.0.0.1:2181/ledgers : zkServers = 127.0.0.1:2181, ledgersRootPath = /ledgers.
03:18:59.715 [main] INFO  org.apache.zookeeper.ZooKeeper - Initiating client connection, connectString=127.0.0.1:2181 sessionTimeout=10000 watcher=org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase@4d525897
03:18:59.716 [main] INFO  org.apache.zookeeper.ClientCnxnSocket - jute.maxbuffer value is 10485760 Bytes
03:18:59.717 [main] INFO  org.apache.zookeeper.ClientCnxn - zookeeper.request.timeout value is 0. feature enabled=
03:18:59.730 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Opening socket connection to server localhost/127.0.0.1:2181. Will not attempt to authenticate using SASL (unknown error)
03:18:59.732 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Socket connection established, initiating session, client: /127.0.0.1:43508, server: localhost/127.0.0.1:2181
03:18:59.744 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Session establishment complete on server localhost/127.0.0.1:2181, sessionid = 0x1000035b0490003, negotiated timeout = 10000
03:18:59.745 [main-EventThread] INFO  org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase - ZooKeeper client is connected now.
03:18:59.908 [main] INFO  org.apache.zookeeper.ZooKeeper - Session: 0x1000035b0490003 closed
03:18:59.909 [main-EventThread] INFO  org.apache.zookeeper.ClientCnxn - EventThread shut down for session: 0x1000035b0490003
03:18:59.909 [main] INFO  org.apache.curator.framework.imps.CuratorFrameworkImpl - Starting
03:18:59.912 [main] INFO  org.apache.zookeeper.ZooKeeper - Initiating client connection, connectString=127.0.0.1:2181 sessionTimeout=60000 watcher=org.apache.curator.ConnectionState@7c5ac0
03:18:59.912 [main] INFO  org.apache.zookeeper.ClientCnxnSocket - jute.maxbuffer value is 10485760 Bytes
03:18:59.913 [main] INFO  org.apache.zookeeper.ClientCnxn - zookeeper.request.timeout value is 0. feature enabled=
03:18:59.920 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Opening socket connection to server localhost/127.0.0.1:2181. Will not attempt to authenticate using SASL (unknown error)
03:18:59.920 [main] INFO  org.apache.curator.framework.imps.CuratorFrameworkImpl - Default schema
03:18:59.921 [main] INFO  org.apache.bookkeeper.stream.server.service.CuratorProviderService - Provided curator clients to zookeeper 127.0.0.1:2181.
03:18:59.921 [main] INFO  org.apache.bookkeeper.stream.server.service.DLNamespaceProviderService - Initializing dlog namespace at distributedlog://127.0.0.1:2181/stream/storage
03:18:59.922 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Socket connection established, initiating session, client: /127.0.0.1:43512, server: localhost/127.0.0.1:2181
03:18:59.927 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Session establishment complete on server localhost/127.0.0.1:2181, sessionid = 0x1000035b0490004, negotiated timeout = 60000
03:18:59.928 [main-EventThread] INFO  org.apache.curator.framework.state.ConnectionStateManager - State change: CONNECTED
03:18:59.941 [main-EventThread] INFO  org.apache.curator.framework.imps.EnsembleTracker - New config event received: {}
03:18:59.947 [main-EventThread] INFO  org.apache.curator.framework.imps.EnsembleTracker - New config event received: {}
03:18:59.949 [main] INFO  org.apache.distributedlog.namespace.NamespaceDriverManager - DistributedLog NamespaceDriverManager initialized
03:18:59.982 [main] INFO  org.apache.zookeeper.ZooKeeper - Initiating client connection, connectString=127.0.0.1:2181 sessionTimeout=30000 watcher=org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase@aa23f11
03:18:59.983 [main] INFO  org.apache.zookeeper.ClientCnxnSocket - jute.maxbuffer value is 10485760 Bytes
03:18:59.983 [main] INFO  org.apache.zookeeper.ClientCnxn - zookeeper.request.timeout value is 0. feature enabled=
03:18:59.987 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Opening socket connection to server localhost/127.0.0.1:2181. Will not attempt to authenticate using SASL (unknown error)
03:18:59.988 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Socket connection established, initiating session, client: /127.0.0.1:43514, server: localhost/127.0.0.1:2181
03:18:59.993 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Session establishment complete on server localhost/127.0.0.1:2181, sessionid = 0x1000035b0490005, negotiated timeout = 30000
03:18:59.993 [main-EventThread] INFO  org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase - ZooKeeper client is connected now.
03:19:00.012 [main] INFO  org.apache.distributedlog.ZooKeeperClient - Close zookeeper client default.
03:19:00.012 [main] INFO  org.apache.distributedlog.ZooKeeperClient - Closing zookeeper client default.
03:19:00.124 [main] INFO  org.apache.zookeeper.ZooKeeper - Session: 0x1000035b0490005 closed
03:19:00.124 [main] INFO  org.apache.distributedlog.ZooKeeperClient - Closed zookeeper client default.
03:19:00.128 [main-EventThread] INFO  org.apache.zookeeper.ClientCnxn - EventThread shut down for session: 0x1000035b0490005
03:19:00.164 [main] INFO  org.apache.distributedlog.api.namespace.NamespaceBuilder - No feature provider is set. All features are disabled now.
03:19:00.172 [main] INFO  org.apache.distributedlog.impl.BKNamespaceDriver - Created shared zooKeeper client builder dlzk:distributedlog://127.0.0.1:2181/stream/storage:factory_writer_shared: zkServers = 127.0.0.1:2181, numRetries = 3, sessionTimeout = 30000, retryBackoff = 5000, maxRetryBackoff = 30000, zkAclId = null.
03:19:00.179 [main] INFO  org.apache.zookeeper.ZooKeeper - Initiating client connection, connectString=127.0.0.1:2181 sessionTimeout=30000 watcher=org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase@47f39279
03:19:00.180 [main] INFO  org.apache.zookeeper.ClientCnxnSocket - jute.maxbuffer value is 10485760 Bytes
03:19:00.186 [main] INFO  org.apache.zookeeper.ClientCnxn - zookeeper.request.timeout value is 0. feature enabled=
03:19:00.197 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Opening socket connection to server localhost/127.0.0.1:2181. Will not attempt to authenticate using SASL (unknown error)
03:19:00.198 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Socket connection established, initiating session, client: /127.0.0.1:43520, server: localhost/127.0.0.1:2181
03:19:00.207 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Session establishment complete on server localhost/127.0.0.1:2181, sessionid = 0x1000035b0490006, negotiated timeout = 30000
03:19:00.208 [main-EventThread] INFO  org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase - ZooKeeper client is connected now.
03:19:00.225 [main] INFO  org.apache.distributedlog.impl.BKNamespaceDriver - Created shared client builder bk:distributedlog://127.0.0.1:2181/stream/storage:factory_writer_shared : zkServers = 127.0.0.1:2181, ledgersPath = /ledgers, numIOThreads = 1
03:19:00.239 [main] INFO  org.apache.distributedlog.impl.metadata.BKDLConfig - Propagate BKDLConfig to DLConfig : encodeRegionID = false, firstLogSegmentSequenceNumber = 1, createStreamIfNotExists = true, isFederated = false.
03:19:00.276 [main] INFO  org.apache.distributedlog.impl.BKNamespaceDriver - Initialized BK namespace driver: clientId = storage-server, regionId = 0, federated = false.
03:19:00.338 [main] INFO  org.apache.distributedlog.logsegment.LogSegmentMetadataCache - Log segment cache is enabled = true
03:19:00.338 [main] INFO  org.apache.bookkeeper.stream.server.service.DLNamespaceProviderService - Provided distributedlog namespace at distributedlog://127.0.0.1:2181/stream/storage.
03:19:00.948 [main] INFO  org.apache.bookkeeper.stream.storage.impl.sc.ZkStorageContainerManager - Watched cluster assignment data.
03:19:00.950 [main] INFO  org.apache.bookkeeper.stream.storage.impl.sc.ZkStorageContainerManager - Scheduled storage container probe task at every 15000 ms
03:19:01.114 [main] INFO  org.apache.bookkeeper.stream.storage.impl.grpc.GrpcMetaRangeService - Created MetaRange service
03:19:01.160 [main] INFO  org.apache.bookkeeper.stream.storage.impl.grpc.GrpcTableService - Created Table service
03:19:02.003 [main] INFO  org.apache.zookeeper.ZooKeeper - Initiating client connection, connectString=127.0.0.1:2181 sessionTimeout=10000 watcher=org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase@238a7e3d
03:19:02.009 [main] INFO  org.apache.zookeeper.ClientCnxnSocket - jute.maxbuffer value is 10485760 Bytes
03:19:02.010 [main] INFO  org.apache.zookeeper.ClientCnxn - zookeeper.request.timeout value is 0. feature enabled=
03:19:02.124 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Opening socket connection to server localhost/127.0.0.1:2181. Will not attempt to authenticate using SASL (unknown error)
03:19:02.138 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Socket connection established, initiating session, client: /127.0.0.1:43536, server: localhost/127.0.0.1:2181
03:19:02.188 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Session establishment complete on server localhost/127.0.0.1:2181, sessionid = 0x1000035b0490007, negotiated timeout = 10000
03:19:02.198 [main-EventThread] INFO  org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase - ZooKeeper client is connected now.
03:19:02.279 [main] INFO  org.apache.bookkeeper.stream.server.service.RegistrationStateService - Successfully register myself under registration path /stream/servers/172.17.0.12:4181
03:19:02.332 [main] INFO  org.apache.bookkeeper.stream.server.service.ClusterControllerService - Successfully started the cluster controller.
03:19:02.404 [Curator-LeaderSelector-0] INFO  org.apache.bookkeeper.stream.storage.impl.cluster.ClusterControllerLeaderImpl - Become controller leader to monitor servers for assigning storage containers.
03:19:02.412 [registration-service-provider-scheduler] INFO  org.apache.bookkeeper.stream.storage.impl.cluster.ClusterControllerLeaderImpl - Cluster topology is changed - new cluster : Versioned(value=[172.17.0.12:4181], version=1)
03:19:02.508 [zk-storage-container-manager] INFO  org.apache.bookkeeper.stream.storage.impl.sc.ZkStorageContainerManager - Servers joined : [hostname: "172.17.0.12"
port: 4181
]
03:19:02.536 [zk-storage-container-manager] INFO  org.apache.bookkeeper.stream.storage.impl.sc.ZkStorageContainerManager - Process container changes:
	Ideal = [0, 1]
	Live = []
	Pending = []
	ToStart = [0, 1]
	ToStop = []
03:19:02.538 [zk-storage-container-manager] INFO  org.apache.bookkeeper.stream.storage.impl.sc.ZkStorageContainerManager - Starting storage container (0)
03:19:02.576 [zk-storage-container-manager] INFO  org.apache.bookkeeper.stream.storage.impl.grpc.GrpcMetaRangeService - Created MetaRange service
03:19:02.576 [zk-storage-container-manager] INFO  org.apache.bookkeeper.stream.storage.impl.grpc.GrpcTableService - Created Table service
03:19:02.583 [zk-storage-container-manager] INFO  org.apache.bookkeeper.stream.storage.impl.sc.StorageContainerRegistryImpl - Registered StorageContainer ('0').
03:19:02.584 [zk-storage-container-manager] INFO  org.apache.bookkeeper.stream.storage.impl.sc.StorageContainerImpl - Starting storage container (0) ...
03:19:02.584 [zk-storage-container-manager] INFO  org.apache.bookkeeper.stream.storage.impl.store.MVCCStoreFactoryImpl - Initializing stream(0)/range(0) at storage container (0)
03:19:02.787 [io-write-scheduler-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.statelib.impl.journal.AbstractStateStoreWithJournal - Initializing the local state for mvcc store 000000000000000000/000000000000000000/000000000000000000
03:19:02.800 [zk-storage-container-manager] INFO  org.apache.bookkeeper.stream.storage.impl.store.MVCCStoreFactoryImpl - Initializing stream(1)/range(0) at storage container (0)
03:19:02.802 [io-write-scheduler-OrderedScheduler-1-0] INFO  org.apache.bookkeeper.statelib.impl.journal.AbstractStateStoreWithJournal - Initializing the local state for mvcc store 000000000000000000/000000000000000001/000000000000000000
03:19:02.810 [zk-storage-container-manager] INFO  org.apache.bookkeeper.stream.storage.impl.sc.ZkStorageContainerManager - Starting storage container (1)
03:19:02.811 [zk-storage-container-manager] INFO  org.apache.bookkeeper.stream.storage.impl.grpc.GrpcMetaRangeService - Created MetaRange service
03:19:02.812 [zk-storage-container-manager] INFO  org.apache.bookkeeper.stream.storage.impl.grpc.GrpcTableService - Created Table service
03:19:02.812 [zk-storage-container-manager] INFO  org.apache.bookkeeper.stream.storage.impl.sc.StorageContainerRegistryImpl - Registered StorageContainer ('1').
03:19:02.813 [zk-storage-container-manager] INFO  org.apache.bookkeeper.stream.storage.impl.sc.StorageContainerImpl - Starting storage container (1) ...
03:19:02.813 [zk-storage-container-manager] INFO  org.apache.bookkeeper.stream.storage.impl.store.MVCCStoreFactoryImpl - Initializing stream(1)/range(0) at storage container (1)
03:19:02.816 [io-write-scheduler-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.statelib.impl.rocksdb.checkpoint.RocksCheckpointer - Successfully restore checkpoint 0b0021c1-a93b-4141-9fff-ef30f589a1d5 to /pulsar/data/standalone/bookkeeper/ranges/data/ranges/000000000000000000/000000000000000000/000000000000000000/checkpoints/0b0021c1-a93b-4141-9fff-ef30f589a1d5
03:19:02.829 [io-write-scheduler-OrderedScheduler-1-0] INFO  org.apache.bookkeeper.statelib.impl.rocksdb.checkpoint.RocksCheckpointer - Successfully restore checkpoint 043ea1a6-c53e-4c2b-b0b6-49446b17a293 to /pulsar/data/standalone/bookkeeper/ranges/data/ranges/000000000000000000/000000000000000001/000000000000000000/checkpoints/043ea1a6-c53e-4c2b-b0b6-49446b17a293
03:19:02.899 [io-write-scheduler-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.statelib.impl.journal.AbstractStateStoreWithJournal - Initialized the local state for mvcc store 000000000000000000/000000000000000000/000000000000000000
03:19:02.916 [io-write-scheduler-OrderedScheduler-1-0] INFO  org.apache.bookkeeper.statelib.impl.journal.AbstractStateStoreWithJournal - Initialized the local state for mvcc store 000000000000000000/000000000000000001/000000000000000000
03:19:02.917 [io-write-scheduler-OrderedScheduler-1-0] INFO  org.apache.bookkeeper.statelib.impl.journal.AbstractStateStoreWithJournal - Initializing the local state for mvcc store 000000000000000001/000000000000000001/000000000000000000
03:19:02.934 [io-write-scheduler-OrderedScheduler-1-0] INFO  org.apache.bookkeeper.statelib.impl.rocksdb.checkpoint.RocksCheckpointer - Successfully restore checkpoint 53c8b74d-a085-439e-9a88-62c659ce2f2c to /pulsar/data/standalone/bookkeeper/ranges/data/ranges/000000000000000001/000000000000000001/000000000000000000/checkpoints/53c8b74d-a085-439e-9a88-62c659ce2f2c
03:19:02.982 [io-write-scheduler-OrderedScheduler-1-0] INFO  org.apache.bookkeeper.statelib.impl.journal.AbstractStateStoreWithJournal - Initialized the local state for mvcc store 000000000000000001/000000000000000001/000000000000000000
03:19:03.142 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/streams_000000000000000000_000000000000000000_000000000000000000/<default>/allocation moved version from -1 to 0.
03:19:03.297 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/streams_000000000000000000_000000000000000001_000000000000000000/<default>/allocation moved version from -1 to 0.
03:19:03.309 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For streams_000000000000000000_000000000000000000_000000000000000000:<default> : []
03:19:03.315 [io-write-scheduler-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.statelib.impl.journal.AbstractStateStoreWithJournal - Initialized the journal writer for mvcc store 000000000000000000/000000000000000000/000000000000000000 : last revision = 0
03:19:03.319 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/streams_000000000000000001_000000000000000001_000000000000000000/<default>/allocation moved version from -1 to 0.
03:19:03.327 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For streams_000000000000000000_000000000000000001_000000000000000000:<default> : []
03:19:03.332 [io-write-scheduler-OrderedScheduler-1-0] INFO  org.apache.bookkeeper.statelib.impl.journal.AbstractStateStoreWithJournal - Initialized the journal writer for mvcc store 000000000000000000/000000000000000001/000000000000000000 : last revision = 0
03:19:03.341 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For streams_000000000000000001_000000000000000001_000000000000000000:<default> : []
03:19:03.344 [io-write-scheduler-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For streams_000000000000000000_000000000000000000_000000000000000000:<default> : []
03:19:03.344 [io-write-scheduler-OrderedScheduler-1-0] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For streams_000000000000000000_000000000000000001_000000000000000000:<default> : []
03:19:03.356 [io-write-scheduler-OrderedScheduler-0-0] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/streams_000000000000000000_000000000000000000_000000000000000000/<default>/allocation moved to phase ALLOCATING : version = 0.
03:19:03.358 [io-write-scheduler-OrderedScheduler-1-0] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/streams_000000000000000000_000000000000000001_000000000000000000/<default>/allocation moved to phase ALLOCATING : version = 0.
03:19:03.405 [io-write-scheduler-OrderedScheduler-0-0] INFO  org.apache.zookeeper.ZooKeeper - Initiating client connection, connectString=127.0.0.1:2181 sessionTimeout=30000 watcher=org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase@1fb5f73b
03:19:03.406 [io-write-scheduler-OrderedScheduler-0-0] INFO  org.apache.zookeeper.ClientCnxnSocket - jute.maxbuffer value is 10485760 Bytes
03:19:03.406 [io-write-scheduler-OrderedScheduler-0-0] INFO  org.apache.zookeeper.ClientCnxn - zookeeper.request.timeout value is 0. feature enabled=
03:19:03.409 [io-write-scheduler-OrderedScheduler-0-0-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Opening socket connection to server localhost/127.0.0.1:2181. Will not attempt to authenticate using SASL (unknown error)
03:19:03.410 [io-write-scheduler-OrderedScheduler-0-0-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Socket connection established, initiating session, client: /127.0.0.1:43548, server: localhost/127.0.0.1:2181
03:19:03.414 [io-write-scheduler-OrderedScheduler-0-0-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Session establishment complete on server localhost/127.0.0.1:2181, sessionid = 0x1000035b0490008, negotiated timeout = 30000
03:19:03.414 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase - ZooKeeper client is connected now.
03:19:03.433 [io-write-scheduler-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.meta.zk.ZKMetadataDriverBase - Initialize zookeeper metadata driver with external zookeeper client : ledgersRootPath = /ledgers.
03:19:03.474 [io-write-scheduler-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.client.RackawareEnsemblePlacementPolicyImpl - Initialize rackaware ensemble placement policy @ <Bookie:172.17.0.12:0> @ /pulsar/standalone : org.apache.distributedlog.net.DNSResolverForRacks.
03:19:03.475 [io-write-scheduler-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.client.RackawareEnsemblePlacementPolicyImpl - Not weighted
03:19:03.482 [io-write-scheduler-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.client.BookKeeper - Weighted ledger placement is not enabled
03:19:03.516 [BookKeeperClientScheduler-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.net.NetworkTopologyImpl - Adding a new node: /default-region/default-rack/127.0.0.1:3181
03:19:03.540 [client-scheduler-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.clients.impl.channel.StorageServerChannelManager - Added range server (hostname: "172.17.0.12"
port: 4181
) into the channel manager.
03:19:03.540 [BookKeeperClientScheduler-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.client.RackawareEnsemblePlacementPolicyImpl - Initialize rackaware ensemble placement policy @ <Bookie:172.17.0.12:0> @ /pulsar/standalone : org.apache.bookkeeper.client.TopologyAwareEnsemblePlacementPolicy$DNSResolverDecorator.
03:19:03.551 [BookKeeperClientScheduler-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.client.RackawareEnsemblePlacementPolicyImpl - Not weighted
03:19:03.551 [BookKeeperClientScheduler-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.net.NetworkTopologyImpl - Adding a new node: /default-region/default-rack/127.0.0.1:3181
03:19:03.590 [io-write-scheduler-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BookKeeperClient - BookKeeper Client created bk:distributedlog://127.0.0.1:2181/stream/storage:factory_writer_shared with its own ZK Client : ledgersPath = /ledgers, numRetries = 3, sessionTimeout = 30000, backoff = 5000, maxBackoff = 30000, dnsResolver = 
03:19:03.728 [io-write-scheduler-OrderedScheduler-0-0] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:19:03.729 [io-write-scheduler-OrderedScheduler-1-0] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:19:03.825 [io-write-scheduler-OrderedScheduler-1-0] INFO  org.apache.bookkeeper.statelib.impl.journal.AbstractStateStoreWithJournal - Initialized the journal writer for mvcc store 000000000000000001/000000000000000001/000000000000000000 : last revision = 0
03:19:03.828 [io-write-scheduler-OrderedScheduler-1-0] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For streams_000000000000000001_000000000000000001_000000000000000000:<default> : []
03:19:03.834 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/streams_000000000000000001_000000000000000001_000000000000000000/<default>/allocation moved to phase ALLOCATING : version = 0.
03:19:03.835 [DLM-/stream/storage-OrderedScheduler-0-0] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:19:04.078 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 0
03:19:04.103 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 1
03:19:04.107 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 2
03:19:04.117 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/streams_000000000000000000_000000000000000001_000000000000000000/<default>/allocation moved version from 0 to 1.
03:19:04.118 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/streams_000000000000000000_000000000000000001_000000000000000000/<default>/allocation moved to phase ALLOCATED : version = 1.
03:19:04.121 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/streams_000000000000000000_000000000000000001_000000000000000000/<default>/allocation moved to phase HANDING_OVER : version = 1.
03:19:04.126 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - No max ledger sequence number found while creating log segment 1 for streams_000000000000000000_000000000000000001_000000000000000000:<default>.
03:19:04.133 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/streams_000000000000000001_000000000000000001_000000000000000000/<default>/allocation moved version from 0 to 1.
03:19:04.134 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/streams_000000000000000001_000000000000000001_000000000000000000/<default>/allocation moved to phase ALLOCATED : version = 1.
03:19:04.134 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/streams_000000000000000001_000000000000000001_000000000000000000/<default>/allocation moved to phase HANDING_OVER : version = 1.
03:19:04.135 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - No max ledger sequence number found while creating log segment 1 for streams_000000000000000001_000000000000000001_000000000000000000:<default>.
03:19:04.137 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/streams_000000000000000000_000000000000000000_000000000000000000/<default>/allocation moved version from 0 to 1.
03:19:04.149 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/streams_000000000000000000_000000000000000000_000000000000000000/<default>/allocation moved to phase ALLOCATED : version = 1.
03:19:04.149 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/streams_000000000000000000_000000000000000000_000000000000000000/<default>/allocation moved to phase HANDING_OVER : version = 1.
03:19:04.150 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - No max ledger sequence number found while creating log segment 1 for streams_000000000000000000_000000000000000000_000000000000000000:<default>.
03:19:04.151 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/streams_000000000000000000_000000000000000001_000000000000000000/<default>/allocation moved to phase HANDED_OVER : version = 1.
03:19:04.151 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/streams_000000000000000000_000000000000000001_000000000000000000/<default>/allocation moved version from 1 to 2.
03:19:04.151 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/streams_000000000000000000_000000000000000001_000000000000000000/<default>/allocation moved to phase ALLOCATING : version = 2.
03:19:04.151 [main-EventThread] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:19:04.164 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - streams_000000000000000000_000000000000000001_000000000000000000 added log segment (inprogress_000000000000000001 : [LogSegmentId:0, firstTxId:1, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]) to cache.
03:19:04.165 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/streams_000000000000000001_000000000000000001_000000000000000000/<default>/allocation moved to phase HANDED_OVER : version = 1.
03:19:04.166 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/streams_000000000000000001_000000000000000001_000000000000000000/<default>/allocation moved version from 1 to 2.
03:19:04.166 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/streams_000000000000000001_000000000000000001_000000000000000000/<default>/allocation moved to phase ALLOCATING : version = 2.
03:19:04.166 [main-EventThread] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:19:04.167 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - streams_000000000000000001_000000000000000001_000000000000000000 added log segment (inprogress_000000000000000001 : [LogSegmentId:1, firstTxId:1, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]) to cache.
03:19:04.167 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/streams_000000000000000000_000000000000000000_000000000000000000/<default>/allocation moved to phase HANDED_OVER : version = 1.
03:19:04.168 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/streams_000000000000000000_000000000000000000_000000000000000000/<default>/allocation moved version from 1 to 2.
03:19:04.168 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/streams_000000000000000000_000000000000000000_000000000000000000/<default>/allocation moved to phase ALLOCATING : version = 2.
03:19:04.168 [main-EventThread] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:19:04.169 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - streams_000000000000000000_000000000000000000_000000000000000000 added log segment (inprogress_000000000000000001 : [LogSegmentId:2, firstTxId:1, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]) to cache.
03:19:04.179 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 3
03:19:04.185 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/streams_000000000000000000_000000000000000001_000000000000000000/<default>/allocation moved version from 2 to 3.
03:19:04.191 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/streams_000000000000000000_000000000000000001_000000000000000000/<default>/allocation moved to phase ALLOCATED : version = 3.
03:19:04.192 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 4
03:19:04.192 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 5
03:19:04.199 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/streams_000000000000000001_000000000000000001_000000000000000000/<default>/allocation moved version from 2 to 3.
03:19:04.199 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/streams_000000000000000001_000000000000000001_000000000000000000/<default>/allocation moved to phase ALLOCATED : version = 3.
03:19:04.200 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/streams_000000000000000000_000000000000000000_000000000000000000/<default>/allocation moved version from 2 to 3.
03:19:04.200 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/streams_000000000000000000_000000000000000000_000000000000000000/<default>/allocation moved to phase ALLOCATED : version = 3.
03:19:04.207 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Deleting log segments older than 1595474344197 for streams_000000000000000000_000000000000000001_000000000000000000:<default> : []
03:19:04.222 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Deleting log segments older than 1595474344214 for streams_000000000000000001_000000000000000001_000000000000000000:<default> : []
03:19:04.222 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Deleting log segments older than 1595474344217 for streams_000000000000000000_000000000000000000_000000000000000000:<default> : []
03:19:04.502 [bookie-io-1-2] INFO  org.apache.bookkeeper.proto.AuthHandler - Authentication success on server side
03:19:04.469 [DL-io-0] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: [id: 0x6d572200, L:/127.0.0.1:38070 - R:localhost/127.0.0.1:3181]
03:19:04.503 [DL-io-0] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: 127.0.0.1:3181
03:19:04.504 [bookie-io-1-2] INFO  org.apache.bookkeeper.proto.BookieRequestHandler - Channel connected  [id: 0x11690203, L:/127.0.0.1:3181 - R:/127.0.0.1:38070]
03:19:04.606 [DL-io-0] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - connection [id: 0x6d572200, L:/127.0.0.1:38070 - R:localhost/127.0.0.1:3181] authenticated as BookKeeperPrincipal{ANONYMOUS}
03:19:04.813 [io-write-scheduler-OrderedScheduler-1-0] INFO  org.apache.bookkeeper.statelib.impl.journal.AbstractStateStoreWithJournal - Successfully write a barrier record for mvcc store 000000000000000000/000000000000000001/000000000000000000 at DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}
03:19:04.849 [io-write-scheduler-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.statelib.impl.journal.AbstractStateStoreWithJournal - Successfully write a barrier record for mvcc store 000000000000000000/000000000000000000/000000000000000000 at DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}
03:19:04.863 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - streams_000000000000000000_000000000000000001_000000000000000000 added log segment (inprogress_000000000000000001 : [LogSegmentId:0, firstTxId:1, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]) to cache.
03:19:04.866 [io-write-scheduler-OrderedScheduler-1-0] INFO  org.apache.bookkeeper.statelib.impl.journal.AbstractStateStoreWithJournal - Successfully write a barrier record for mvcc store 000000000000000001/000000000000000001/000000000000000000 at DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}
03:19:04.905 [io-write-scheduler-OrderedScheduler-1-0] INFO  org.apache.bookkeeper.statelib.impl.journal.AbstractStateStoreWithJournal - Successfully open the journal reader for mvcc store 000000000000000000/000000000000000001/000000000000000000 : end dlsn = DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}
03:19:04.905 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - streams_000000000000000000_000000000000000000_000000000000000000 added log segment (inprogress_000000000000000001 : [LogSegmentId:2, firstTxId:1, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]) to cache.
03:19:04.908 [io-write-scheduler-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.statelib.impl.journal.AbstractStateStoreWithJournal - Successfully open the journal reader for mvcc store 000000000000000000/000000000000000000/000000000000000000 : end dlsn = DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}
03:19:04.908 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - streams_000000000000000001_000000000000000001_000000000000000000 added log segment (inprogress_000000000000000001 : [LogSegmentId:1, firstTxId:1, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]) to cache.
03:19:04.930 [io-write-scheduler-OrderedScheduler-1-0] INFO  org.apache.bookkeeper.statelib.impl.journal.AbstractStateStoreWithJournal - Successfully open the journal reader for mvcc store 000000000000000001/000000000000000001/000000000000000000 : end dlsn = DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}
03:19:04.974 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - streams_000000000000000000_000000000000000000_000000000000000000 added log segment (inprogress_000000000000000001 : [LogSegmentId:2, firstTxId:1, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]) to cache.
03:19:04.978 [main-EventThread] INFO  org.apache.distributedlog.ReadAheadEntryReader - Starting the readahead entry reader for streams_000000000000000000_000000000000000000_000000000000000000:<default> : segments = [[LogSegmentId:2, firstTxId:1, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:0]]
03:19:05.010 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - streams_000000000000000000_000000000000000001_000000000000000000 added log segment (inprogress_000000000000000001 : [LogSegmentId:0, firstTxId:1, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]) to cache.
03:19:05.011 [main-EventThread] INFO  org.apache.distributedlog.ReadAheadEntryReader - Starting the readahead entry reader for streams_000000000000000000_000000000000000001_000000000000000000:<default> : segments = [[LogSegmentId:0, firstTxId:1, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:0]]
03:19:05.012 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - streams_000000000000000001_000000000000000001_000000000000000000 added log segment (inprogress_000000000000000001 : [LogSegmentId:1, firstTxId:1, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]) to cache.
03:19:05.013 [main-EventThread] INFO  org.apache.distributedlog.ReadAheadEntryReader - Starting the readahead entry reader for streams_000000000000000001_000000000000000001_000000000000000000:<default> : segments = [[LogSegmentId:1, firstTxId:1, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:0]]
03:19:05.268 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.distributedlog.ReadAheadEntryReader - ReadAhead for streams_000000000000000000_000000000000000001_000000000000000000:<default> is caught up
03:19:05.310 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.distributedlog.ReadAheadEntryReader - ReadAhead for streams_000000000000000000_000000000000000000_000000000000000000:<default> is caught up
03:19:05.319 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.distributedlog.ReadAheadEntryReader - ReadAhead for streams_000000000000000001_000000000000000001_000000000000000000:<default> is caught up
03:19:05.448 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.statelib.impl.journal.AbstractStateStoreWithJournal - Finished replaying journal for state store 000000000000000000/000000000000000001/000000000000000000
03:19:05.455 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.stream.storage.impl.store.MVCCStoreFactoryImpl - Successfully initialize stream(1)/range(0) at storage container (0)
03:19:05.459 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.stream.storage.impl.store.MVCCStoreFactoryImpl - Add store (scId = 0, streamId = 1, rangeId = 0) at storage container (0)
03:19:05.474 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.statelib.impl.journal.AbstractStateStoreWithJournal - Finished replaying journal for state store 000000000000000000/000000000000000000/000000000000000000
03:19:05.477 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.stream.storage.impl.store.MVCCStoreFactoryImpl - Successfully initialize stream(0)/range(0) at storage container (0)
03:19:05.477 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.stream.storage.impl.store.MVCCStoreFactoryImpl - Add store (scId = 0, streamId = 0, rangeId = 0) at storage container (0)
03:19:05.485 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.stream.storage.impl.sc.StorageContainerImpl - Successfully started storage container (0).
03:19:05.502 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.stream.storage.impl.sc.StorageContainerRegistryImpl - Successfully started registered StorageContainer ('0').
03:19:05.504 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.stream.storage.impl.sc.ZkStorageContainerManager - Successfully started storage container (0)
03:19:05.514 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.stream.storage.impl.sc.ZkStorageContainerManager - Storage container (org.apache.bookkeeper.stream.storage.impl.sc.StorageContainerImpl@6764e38f) is added to live set.
03:19:05.520 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.statelib.impl.journal.AbstractStateStoreWithJournal - Finished replaying journal for state store 000000000000000001/000000000000000001/000000000000000000
03:19:05.520 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.stream.storage.impl.store.MVCCStoreFactoryImpl - Successfully initialize stream(1)/range(0) at storage container (1)
03:19:05.521 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.stream.storage.impl.store.MVCCStoreFactoryImpl - Add store (scId = 1, streamId = 1, rangeId = 0) at storage container (1)
03:19:05.521 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.stream.storage.impl.sc.StorageContainerImpl - Successfully started storage container (1).
03:19:05.523 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.stream.storage.impl.sc.StorageContainerRegistryImpl - Successfully started registered StorageContainer ('1').
03:19:05.523 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.stream.storage.impl.sc.ZkStorageContainerManager - Successfully started storage container (1)
03:19:05.525 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.stream.storage.impl.sc.ZkStorageContainerManager - Storage container (org.apache.bookkeeper.stream.storage.impl.sc.StorageContainerImpl@42e50cb6) is added to live set.
03:19:06.616 [main] INFO  org.apache.pulsar.zookeeper.LocalBookkeeperEnsemble - Creating default namespace
03:19:07.001 [main] INFO  org.apache.pulsar.zookeeper.LocalBookkeeperEnsemble - Successfully created 'default' namespace :
namespace_name: "default"
default_stream_conf {
  key_type: HASH
  min_num_ranges: 24
  initial_num_ranges: 24
  split_policy {
    fixed_range_policy {
      num_ranges: 2
    }
  }
  rolling_policy {
    size_policy {
      max_segment_size: 134217728
    }
  }
  retention_policy {
    time_policy {
      retention_minutes: -1
    }
  }
}

[MethodUtil@2bf86f54] info AspectJ Weaver Version 1.9.2 built on Wednesday Oct 24, 2018 at 15:43:33 GMT
[MethodUtil@2bf86f54] info register classloader sun.reflect.misc.MethodUtil@2bf86f54
[MethodUtil@2bf86f54] info using configuration file:/pulsar/lib/org.apache.pulsar-pulsar-zookeeper-utils-2.6.0.jar!/META-INF/aop.xml
[MethodUtil@2bf86f54] info using configuration file:/pulsar/lib/org.apache.pulsar-pulsar-zookeeper-2.6.0.jar!/META-INF/aop.xml
[MethodUtil@2bf86f54] info register aspect org.apache.pulsar.broker.zookeeper.aspectj.ClientCnxnAspect
[MethodUtil@2bf86f54] info register aspect org.apache.pulsar.zookeeper.FinalRequestProcessorAspect
[MethodUtil@2bf86f54] info register aspect org.apache.pulsar.zookeeper.ZooKeeperServerAspect
03:19:07.492 [main] INFO  org.apache.pulsar.broker.PulsarService - Starting Pulsar Broker service; version: '2.6.0'
03:19:07.492 [main] INFO  org.apache.pulsar.broker.PulsarService - Git Revision 653ef409e5a3e72d7a7917d45b54c46e7bff5c16
03:19:07.492 [main] INFO  org.apache.pulsar.broker.PulsarService - Built by  <> on fv-az12 at 2020-06-18T03:46:26+0000
03:19:07.511 [main] INFO  org.apache.pulsar.broker.protocol.ProtocolHandlerUtils - Searching for protocol handlers in /pulsar/./protocols
03:19:07.513 [main] WARN  org.apache.pulsar.broker.protocol.ProtocolHandlerUtils - Protocol handler directory not found
03:19:07.533 [pulsar-ordered-OrderedExecutor-5-0] INFO  org.apache.zookeeper.ZooKeeper - Initiating client connection, connectString=127.0.0.1:2181 sessionTimeout=30000 watcher=org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase@22a42a34
03:19:07.534 [pulsar-ordered-OrderedExecutor-5-0] INFO  org.apache.zookeeper.ClientCnxnSocket - jute.maxbuffer value is 10485760 Bytes
03:19:07.534 [pulsar-ordered-OrderedExecutor-5-0] INFO  org.apache.zookeeper.ClientCnxn - zookeeper.request.timeout value is 0. feature enabled=
03:19:07.544 [pulsar-ordered-OrderedExecutor-5-0-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Opening socket connection to server localhost/127.0.0.1:2181. Will not attempt to authenticate using SASL (unknown error)
03:19:07.544 [pulsar-ordered-OrderedExecutor-5-0-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Socket connection established, initiating session, client: /127.0.0.1:43574, server: localhost/127.0.0.1:2181
03:19:07.551 [pulsar-ordered-OrderedExecutor-5-0-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Session establishment complete on server localhost/127.0.0.1:2181, sessionid = 0x1000035b0490009, negotiated timeout = 30000
03:19:07.551 [pulsar-ordered-OrderedExecutor-5-0-EventThread] INFO  org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase - ZooKeeper client is connected now.
03:19:07.552 [pulsar-ordered-OrderedExecutor-5-0] INFO  org.apache.pulsar.zookeeper.ZookeeperBkClientFactoryImpl - ZooKeeper session established: State:CONNECTED Timeout:30000 sessionid:0x1000035b0490009 local:/127.0.0.1:43574 remoteserver:localhost/127.0.0.1:2181 lastZxid:0 xid:1 sent:1 recv:1 queuedpkts:0 pendingresp:0 queuedevents:0
03:19:07.560 [main] INFO  org.apache.pulsar.broker.PulsarService - starting configuration cache service
03:19:07.752 [pulsar-ordered-OrderedExecutor-6-0] INFO  org.apache.zookeeper.ZooKeeper - Initiating client connection, connectString=127.0.0.1:2181 sessionTimeout=30000 watcher=org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase@6488c04d
03:19:07.753 [pulsar-ordered-OrderedExecutor-6-0] INFO  org.apache.zookeeper.ClientCnxnSocket - jute.maxbuffer value is 10485760 Bytes
03:19:07.754 [pulsar-ordered-OrderedExecutor-6-0] INFO  org.apache.zookeeper.ClientCnxn - zookeeper.request.timeout value is 0. feature enabled=
03:19:07.761 [pulsar-ordered-OrderedExecutor-6-0-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Opening socket connection to server localhost/127.0.0.1:2181. Will not attempt to authenticate using SASL (unknown error)
03:19:07.762 [pulsar-ordered-OrderedExecutor-6-0-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Socket connection established, initiating session, client: /127.0.0.1:43576, server: localhost/127.0.0.1:2181
03:19:07.766 [pulsar-ordered-OrderedExecutor-6-0-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Session establishment complete on server localhost/127.0.0.1:2181, sessionid = 0x1000035b049000a, negotiated timeout = 30000
03:19:07.766 [pulsar-ordered-OrderedExecutor-6-0-EventThread] INFO  org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase - ZooKeeper client is connected now.
03:19:07.767 [pulsar-ordered-OrderedExecutor-6-0] INFO  org.apache.pulsar.zookeeper.ZookeeperBkClientFactoryImpl - ZooKeeper session established: State:CONNECTED Timeout:30000 sessionid:0x1000035b049000a local:/127.0.0.1:43576 remoteserver:localhost/127.0.0.1:2181 lastZxid:0 xid:1 sent:1 recv:1 queuedpkts:0 pendingresp:0 queuedevents:0
03:19:08.061 [pulsar-ordered-OrderedExecutor-5-0-EventThread] INFO  org.apache.pulsar.zookeeper.ZooKeeperCache - [State:CONNECTED Timeout:30000 sessionid:0x1000035b0490009 local:/127.0.0.1:43574 remoteserver:localhost/127.0.0.1:2181 lastZxid:80 xid:3 sent:3 recv:4 queuedpkts:0 pendingresp:0 queuedevents:1] Received ZooKeeper watch event: WatchedEvent state:SyncConnected type:NodeCreated path:/managed-ledgers
03:19:08.102 [pulsar-ordered-OrderedExecutor-5-0-EventThread] INFO  org.apache.pulsar.zookeeper.ZooKeeperCache - [State:CONNECTED Timeout:30000 sessionid:0x1000035b0490009 local:/127.0.0.1:43574 remoteserver:localhost/127.0.0.1:2181 lastZxid:81 xid:5 sent:5 recv:7 queuedpkts:0 pendingresp:0 queuedevents:1] Received ZooKeeper watch event: WatchedEvent state:SyncConnected type:NodeCreated path:/namespace
03:19:08.147 [pulsar-ordered-OrderedExecutor-5-0-EventThread] INFO  org.apache.pulsar.zookeeper.ZooKeeperCache - [State:CONNECTED Timeout:30000 sessionid:0x1000035b0490009 local:/127.0.0.1:43574 remoteserver:localhost/127.0.0.1:2181 lastZxid:82 xid:7 sent:7 recv:10 queuedpkts:0 pendingresp:0 queuedevents:1] Received ZooKeeper watch event: WatchedEvent state:SyncConnected type:NodeCreated path:/admin/local-policies
03:19:08.449 [main] INFO  org.apache.bookkeeper.meta.zk.ZKMetadataDriverBase - Initialize zookeeper metadata driver at metadata service uri zk+null://127.0.0.1:2181/ledgers : zkServers = 127.0.0.1:2181, ledgersRootPath = /ledgers.
03:19:08.450 [main] INFO  org.apache.zookeeper.ZooKeeper - Initiating client connection, connectString=127.0.0.1:2181 sessionTimeout=10000 watcher=org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase@3958db82
03:19:08.455 [main] INFO  org.apache.zookeeper.ClientCnxnSocket - jute.maxbuffer value is 10485760 Bytes
03:19:08.455 [main] INFO  org.apache.zookeeper.ClientCnxn - zookeeper.request.timeout value is 0. feature enabled=
03:19:08.460 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Opening socket connection to server localhost/127.0.0.1:2181. Will not attempt to authenticate using SASL (unknown error)
03:19:08.461 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Socket connection established, initiating session, client: /127.0.0.1:43584, server: localhost/127.0.0.1:2181
03:19:08.477 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Session establishment complete on server localhost/127.0.0.1:2181, sessionid = 0x1000035b049000b, negotiated timeout = 10000
03:19:08.478 [main-EventThread] INFO  org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase - ZooKeeper client is connected now.
03:19:08.540 [pulsar-ordered-OrderedExecutor-5-0-EventThread] INFO  org.apache.pulsar.zookeeper.ZkBookieRackAffinityMapping - Reloading the bookie rack affinity mapping cache.
03:19:08.584 [main] WARN  org.apache.bookkeeper.client.TopologyAwareEnsemblePlacementPolicy - Failed to resolve network location for 172.17.0.12, using default rack for it : /default-rack.
03:19:08.585 [main] INFO  org.apache.bookkeeper.client.RackawareEnsemblePlacementPolicyImpl - Initialize rackaware ensemble placement policy @ <Bookie:172.17.0.12:0> @ /default-rack : org.apache.pulsar.zookeeper.ZkBookieRackAffinityMapping.
03:19:08.585 [main] INFO  org.apache.bookkeeper.client.RackawareEnsemblePlacementPolicyImpl - Not weighted
03:19:08.585 [main] INFO  org.apache.bookkeeper.client.BookKeeper - Weighted ledger placement is not enabled
03:19:08.595 [BookKeeperClientScheduler-OrderedScheduler-0-0] WARN  org.apache.bookkeeper.client.TopologyAwareEnsemblePlacementPolicy - Failed to resolve network location for 127.0.0.1, using default rack for it : /default-rack.
03:19:08.601 [BookKeeperClientScheduler-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.net.NetworkTopologyImpl - Adding a new node: /default-rack/127.0.0.1:3181
03:19:08.743 [main] INFO  org.apache.bookkeeper.mledger.impl.EntryCacheManager - Initialized managed-ledger entry cache of 819.0 Mb
03:19:08.914 [main] INFO  org.apache.pulsar.broker.service.BrokerService - Using 2 threads for broker service IO
03:19:08.940 [main] INFO  org.apache.pulsar.broker.authorization.AuthorizationService - org.apache.pulsar.broker.authorization.PulsarAuthorizationProvider has been loaded.
03:19:08.957 [main] INFO  org.apache.pulsar.broker.authentication.AuthenticationService - Authentication is disabled
03:19:09.000 [main] INFO  org.apache.pulsar.broker.service.BrokerService - Disabling per broker unack-msg blocking due invalid unAckMsgSubscriptionPercentageLimitOnBrokerBlocked 0.16 
03:19:09.026 [main] INFO  org.apache.pulsar.broker.PulsarService - Starting name space service, bootstrap namespaces=[]
03:19:09.161 [main] INFO  org.apache.bookkeeper.meta.zk.ZKMetadataDriverBase - Initialize zookeeper metadata driver at metadata service uri zk+null://127.0.0.1:2181/ledgers : zkServers = 127.0.0.1:2181, ledgersRootPath = /ledgers.
03:19:09.162 [main] INFO  org.apache.zookeeper.ZooKeeper - Initiating client connection, connectString=127.0.0.1:2181 sessionTimeout=10000 watcher=org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase@12c30824
03:19:09.163 [main] INFO  org.apache.zookeeper.ClientCnxnSocket - jute.maxbuffer value is 10485760 Bytes
03:19:09.164 [main] INFO  org.apache.zookeeper.ClientCnxn - zookeeper.request.timeout value is 0. feature enabled=
03:19:09.175 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Opening socket connection to server localhost/127.0.0.1:2181. Will not attempt to authenticate using SASL (unknown error)
03:19:09.176 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Socket connection established, initiating session, client: /127.0.0.1:43592, server: localhost/127.0.0.1:2181
03:19:09.185 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Session establishment complete on server localhost/127.0.0.1:2181, sessionid = 0x1000035b049000c, negotiated timeout = 10000
03:19:09.187 [main-EventThread] INFO  org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase - ZooKeeper client is connected now.
03:19:09.198 [main] WARN  org.apache.bookkeeper.client.TopologyAwareEnsemblePlacementPolicy - Failed to resolve network location for 172.17.0.12, using default rack for it : /default-rack.
03:19:09.198 [main] INFO  org.apache.bookkeeper.client.RackawareEnsemblePlacementPolicyImpl - Initialize rackaware ensemble placement policy @ <Bookie:172.17.0.12:0> @ /default-rack : org.apache.pulsar.zookeeper.ZkBookieRackAffinityMapping.
03:19:09.199 [main] INFO  org.apache.bookkeeper.client.RackawareEnsemblePlacementPolicyImpl - Not weighted
03:19:09.199 [main] INFO  org.apache.bookkeeper.client.BookKeeper - Weighted ledger placement is not enabled
03:19:09.220 [BookKeeperClientScheduler-OrderedScheduler-0-0] WARN  org.apache.bookkeeper.client.TopologyAwareEnsemblePlacementPolicy - Failed to resolve network location for 127.0.0.1, using default rack for it : /default-rack.
03:19:09.225 [BookKeeperClientScheduler-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.net.NetworkTopologyImpl - Adding a new node: /default-rack/127.0.0.1:3181
03:19:09.314 [main] INFO  org.apache.pulsar.broker.PulsarService - No ledger offloader configured, using NULL instance
03:19:09.332 [main] INFO  org.apache.pulsar.broker.intercept.BrokerInterceptorUtils - Searching for broker interceptors in /pulsar/./interceptors
03:19:09.336 [main] WARN  org.apache.pulsar.broker.intercept.BrokerInterceptorUtils - Pulsar broker interceptors directory not found
03:19:09.389 [main] INFO  org.apache.pulsar.broker.service.DistributedIdGenerator - Created sequential node at /counters/producer-name/-0000000000 -- Generator Id is standalone-0
03:19:09.423 [main] INFO  org.apache.pulsar.broker.service.BrokerService - Started Pulsar Broker service on /0.0.0.0:6650
03:19:09.833 [main] INFO  org.apache.pulsar.broker.service.BrokerService - Scheduling a thread to check backlog quota after [60] seconds in background
03:19:10.107 [main] INFO  org.eclipse.jetty.util.log - Logging initialized @27831ms to org.eclipse.jetty.util.log.Slf4jLog
03:19:11.863 [main] INFO  org.apache.zookeeper.ZooKeeper - Initiating client connection, connectString=127.0.0.1:2181 sessionTimeout=30000 watcher=org.apache.pulsar.zookeeper.ZookeeperClientFactoryImpl$$Lambda$384/202984526@3ba50851
03:19:11.870 [main] INFO  org.apache.zookeeper.ClientCnxnSocket - jute.maxbuffer value is 10485760 Bytes
03:19:11.871 [main] INFO  org.apache.zookeeper.ClientCnxn - zookeeper.request.timeout value is 0. feature enabled=
03:19:11.910 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Opening socket connection to server localhost/127.0.0.1:2181. Will not attempt to authenticate using SASL (unknown error)
03:19:11.912 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Socket connection established, initiating session, client: /127.0.0.1:43612, server: localhost/127.0.0.1:2181
03:19:11.937 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Session establishment complete on server localhost/127.0.0.1:2181, sessionid = 0x1000035b049000d, negotiated timeout = 30000
03:19:11.937 [main-EventThread] INFO  org.apache.pulsar.zookeeper.ZookeeperClientFactoryImpl - ZooKeeper session established: State:CONNECTED Timeout:30000 sessionid:0x1000035b049000d local:/127.0.0.1:43612 remoteserver:localhost/127.0.0.1:2181 lastZxid:0 xid:1 sent:1 recv:1 queuedpkts:0 pendingresp:0 queuedevents:0
03:19:11.953 [main] INFO  org.apache.pulsar.websocket.WebSocketService - Global Zookeeper cache started
03:19:11.953 [main] INFO  org.apache.pulsar.broker.authentication.AuthenticationService - Authentication is disabled
03:19:11.953 [main] INFO  org.apache.pulsar.websocket.WebSocketService - Pulsar WebSocket Service started
03:19:12.124 [main] INFO  org.eclipse.jetty.server.Server - jetty-9.4.20.v20190813; built: 2019-08-13T21:28:18.144Z; git: 84700530e645e812b336747464d6fbbf370c9a20; jvm 1.8.0_252-b09
03:19:12.376 [main] INFO  org.eclipse.jetty.server.session - DefaultSessionIdManager workerName=node0
03:19:12.376 [main] INFO  org.eclipse.jetty.server.session - No SessionScavenger set, using defaults
03:19:12.380 [main] INFO  org.eclipse.jetty.server.session - node0 Scavenging every 660000ms
03:19:18.265 [main] INFO  org.eclipse.jetty.server.handler.ContextHandler - Started o.e.j.s.ServletContextHandler@2c02cf78{/,null,AVAILABLE}
03:19:18.549 [main] INFO  org.eclipse.jetty.server.handler.ContextHandler - Started o.e.j.s.ServletContextHandler@3e7fc07e{/,null,AVAILABLE}
03:19:19.778 [main] INFO  org.eclipse.jetty.server.handler.ContextHandler - Started o.e.j.s.ServletContextHandler@13d1653{/admin,null,AVAILABLE}
03:19:20.367 [main] INFO  org.eclipse.jetty.server.handler.ContextHandler - Started o.e.j.s.ServletContextHandler@759c53e5{/admin/v2,null,AVAILABLE}
03:19:20.600 [main] INFO  org.eclipse.jetty.server.handler.ContextHandler - Started o.e.j.s.ServletContextHandler@1500edf3{/admin/v3,null,AVAILABLE}
03:19:20.708 [main] INFO  org.eclipse.jetty.server.handler.ContextHandler - Started o.e.j.s.ServletContextHandler@28d37d43{/lookup,null,AVAILABLE}
03:19:20.710 [main] INFO  org.eclipse.jetty.server.handler.ContextHandler - Started o.e.j.s.ServletContextHandler@23e1f610{/metrics,null,AVAILABLE}
03:19:20.759 [main] INFO  org.eclipse.jetty.server.handler.ContextHandler - Started o.e.j.s.ServletContextHandler@1a61f634{/ws/producer,null,AVAILABLE}
03:19:20.762 [main] INFO  org.eclipse.jetty.server.handler.ContextHandler - Started o.e.j.s.ServletContextHandler@609edb55{/ws/v2/producer,null,AVAILABLE}
03:19:20.765 [main] INFO  org.eclipse.jetty.server.handler.ContextHandler - Started o.e.j.s.ServletContextHandler@3533d790{/ws/consumer,null,AVAILABLE}
03:19:20.768 [main] INFO  org.eclipse.jetty.server.handler.ContextHandler - Started o.e.j.s.ServletContextHandler@20a2930f{/ws/v2/consumer,null,AVAILABLE}
03:19:20.772 [main] INFO  org.eclipse.jetty.server.handler.ContextHandler - Started o.e.j.s.ServletContextHandler@73dc7db0{/ws/reader,null,AVAILABLE}
03:19:20.774 [main] INFO  org.eclipse.jetty.server.handler.ContextHandler - Started o.e.j.s.ServletContextHandler@147892be{/ws/v2/reader,null,AVAILABLE}
03:19:20.776 [main] INFO  org.eclipse.jetty.server.handler.ContextHandler - Started o.e.j.s.h.ContextHandler@29ebaf2f{/static,null,AVAILABLE}
03:19:20.797 [main] INFO  org.eclipse.jetty.server.AbstractConnector - Started PulsarServerConnector@47bbf44d{HTTP/1.1,[http/1.1]}{0.0.0.0:8080}
03:19:20.798 [main] INFO  org.eclipse.jetty.server.Server - Started @38537ms
03:19:20.798 [main] INFO  org.apache.pulsar.broker.web.WebService - HTTP Service started at http://0.0.0.0:8080
03:19:20.798 [main] INFO  org.apache.pulsar.broker.web.WebService - HTTPS Service disabled
03:19:20.809 [main] INFO  org.apache.pulsar.broker.loadbalance.LeaderElectionService - LeaderElectionService started
03:19:20.817 [main] INFO  org.apache.pulsar.broker.loadbalance.LeaderElectionService - Broker [http://localhost:8080] is the leader now, notifying the listener...
03:19:20.828 [main] INFO  org.apache.pulsar.broker.cache.LocalZooKeeperCacheService - Successfully created local policies for /admin/local-policies/pulsar/standalone/localhost:8080 -- Optional.empty
03:19:20.836 [main] INFO  org.apache.pulsar.broker.namespace.OwnershipCache - Trying to acquire ownership of pulsar/standalone/localhost:8080/0x00000000_0xffffffff
03:19:20.860 [pulsar-ordered-OrderedExecutor-5-0-EventThread] INFO  org.apache.pulsar.broker.namespace.OwnershipCache - Successfully acquired ownership of /namespace/pulsar/standalone/localhost:8080/0x00000000_0xffffffff
03:19:20.861 [pulsar-30-1] INFO  org.apache.pulsar.broker.PulsarService - Loading all topics on bundle: pulsar/standalone/localhost:8080/0x00000000_0xffffffff
03:19:20.862 [main] INFO  org.apache.pulsar.broker.namespace.NamespaceService - added heartbeat namespace name in local cache: ns=pulsar/standalone/localhost:8080
03:19:20.879 [main] INFO  org.apache.pulsar.broker.PulsarService - Starting load management service ...
03:19:20.915 [main] INFO  org.apache.pulsar.broker.PulsarService - SLA Namespace = sla-monitor/standalone/localhost:8080 doesn't exist.
03:19:20.917 [main] INFO  org.apache.pulsar.broker.PulsarService - Starting function worker service
03:19:20.932 [main] INFO  org.apache.pulsar.broker.PulsarService - Created property public for function worker
03:19:20.943 [main] INFO  org.apache.pulsar.broker.PulsarService - Created cluster standalone for function worker
03:19:20.972 [main] INFO  org.apache.pulsar.broker.PulsarService - Created namespace public/functions for function worker service
03:19:20.978 [main] INFO  org.apache.zookeeper.ZooKeeper - Initiating client connection, connectString=127.0.0.1:2181 sessionTimeout=30000 watcher=org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase@13eb8ca
03:19:20.978 [main] INFO  org.apache.zookeeper.ClientCnxnSocket - jute.maxbuffer value is 10485760 Bytes
03:19:20.978 [main] INFO  org.apache.zookeeper.ClientCnxn - zookeeper.request.timeout value is 0. feature enabled=
03:19:20.981 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Opening socket connection to server localhost/127.0.0.1:2181. Will not attempt to authenticate using SASL (unknown error)
03:19:20.982 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Socket connection established, initiating session, client: /127.0.0.1:43682, server: localhost/127.0.0.1:2181
03:19:20.984 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Session establishment complete on server localhost/127.0.0.1:2181, sessionid = 0x1000035b049000e, negotiated timeout = 30000
03:19:20.985 [main-EventThread] INFO  org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase - ZooKeeper client is connected now.
03:19:20.992 [main] INFO  org.apache.distributedlog.ZooKeeperClient - Close zookeeper client default.
03:19:20.992 [main] INFO  org.apache.distributedlog.ZooKeeperClient - Closing zookeeper client default.
03:19:21.095 [main] INFO  org.apache.zookeeper.ZooKeeper - Session: 0x1000035b049000e closed
03:19:21.095 [main-EventThread] INFO  org.apache.zookeeper.ClientCnxn - EventThread shut down for session: 0x1000035b049000e
03:19:21.095 [main] INFO  org.apache.distributedlog.ZooKeeperClient - Closed zookeeper client default.
03:19:21.095 [main] INFO  org.apache.pulsar.broker.PulsarService - Function worker service setup completed
03:19:21.098 [main] INFO  org.apache.pulsar.functions.worker.WorkerService - Starting worker c-standalone-fw-localhost-8080...
03:19:21.118 [main] INFO  org.apache.pulsar.functions.worker.WorkerService - Worker Configs: {
  "workerId" : "c-standalone-fw-localhost-8080",
  "workerHostname" : "localhost",
  "workerPort" : 8080,
  "workerPortTls" : 6751,
  "authenticateMetricsEndpoint" : true,
  "includeStandardPrometheusMetrics" : false,
  "jvmGCMetricsLoggerClassName" : null,
  "numHttpServerThreads" : 8,
  "configurationStoreServers" : "127.0.0.1:2181",
  "zooKeeperSessionTimeoutMillis" : 30000,
  "zooKeeperOperationTimeoutSeconds" : 30,
  "zooKeeperCacheExpirySeconds" : 300,
  "connectorsDirectory" : "./connectors",
  "narExtractionDirectory" : "/tmp",
  "validateConnectorConfig" : false,
  "functionsDirectory" : "./functions",
  "functionMetadataTopicName" : "metadata",
  "functionWebServiceUrl" : null,
  "pulsarServiceUrl" : "pulsar://localhost:6650",
  "pulsarWebServiceUrl" : "http://localhost:8080",
  "clusterCoordinationTopicName" : "coordinate",
  "pulsarFunctionsNamespace" : "public/functions",
  "pulsarFunctionsCluster" : "standalone",
  "numFunctionPackageReplicas" : 1,
  "downloadDirectory" : "download/pulsar_functions",
  "stateStorageServiceUrl" : "bk://127.0.0.1:4181",
  "functionAssignmentTopicName" : "assignments",
  "schedulerClassName" : "org.apache.pulsar.functions.worker.scheduler.RoundRobinScheduler",
  "failureCheckFreqMs" : 30000,
  "rescheduleTimeoutMs" : 60000,
  "initialBrokerReconnectMaxRetries" : 60,
  "assignmentWriteMaxRetries" : 60,
  "instanceLivenessCheckFreqMs" : 30000,
  "clientAuthenticationPlugin" : "org.apache.pulsar.client.impl.auth.AuthenticationDisabled",
  "clientAuthenticationParameters" : "",
  "bookkeeperClientAuthenticationPlugin" : null,
  "bookkeeperClientAuthenticationParametersName" : null,
  "bookkeeperClientAuthenticationParameters" : null,
  "topicCompactionFrequencySec" : 1800,
  "tlsEnabled" : true,
  "tlsCertificateFilePath" : null,
  "tlsKeyFilePath" : null,
  "tlsTrustCertsFilePath" : "",
  "tlsAllowInsecureConnection" : false,
  "tlsRequireTrustedClientCertOnConnect" : false,
  "useTls" : false,
  "tlsHostnameVerificationEnable" : false,
  "tlsCertRefreshCheckDurationSec" : 300,
  "authenticationEnabled" : false,
  "authenticationProviders" : [ ],
  "authorizationEnabled" : false,
  "authorizationProvider" : "org.apache.pulsar.broker.authorization.PulsarAuthorizationProvider",
  "superUserRoles" : [ ],
  "properties" : { },
  "brokerClientTrustCertsFilePath" : null,
  "functionRuntimeFactoryClassName" : "org.apache.pulsar.functions.runtime.process.ProcessRuntimeFactory",
  "functionRuntimeFactoryConfigs" : {
    "logDirectory" : "/tmp",
    "javaInstanceJarLocation" : null,
    "pythonInstanceLocation" : null,
    "extraFunctionDependenciesDir" : null
  },
  "secretsProviderConfiguratorClassName" : null,
  "secretsProviderConfiguratorConfig" : null,
  "functionInstanceMinResources" : null,
  "functionAuthProviderClassName" : null,
  "runtimeCustomizerClassName" : null,
  "runtimeCustomizerConfig" : { },
  "maxPendingAsyncRequests" : 1000,
  "threadContainerFactory" : null,
  "processContainerFactory" : null,
  "kubernetesContainerFactory" : null,
  "workerWebAddress" : "http://localhost:8080",
  "functionAssignmentTopic" : "persistent://public/functions/assignments",
  "clusterCoordinationTopic" : "persistent://public/functions/coordinate",
  "functionMetadataTopic" : "persistent://public/functions/metadata",
  "tlsTrustChainBytes" : null
}
03:19:21.122 [main] INFO  org.apache.distributedlog.api.namespace.NamespaceBuilder - No feature provider is set. All features are disabled now.
03:19:21.124 [main] INFO  org.apache.distributedlog.impl.BKNamespaceDriver - Created shared zooKeeper client builder dlzk:distributedlog://127.0.0.1:2181/pulsar/functions:factory_writer_shared: zkServers = 127.0.0.1:2181, numRetries = 3, sessionTimeout = 30000, retryBackoff = 5000, maxRetryBackoff = 30000, zkAclId = null.
03:19:21.124 [main] INFO  org.apache.zookeeper.ZooKeeper - Initiating client connection, connectString=127.0.0.1:2181 sessionTimeout=30000 watcher=org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase@31489acc
03:19:21.125 [main] INFO  org.apache.zookeeper.ClientCnxnSocket - jute.maxbuffer value is 10485760 Bytes
03:19:21.125 [main] INFO  org.apache.zookeeper.ClientCnxn - zookeeper.request.timeout value is 0. feature enabled=
03:19:21.130 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Opening socket connection to server localhost/127.0.0.1:2181. Will not attempt to authenticate using SASL (unknown error)
03:19:21.131 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Socket connection established, initiating session, client: /127.0.0.1:43684, server: localhost/127.0.0.1:2181
03:19:21.134 [main-SendThread(127.0.0.1:2181)] INFO  org.apache.zookeeper.ClientCnxn - Session establishment complete on server localhost/127.0.0.1:2181, sessionid = 0x1000035b049000f, negotiated timeout = 30000
03:19:21.134 [main-EventThread] INFO  org.apache.bookkeeper.zookeeper.ZooKeeperWatcherBase - ZooKeeper client is connected now.
03:19:21.137 [main] INFO  org.apache.distributedlog.impl.BKNamespaceDriver - Created shared client builder bk:distributedlog://127.0.0.1:2181/pulsar/functions:factory_writer_shared : zkServers = 127.0.0.1:2181, ledgersPath = /ledgers, numIOThreads = 1
03:19:21.137 [main] INFO  org.apache.distributedlog.impl.metadata.BKDLConfig - Propagate BKDLConfig to DLConfig : encodeRegionID = false, firstLogSegmentSequenceNumber = 1, createStreamIfNotExists = true, isFederated = false.
03:19:21.137 [main] INFO  org.apache.distributedlog.impl.BKNamespaceDriver - Initialized BK namespace driver: clientId = function-worker-c-standalone-fw-localhost-8080, regionId = 0, federated = false.
03:19:21.138 [main] INFO  org.apache.distributedlog.logsegment.LogSegmentMetadataCache - Log segment cache is enabled = true
03:19:21.657 [main] INFO  org.apache.pulsar.functions.worker.WorkerService - Created Pulsar client
03:19:21.970 [pulsar-web-69-6] INFO  org.eclipse.jetty.util.TypeUtil - JVM Runtime does not support Modules
03:19:22.096 [pulsar-ordered-OrderedExecutor-5-0-EventThread] INFO  org.apache.pulsar.broker.cache.LocalZooKeeperCacheService - Successfully copyied bundles data to local zk at /admin/local-policies/public/functions
03:19:22.096 [pulsar-ordered-OrderedExecutor-5-0-EventThread] INFO  org.apache.pulsar.broker.cache.LocalZooKeeperCacheService - Successfully created local policies for /admin/local-policies/public/functions -- Optional[org.apache.pulsar.common.policies.data.LocalPolicies@6d50a12c]
03:19:22.120 [pulsar-30-1] INFO  org.apache.pulsar.broker.namespace.OwnershipCache - Trying to acquire ownership of public/functions/0x40000000_0x80000000
03:19:22.130 [pulsar-ordered-OrderedExecutor-5-0-EventThread] INFO  org.apache.pulsar.broker.namespace.OwnershipCache - Successfully acquired ownership of /namespace/public/functions/0x40000000_0x80000000
03:19:22.131 [pulsar-30-2] INFO  org.apache.pulsar.broker.PulsarService - Loading all topics on bundle: public/functions/0x40000000_0x80000000
03:19:22.205 [pulsar-web-69-6] INFO  org.apache.bookkeeper.mledger.impl.ManagedLedgerImpl - Opening managed ledger public/functions/persistent/assignments
03:19:22.211 [bookkeeper-ml-workers-OrderedExecutor-0-0] INFO  org.apache.bookkeeper.mledger.impl.MetaStoreImpl - Creating '/managed-ledgers/public/functions/persistent/assignments'
03:19:22.222 [pulsar-ordered-OrderedExecutor-5-0-EventThread] INFO  org.apache.pulsar.zookeeper.ZooKeeperManagedLedgerCache - [State:CONNECTED Timeout:30000 sessionid:0x1000035b0490009 local:/127.0.0.1:43574 remoteserver:localhost/127.0.0.1:2181 lastZxid:131 xid:72 sent:72 recv:76 queuedpkts:0 pendingresp:0 queuedevents:1] Received ZooKeeper watch event: WatchedEvent state:SyncConnected type:NodeCreated path:/managed-ledgers/public/functions/persistent
03:19:22.223 [pulsar-ordered-OrderedExecutor-5-0-EventThread] INFO  org.apache.pulsar.zookeeper.ZooKeeperManagedLedgerCache - invalidate called in zookeeperChildrenCache for path /managed-ledgers/public/functions/persistent
03:19:22.231 [zk-metadata-store-callback-48-1] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:19:22.250 [main-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 6
03:19:22.253 [bookkeeper-ml-workers-OrderedExecutor-0-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedLedgerImpl - [public/functions/persistent/assignments] Created ledger 6
03:19:22.294 [bookkeeper-ml-workers-OrderedExecutor-0-0] INFO  org.apache.pulsar.broker.service.AbstractTopic - Disabling publish throttling for persistent://public/functions/assignments
03:19:22.309 [bookkeeper-ml-workers-OrderedExecutor-0-0] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://public/functions/assignments] There are no replicated subscriptions on the topic
03:19:22.315 [bookkeeper-ml-workers-OrderedExecutor-0-0] INFO  org.apache.pulsar.broker.service.BrokerService - Created topic persistent://public/functions/assignments - dedup is disabled
03:19:22.317 [pulsar-web-69-6] INFO  org.apache.pulsar.broker.admin.impl.PersistentTopicsBase - [null] Successfully created non-partitioned topic PersistentTopic{topic=persistent://public/functions/assignments}
03:19:22.340 [pulsar-web-69-6] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:19:21 +0000] "PUT /admin/v2/persistent/public/functions/assignments HTTP/1.1" 204 0 "-" "Pulsar-Java-v2.6.0" 366
03:19:22.366 [pulsar-ordered-OrderedExecutor-7-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedLedgerImpl - Opening managed ledger public/functions/persistent/coordinate
03:19:22.368 [bookkeeper-ml-workers-OrderedExecutor-2-0] INFO  org.apache.bookkeeper.mledger.impl.MetaStoreImpl - Creating '/managed-ledgers/public/functions/persistent/coordinate'
03:19:22.370 [zk-metadata-store-callback-48-1] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:19:22.375 [main-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 7
03:19:22.376 [bookkeeper-ml-workers-OrderedExecutor-2-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedLedgerImpl - [public/functions/persistent/coordinate] Created ledger 7
03:19:22.381 [bookkeeper-ml-workers-OrderedExecutor-2-0] INFO  org.apache.pulsar.broker.service.AbstractTopic - Disabling publish throttling for persistent://public/functions/coordinate
03:19:22.382 [bookkeeper-ml-workers-OrderedExecutor-2-0] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://public/functions/coordinate] There are no replicated subscriptions on the topic
03:19:22.382 [bookkeeper-ml-workers-OrderedExecutor-2-0] INFO  org.apache.pulsar.broker.service.BrokerService - Created topic persistent://public/functions/coordinate - dedup is disabled
03:19:22.386 [pulsar-web-69-1] INFO  org.apache.pulsar.broker.admin.impl.PersistentTopicsBase - [null] Successfully created non-partitioned topic PersistentTopic{topic=persistent://public/functions/coordinate}
03:19:22.388 [pulsar-web-69-1] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:19:22 +0000] "PUT /admin/v2/persistent/public/functions/coordinate HTTP/1.1" 204 0 "-" "Pulsar-Java-v2.6.0" 30
03:19:22.397 [pulsar-ordered-OrderedExecutor-6-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedLedgerImpl - Opening managed ledger public/functions/persistent/metadata
03:19:22.398 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.bookkeeper.mledger.impl.MetaStoreImpl - Creating '/managed-ledgers/public/functions/persistent/metadata'
03:19:22.401 [zk-metadata-store-callback-48-1] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:19:22.407 [main-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 8
03:19:22.408 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedLedgerImpl - [public/functions/persistent/metadata] Created ledger 8
03:19:22.414 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.pulsar.broker.service.AbstractTopic - Disabling publish throttling for persistent://public/functions/metadata
03:19:22.415 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://public/functions/metadata] There are no replicated subscriptions on the topic
03:19:22.415 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.pulsar.broker.service.BrokerService - Created topic persistent://public/functions/metadata - dedup is disabled
03:19:22.415 [pulsar-web-69-5] INFO  org.apache.pulsar.broker.admin.impl.PersistentTopicsBase - [null] Successfully created non-partitioned topic PersistentTopic{topic=persistent://public/functions/metadata}
03:19:22.416 [pulsar-web-69-5] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:19:22 +0000] "PUT /admin/v2/persistent/public/functions/metadata HTTP/1.1" 204 0 "-" "Pulsar-Java-v2.6.0" 25
03:19:22.724 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ConnectionPool - [[id: 0x87d329bb, L:/127.0.0.1:51928 - R:localhost/127.0.0.1:6650]] Connected to server
03:19:22.746 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /127.0.0.1:51928
03:19:22.826 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ProducerStatsRecorderImpl - Starting Pulsar producer perf with config: {
  "topicName" : "persistent://public/functions/assignments",
  "producerName" : "c-standalone-fw-localhost-8080-scheduler-manager",
  "sendTimeoutMs" : 0,
  "blockIfQueueFull" : true,
  "maxPendingMessages" : 1000,
  "maxPendingMessagesAcrossPartitions" : 50000,
  "messageRoutingMode" : "RoundRobinPartition",
  "hashingScheme" : "JavaStringHash",
  "cryptoFailureAction" : "FAIL",
  "batchingMaxPublishDelayMicros" : 1000,
  "batchingPartitionSwitchFrequencyByPublishDelay" : 10,
  "batchingMaxMessages" : 1000,
  "batchingMaxBytes" : 131072,
  "batchingEnabled" : false,
  "chunkingEnabled" : false,
  "compressionType" : "LZ4",
  "initialSequenceId" : null,
  "autoUpdatePartitions" : true,
  "multiSchema" : true,
  "properties" : { }
}
03:19:22.831 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ProducerStatsRecorderImpl - Pulsar client config: {
  "serviceUrl" : "pulsar://localhost:6650",
  "authPluginClassName" : null,
  "authParams" : null,
  "authParamMap" : null,
  "operationTimeoutMs" : 30000,
  "statsIntervalSeconds" : 60,
  "numIoThreads" : 1,
  "numListenerThreads" : 1,
  "connectionsPerBroker" : 1,
  "useTcpNoDelay" : true,
  "useTls" : false,
  "tlsTrustCertsFilePath" : "",
  "tlsAllowInsecureConnection" : false,
  "tlsHostnameVerificationEnable" : false,
  "concurrentLookupRequest" : 5000,
  "maxLookupRequest" : 50000,
  "maxLookupRedirects" : 20,
  "maxNumberOfRejectedRequestPerConnection" : 50,
  "keepAliveIntervalSeconds" : 30,
  "connectionTimeoutMs" : 10000,
  "requestTimeoutMs" : 60000,
  "initialBackoffIntervalNanos" : 100000000,
  "maxBackoffIntervalNanos" : 60000000000,
  "listenerName" : null,
  "useKeyStoreTls" : false,
  "sslProvider" : null,
  "tlsTrustStoreType" : "JKS",
  "tlsTrustStorePath" : null,
  "tlsTrustStorePassword" : null,
  "tlsCiphers" : [ ],
  "tlsProtocols" : [ ],
  "proxyServiceUrl" : null,
  "proxyProtocol" : null
}
03:19:22.857 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ProducerImpl - [persistent://public/functions/assignments] [c-standalone-fw-localhost-8080-scheduler-manager] Creating producer on cnx [id: 0x87d329bb, L:/127.0.0.1:51928 - R:localhost/127.0.0.1:6650]
03:19:22.868 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/127.0.0.1:51928][persistent://public/functions/assignments] Creating producer. producerId=0
03:19:22.881 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/127.0.0.1:51928] persistent://public/functions/assignments configured with schema false
03:19:22.899 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/127.0.0.1:51928] Created new producer: Producer{topic=PersistentTopic{topic=persistent://public/functions/assignments}, client=/127.0.0.1:51928, producerName=c-standalone-fw-localhost-8080-scheduler-manager, producerId=0}
03:19:22.906 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ProducerImpl - [persistent://public/functions/assignments] [c-standalone-fw-localhost-8080-scheduler-manager] Created producer on cnx [id: 0x87d329bb, L:/127.0.0.1:51928 - R:localhost/127.0.0.1:6650]
03:19:22.910 [main] INFO  org.apache.pulsar.functions.utils.Actions - Sucessfully completed action [ Creating producer for assignment topic persistent://public/functions/assignments ]
03:19:22.952 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ProducerStatsRecorderImpl - Starting Pulsar producer perf with config: {
  "topicName" : "persistent://public/functions/metadata",
  "producerName" : "c-standalone-fw-localhost-8080-function-metadata-manager",
  "sendTimeoutMs" : 30000,
  "blockIfQueueFull" : false,
  "maxPendingMessages" : 1000,
  "maxPendingMessagesAcrossPartitions" : 50000,
  "messageRoutingMode" : "RoundRobinPartition",
  "hashingScheme" : "JavaStringHash",
  "cryptoFailureAction" : "FAIL",
  "batchingMaxPublishDelayMicros" : 1000,
  "batchingPartitionSwitchFrequencyByPublishDelay" : 10,
  "batchingMaxMessages" : 1000,
  "batchingMaxBytes" : 131072,
  "batchingEnabled" : true,
  "chunkingEnabled" : false,
  "compressionType" : "NONE",
  "initialSequenceId" : null,
  "autoUpdatePartitions" : true,
  "multiSchema" : true,
  "properties" : { }
}
03:19:22.954 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ProducerStatsRecorderImpl - Pulsar client config: {
  "serviceUrl" : "pulsar://localhost:6650",
  "authPluginClassName" : null,
  "authParams" : null,
  "authParamMap" : null,
  "operationTimeoutMs" : 30000,
  "statsIntervalSeconds" : 60,
  "numIoThreads" : 1,
  "numListenerThreads" : 1,
  "connectionsPerBroker" : 1,
  "useTcpNoDelay" : true,
  "useTls" : false,
  "tlsTrustCertsFilePath" : "",
  "tlsAllowInsecureConnection" : false,
  "tlsHostnameVerificationEnable" : false,
  "concurrentLookupRequest" : 5000,
  "maxLookupRequest" : 50000,
  "maxLookupRedirects" : 20,
  "maxNumberOfRejectedRequestPerConnection" : 50,
  "keepAliveIntervalSeconds" : 30,
  "connectionTimeoutMs" : 10000,
  "requestTimeoutMs" : 60000,
  "initialBackoffIntervalNanos" : 100000000,
  "maxBackoffIntervalNanos" : 60000000000,
  "listenerName" : null,
  "useKeyStoreTls" : false,
  "sslProvider" : null,
  "tlsTrustStoreType" : "JKS",
  "tlsTrustStorePath" : null,
  "tlsTrustStorePassword" : null,
  "tlsCiphers" : [ ],
  "tlsProtocols" : [ ],
  "proxyServiceUrl" : null,
  "proxyProtocol" : null
}
03:19:22.958 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ProducerImpl - [persistent://public/functions/metadata] [c-standalone-fw-localhost-8080-function-metadata-manager] Creating producer on cnx [id: 0x87d329bb, L:/127.0.0.1:51928 - R:localhost/127.0.0.1:6650]
03:19:22.959 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/127.0.0.1:51928][persistent://public/functions/metadata] Creating producer. producerId=1
03:19:22.961 [Thread-5] INFO  org.apache.pulsar.broker.service.ServerCnx - [/127.0.0.1:51928] persistent://public/functions/metadata configured with schema false
03:19:22.965 [Thread-5] INFO  org.apache.pulsar.broker.service.ServerCnx - [/127.0.0.1:51928] Created new producer: Producer{topic=PersistentTopic{topic=persistent://public/functions/metadata}, client=/127.0.0.1:51928, producerName=c-standalone-fw-localhost-8080-function-metadata-manager, producerId=1}
03:19:22.968 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ProducerImpl - [persistent://public/functions/metadata] [c-standalone-fw-localhost-8080-function-metadata-manager] Created producer on cnx [id: 0x87d329bb, L:/127.0.0.1:51928 - R:localhost/127.0.0.1:6650]
03:19:22.974 [main] INFO  org.apache.pulsar.functions.utils.io.ConnectorUtils - Searching for connectors in /pulsar/./connectors
03:19:22.976 [main] WARN  org.apache.pulsar.functions.utils.io.ConnectorUtils - Connectors archive directory not found
03:19:22.981 [main] INFO  org.apache.pulsar.functions.utils.functions.FunctionUtils - Searching for functions in /pulsar/./functions
03:19:22.982 [main] WARN  org.apache.pulsar.functions.utils.functions.FunctionUtils - Functions archive directory not found
03:19:23.024 [ForkJoinPool.commonPool-worker-0] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:19:22 +0000] "GET /admin/v2/persistent/public/functions/coordinate/subscriptions HTTP/1.1" 200 2 "-" "Pulsar-Java-v2.6.0" 39
03:19:23.034 [pulsar-web-69-4] INFO  org.apache.pulsar.broker.admin.impl.PersistentTopicsBase - [null][persistent://public/functions/coordinate] Creating subscription participants at message id -1:-1:-1
03:19:23.069 [ForkJoinPool.commonPool-worker-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [public/functions/persistent/coordinate] Cursor participants recovered to position 7:-1
03:19:23.074 [ForkJoinPool.commonPool-worker-0] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:19:23.079 [main-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 9
03:19:23.104 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  com.scurrilous.circe.checksum.Crc32cIntChecksum - SSE4.2 CRC32C provider initialized
03:19:23.130 [bookie-io-1-1] INFO  org.apache.bookkeeper.proto.AuthHandler - Authentication success on server side
03:19:23.131 [bookie-io-1-1] INFO  org.apache.bookkeeper.proto.BookieRequestHandler - Channel connected  [id: 0xb9224c0e, L:/127.0.0.1:3181 - R:/127.0.0.1:38214]
03:19:23.136 [bookie-io-1-1] INFO  org.apache.bookkeeper.proto.AuthHandler - Authentication success on server side
03:19:23.135 [bookie-io-1-2] INFO  org.apache.bookkeeper.proto.AuthHandler - Authentication success on server side
03:19:23.136 [bookie-io-1-1] INFO  org.apache.bookkeeper.proto.BookieRequestHandler - Channel connected  [id: 0x11688f07, L:/127.0.0.1:3181 - R:/127.0.0.1:38218]
03:19:23.136 [bookie-io-1-2] INFO  org.apache.bookkeeper.proto.BookieRequestHandler - Channel connected  [id: 0x67465073, L:/127.0.0.1:3181 - R:/127.0.0.1:38216]
03:19:23.139 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: [id: 0xc627921f, L:/127.0.0.1:38214 - R:127.0.0.1/127.0.0.1:3181]
03:19:23.140 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: 127.0.0.1:3181
03:19:23.141 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - connection [id: 0xc627921f, L:/127.0.0.1:38214 - R:127.0.0.1/127.0.0.1:3181] authenticated as BookKeeperPrincipal{ANONYMOUS}
03:19:23.141 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: [id: 0x0d4a90b4, L:/127.0.0.1:38224 - R:127.0.0.1/127.0.0.1:3181]
03:19:23.141 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: 127.0.0.1:3181
03:19:23.142 [bookie-io-1-2] INFO  org.apache.bookkeeper.proto.AuthHandler - Authentication success on server side
03:19:23.142 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: [id: 0x5aaeb6d1, L:/127.0.0.1:38216 - R:127.0.0.1/127.0.0.1:3181]
03:19:23.143 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: 127.0.0.1:3181
03:19:23.143 [bookie-io-1-2] INFO  org.apache.bookkeeper.proto.BookieRequestHandler - Channel connected  [id: 0x8971559a, L:/127.0.0.1:3181 - R:/127.0.0.1:38220]
03:19:23.143 [bookie-io-1-1] INFO  org.apache.bookkeeper.proto.AuthHandler - Authentication success on server side
03:19:23.144 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - connection [id: 0x0d4a90b4, L:/127.0.0.1:38224 - R:127.0.0.1/127.0.0.1:3181] authenticated as BookKeeperPrincipal{ANONYMOUS}
03:19:23.144 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - connection [id: 0x5aaeb6d1, L:/127.0.0.1:38216 - R:127.0.0.1/127.0.0.1:3181] authenticated as BookKeeperPrincipal{ANONYMOUS}
03:19:23.144 [bookie-io-1-1] INFO  org.apache.bookkeeper.proto.BookieRequestHandler - Channel connected  [id: 0x76c93f40, L:/127.0.0.1:3181 - R:/127.0.0.1:38222]
03:19:23.145 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: [id: 0xd1eae6b6, L:/127.0.0.1:38226 - R:127.0.0.1/127.0.0.1:3181]
03:19:23.145 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: 127.0.0.1:3181
03:19:23.145 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - connection [id: 0xd1eae6b6, L:/127.0.0.1:38226 - R:127.0.0.1/127.0.0.1:3181] authenticated as BookKeeperPrincipal{ANONYMOUS}
03:19:23.146 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: [id: 0xf34f38da, L:/127.0.0.1:38228 - R:127.0.0.1/127.0.0.1:3181]
03:19:23.146 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: 127.0.0.1:3181
03:19:23.146 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - connection [id: 0xf34f38da, L:/127.0.0.1:38228 - R:127.0.0.1/127.0.0.1:3181] authenticated as BookKeeperPrincipal{ANONYMOUS}
03:19:23.145 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: [id: 0x907f53f4, L:/127.0.0.1:38218 - R:127.0.0.1/127.0.0.1:3181]
03:19:23.147 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: 127.0.0.1:3181
03:19:23.147 [bookie-io-1-2] INFO  org.apache.bookkeeper.proto.AuthHandler - Authentication success on server side
03:19:23.147 [bookie-io-1-2] INFO  org.apache.bookkeeper.proto.BookieRequestHandler - Channel connected  [id: 0x1177b5ed, L:/127.0.0.1:3181 - R:/127.0.0.1:38224]
03:19:23.147 [bookie-io-1-1] INFO  org.apache.bookkeeper.proto.AuthHandler - Authentication success on server side
03:19:23.147 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - connection [id: 0x907f53f4, L:/127.0.0.1:38218 - R:127.0.0.1/127.0.0.1:3181] authenticated as BookKeeperPrincipal{ANONYMOUS}
03:19:23.147 [bookie-io-1-1] INFO  org.apache.bookkeeper.proto.BookieRequestHandler - Channel connected  [id: 0x38e6dc70, L:/127.0.0.1:3181 - R:/127.0.0.1:38226]
03:19:23.148 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: [id: 0x171d476a, L:/127.0.0.1:38230 - R:127.0.0.1/127.0.0.1:3181]
03:19:23.148 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: 127.0.0.1:3181
03:19:23.148 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - connection [id: 0x171d476a, L:/127.0.0.1:38230 - R:127.0.0.1/127.0.0.1:3181] authenticated as BookKeeperPrincipal{ANONYMOUS}
03:19:23.149 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: [id: 0x965418ef, L:/127.0.0.1:38232 - R:127.0.0.1/127.0.0.1:3181]
03:19:23.149 [bookie-io-1-2] INFO  org.apache.bookkeeper.proto.AuthHandler - Authentication success on server side
03:19:23.149 [bookie-io-1-2] INFO  org.apache.bookkeeper.proto.BookieRequestHandler - Channel connected  [id: 0xc63554fd, L:/127.0.0.1:3181 - R:/127.0.0.1:38228]
03:19:23.149 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: 127.0.0.1:3181
03:19:23.151 [bookie-io-1-1] INFO  org.apache.bookkeeper.proto.AuthHandler - Authentication success on server side
03:19:23.151 [bookie-io-1-1] INFO  org.apache.bookkeeper.proto.BookieRequestHandler - Channel connected  [id: 0xe8bbd524, L:/127.0.0.1:3181 - R:/127.0.0.1:38230]
03:19:23.150 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: [id: 0x69e0b72e, L:/127.0.0.1:38220 - R:127.0.0.1/127.0.0.1:3181]
03:19:23.151 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: 127.0.0.1:3181
03:19:23.152 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - connection [id: 0x69e0b72e, L:/127.0.0.1:38220 - R:127.0.0.1/127.0.0.1:3181] authenticated as BookKeeperPrincipal{ANONYMOUS}
03:19:23.154 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: [id: 0xd6b9d620, L:/127.0.0.1:38222 - R:127.0.0.1/127.0.0.1:3181]
03:19:23.154 [bookie-io-1-1] INFO  org.apache.bookkeeper.proto.AuthHandler - Authentication success on server side
03:19:23.154 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: 127.0.0.1:3181
03:19:23.154 [bookie-io-1-1] INFO  org.apache.bookkeeper.proto.BookieRequestHandler - Channel connected  [id: 0xaa29c3f0, L:/127.0.0.1:3181 - R:/127.0.0.1:38234]
03:19:23.154 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - connection [id: 0xd6b9d620, L:/127.0.0.1:38222 - R:127.0.0.1/127.0.0.1:3181] authenticated as BookKeeperPrincipal{ANONYMOUS}
03:19:23.153 [bookie-io-1-2] INFO  org.apache.bookkeeper.proto.AuthHandler - Authentication success on server side
03:19:23.155 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: [id: 0x6b5f0e9d, L:/127.0.0.1:38238 - R:127.0.0.1/127.0.0.1:3181]
03:19:23.156 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: 127.0.0.1:3181
03:19:23.156 [bookie-io-1-2] INFO  org.apache.bookkeeper.proto.BookieRequestHandler - Channel connected  [id: 0xdfd6e1da, L:/127.0.0.1:3181 - R:/127.0.0.1:38232]
03:19:23.156 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - connection [id: 0x6b5f0e9d, L:/127.0.0.1:38238 - R:127.0.0.1/127.0.0.1:3181] authenticated as BookKeeperPrincipal{ANONYMOUS}
03:19:23.158 [bookie-io-1-1] INFO  org.apache.bookkeeper.proto.AuthHandler - Authentication success on server side
03:19:23.158 [bookie-io-1-2] INFO  org.apache.bookkeeper.proto.AuthHandler - Authentication success on server side
03:19:23.158 [bookie-io-1-1] INFO  org.apache.bookkeeper.proto.BookieRequestHandler - Channel connected  [id: 0x73e4d580, L:/127.0.0.1:3181 - R:/127.0.0.1:38238]
03:19:23.158 [bookie-io-1-2] INFO  org.apache.bookkeeper.proto.BookieRequestHandler - Channel connected  [id: 0x934b4f3a, L:/127.0.0.1:3181 - R:/127.0.0.1:38236]
03:19:23.160 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: [id: 0xde75883f, L:/127.0.0.1:38240 - R:127.0.0.1/127.0.0.1:3181]
03:19:23.160 [bookie-io-1-2] INFO  org.apache.bookkeeper.proto.AuthHandler - Authentication success on server side
03:19:23.160 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: 127.0.0.1:3181
03:19:23.160 [bookie-io-1-2] INFO  org.apache.bookkeeper.proto.BookieRequestHandler - Channel connected  [id: 0x93d8d9a3, L:/127.0.0.1:3181 - R:/127.0.0.1:38240]
03:19:23.160 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - connection [id: 0xde75883f, L:/127.0.0.1:38240 - R:127.0.0.1/127.0.0.1:3181] authenticated as BookKeeperPrincipal{ANONYMOUS}
03:19:23.163 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: [id: 0xae879db2, L:/127.0.0.1:38242 - R:127.0.0.1/127.0.0.1:3181]
03:19:23.164 [bookie-io-1-1] INFO  org.apache.bookkeeper.proto.AuthHandler - Authentication success on server side
03:19:23.163 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: 127.0.0.1:3181
03:19:23.164 [bookie-io-1-1] INFO  org.apache.bookkeeper.proto.BookieRequestHandler - Channel connected  [id: 0x48fc1de4, L:/127.0.0.1:3181 - R:/127.0.0.1:38242]
03:19:23.164 [bookkeeper-io-41-1] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - connection [id: 0xae879db2, L:/127.0.0.1:38242 - R:127.0.0.1/127.0.0.1:3181] authenticated as BookKeeperPrincipal{ANONYMOUS}
03:19:23.166 [bookie-io-1-2] INFO  org.apache.bookkeeper.proto.AuthHandler - Authentication success on server side
03:19:23.166 [bookie-io-1-2] INFO  org.apache.bookkeeper.proto.BookieRequestHandler - Channel connected  [id: 0x39d3dc0b, L:/127.0.0.1:3181 - R:/127.0.0.1:38244]
03:19:23.167 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - connection [id: 0x965418ef, L:/127.0.0.1:38232 - R:127.0.0.1/127.0.0.1:3181] authenticated as BookKeeperPrincipal{ANONYMOUS}
03:19:23.176 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: [id: 0x70988208, L:/127.0.0.1:38234 - R:127.0.0.1/127.0.0.1:3181]
03:19:23.176 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: 127.0.0.1:3181
03:19:23.176 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - connection [id: 0x70988208, L:/127.0.0.1:38234 - R:127.0.0.1/127.0.0.1:3181] authenticated as BookKeeperPrincipal{ANONYMOUS}
03:19:23.177 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: [id: 0x25e6f893, L:/127.0.0.1:38236 - R:127.0.0.1/127.0.0.1:3181]
03:19:23.178 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: 127.0.0.1:3181
03:19:23.178 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - connection [id: 0x25e6f893, L:/127.0.0.1:38236 - R:127.0.0.1/127.0.0.1:3181] authenticated as BookKeeperPrincipal{ANONYMOUS}
03:19:23.180 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: [id: 0x89662954, L:/127.0.0.1:38244 - R:127.0.0.1/127.0.0.1:3181]
03:19:23.180 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - Successfully connected to bookie: 127.0.0.1:3181
03:19:23.180 [bookkeeper-io-41-2] INFO  org.apache.bookkeeper.proto.PerChannelBookieClient - connection [id: 0x89662954, L:/127.0.0.1:38244 - R:127.0.0.1/127.0.0.1:3181] authenticated as BookKeeperPrincipal{ANONYMOUS}
03:19:23.204 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.bookkeeper.mledger.impl.MetaStoreImpl - [public/functions/persistent/coordinate] [participants] Updating cursor info ledgerId=9 mark-delete=7:-1
03:19:23.207 [bookkeeper-ml-workers-OrderedExecutor-2-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [public/functions/persistent/coordinate] Updated cursor participants with ledger id 9 md-position=7:-1 rd-position=7:0
03:19:23.207 [bookkeeper-ml-workers-OrderedExecutor-2-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedLedgerImpl - [public/functions/persistent/coordinate] Opened new cursor: ManagedCursorImpl{ledger=public/functions/persistent/coordinate, name=participants, ackPos=7:-1, readPos=7:0}
03:19:23.217 [ForkJoinPool.commonPool-worker-0] INFO  org.apache.pulsar.broker.service.persistent.PersistentSubscription - [persistent://public/functions/coordinate][participants] Successfully disconnected consumers from subscription, proceeding with cursor reset
03:19:23.220 [bookkeeper-ml-workers-OrderedExecutor-2-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [public/functions/persistent/coordinate] Initiate reset position to 7:-1 on cursor participants
03:19:23.245 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [public/functions/persistent/coordinate] reset position to 7:-1 before current read position 7:0 on cursor participants
03:19:23.246 [ForkJoinPool.commonPool-worker-0] INFO  org.apache.pulsar.broker.admin.impl.PersistentTopicsBase - [null][persistent://public/functions/coordinate] Successfully created subscription participants at message id -1:-1:-1
03:19:23.250 [ForkJoinPool.commonPool-worker-0] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:19:23 +0000] "PUT /admin/v2/persistent/public/functions/coordinate/subscription/participants HTTP/1.1" 204 0 "-" "Pulsar-Java-v2.6.0" 220
03:19:23.320 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ConsumerStatsRecorderImpl - Starting Pulsar consumer status recorder with config: {
  "topicNames" : [ "persistent://public/functions/coordinate" ],
  "topicsPattern" : null,
  "subscriptionName" : "participants",
  "subscriptionType" : "Failover",
  "subscriptionMode" : "Durable",
  "receiverQueueSize" : 1000,
  "acknowledgementsGroupTimeMicros" : 100000,
  "negativeAckRedeliveryDelayMicros" : 60000000,
  "maxTotalReceiverQueueSizeAcrossPartitions" : 50000,
  "consumerName" : null,
  "ackTimeoutMillis" : 0,
  "tickDurationMillis" : 1000,
  "priorityLevel" : 0,
  "maxPendingChuckedMessage" : 10,
  "autoAckOldestChunkedMessageOnQueueFull" : false,
  "expireTimeOfIncompleteChunkedMessageMillis" : 60000,
  "cryptoFailureAction" : "FAIL",
  "properties" : {
    "id" : "c-standalone-fw-localhost-8080:localhost:8080"
  },
  "readCompacted" : false,
  "subscriptionInitialPosition" : "Latest",
  "patternAutoDiscoveryPeriod" : 60,
  "regexSubscriptionMode" : "PersistentOnly",
  "deadLetterPolicy" : null,
  "retryEnable" : false,
  "autoUpdatePartitions" : true,
  "replicateSubscriptionState" : false,
  "resetIncludeHead" : false,
  "keySharedPolicy" : null
}
03:19:23.323 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ConsumerStatsRecorderImpl - Pulsar client config: {
  "serviceUrl" : "pulsar://localhost:6650",
  "authPluginClassName" : null,
  "authParams" : null,
  "authParamMap" : null,
  "operationTimeoutMs" : 30000,
  "statsIntervalSeconds" : 60,
  "numIoThreads" : 1,
  "numListenerThreads" : 1,
  "connectionsPerBroker" : 1,
  "useTcpNoDelay" : true,
  "useTls" : false,
  "tlsTrustCertsFilePath" : "",
  "tlsAllowInsecureConnection" : false,
  "tlsHostnameVerificationEnable" : false,
  "concurrentLookupRequest" : 5000,
  "maxLookupRequest" : 50000,
  "maxLookupRedirects" : 20,
  "maxNumberOfRejectedRequestPerConnection" : 50,
  "keepAliveIntervalSeconds" : 30,
  "connectionTimeoutMs" : 10000,
  "requestTimeoutMs" : 60000,
  "initialBackoffIntervalNanos" : 100000000,
  "maxBackoffIntervalNanos" : 60000000000,
  "listenerName" : null,
  "useKeyStoreTls" : false,
  "sslProvider" : null,
  "tlsTrustStoreType" : "JKS",
  "tlsTrustStorePath" : null,
  "tlsTrustStorePassword" : null,
  "tlsCiphers" : [ ],
  "tlsProtocols" : [ ],
  "proxyServiceUrl" : null,
  "proxyProtocol" : null
}
03:19:23.334 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ConsumerImpl - [persistent://public/functions/coordinate][participants] Subscribing to topic on cnx [id: 0x87d329bb, L:/127.0.0.1:51928 - R:localhost/127.0.0.1:6650]
03:19:23.347 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/127.0.0.1:51928] Subscribing on topic persistent://public/functions/coordinate / participants
03:19:23.376 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://public/functions/coordinate] There are no replicated subscriptions on the topic
03:19:23.376 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://public/functions/coordinate][participants] Created new subscription for 0
03:19:23.378 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/127.0.0.1:51928] Created subscription on topic persistent://public/functions/coordinate / participants
03:19:23.382 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ConsumerImpl - [persistent://public/functions/coordinate][participants] Subscribed to topic on localhost/127.0.0.1:6650 -- consumer: 0
03:19:23.433 [pulsar-web-69-8] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:19:23 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 45
03:19:23.452 [main] INFO  org.apache.pulsar.functions.worker.FunctionRuntimeManager - Initializing secrets provider configurator org.apache.pulsar.functions.secretsproviderconfigurator.DefaultSecretsProviderConfigurator with configs: null
03:19:23.470 [main] INFO  org.apache.pulsar.functions.runtime.process.ProcessRuntimeFactory - Java instance jar location is not defined, using the location defined in system environment : /pulsar/instances/java-instance.jar
03:19:23.470 [main] INFO  org.apache.pulsar.functions.runtime.process.ProcessRuntimeFactory - Python instance file location is not defined using the location defined in system environment : /pulsar/instances/python-instance/python_instance_main.py
03:19:23.470 [main] INFO  org.apache.pulsar.functions.runtime.process.ProcessRuntimeFactory - Extra dependencies location is not defined using the location defined in system environment : /pulsar/instances/deps
03:19:23.476 [main] INFO  org.apache.pulsar.functions.worker.FunctionMetaDataManager - /** Initializing Function Metadata Manager **/
03:19:23.490 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ConsumerStatsRecorderImpl - Starting Pulsar consumer status recorder with config: {
  "topicNames" : [ "persistent://public/functions/metadata" ],
  "topicsPattern" : null,
  "subscriptionName" : "reader-9c9737c2e9",
  "subscriptionType" : "Exclusive",
  "subscriptionMode" : "NonDurable",
  "receiverQueueSize" : 1000,
  "acknowledgementsGroupTimeMicros" : 100000,
  "negativeAckRedeliveryDelayMicros" : 60000000,
  "maxTotalReceiverQueueSizeAcrossPartitions" : 50000,
  "consumerName" : "c-standalone-fw-localhost-8080-function-metadata-manager",
  "ackTimeoutMillis" : 0,
  "tickDurationMillis" : 1000,
  "priorityLevel" : 0,
  "maxPendingChuckedMessage" : 10,
  "autoAckOldestChunkedMessageOnQueueFull" : false,
  "expireTimeOfIncompleteChunkedMessageMillis" : 60000,
  "cryptoFailureAction" : "FAIL",
  "properties" : { },
  "readCompacted" : false,
  "subscriptionInitialPosition" : "Latest",
  "patternAutoDiscoveryPeriod" : 60,
  "regexSubscriptionMode" : "PersistentOnly",
  "deadLetterPolicy" : null,
  "retryEnable" : false,
  "autoUpdatePartitions" : true,
  "replicateSubscriptionState" : false,
  "resetIncludeHead" : false,
  "keySharedPolicy" : null
}
03:19:23.493 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ConsumerStatsRecorderImpl - Pulsar client config: {
  "serviceUrl" : "pulsar://localhost:6650",
  "authPluginClassName" : null,
  "authParams" : null,
  "authParamMap" : null,
  "operationTimeoutMs" : 30000,
  "statsIntervalSeconds" : 60,
  "numIoThreads" : 1,
  "numListenerThreads" : 1,
  "connectionsPerBroker" : 1,
  "useTcpNoDelay" : true,
  "useTls" : false,
  "tlsTrustCertsFilePath" : "",
  "tlsAllowInsecureConnection" : false,
  "tlsHostnameVerificationEnable" : false,
  "concurrentLookupRequest" : 5000,
  "maxLookupRequest" : 50000,
  "maxLookupRedirects" : 20,
  "maxNumberOfRejectedRequestPerConnection" : 50,
  "keepAliveIntervalSeconds" : 30,
  "connectionTimeoutMs" : 10000,
  "requestTimeoutMs" : 60000,
  "initialBackoffIntervalNanos" : 100000000,
  "maxBackoffIntervalNanos" : 60000000000,
  "listenerName" : null,
  "useKeyStoreTls" : false,
  "sslProvider" : null,
  "tlsTrustStoreType" : "JKS",
  "tlsTrustStorePath" : null,
  "tlsTrustStorePassword" : null,
  "tlsCiphers" : [ ],
  "tlsProtocols" : [ ],
  "proxyServiceUrl" : null,
  "proxyProtocol" : null
}
03:19:23.497 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ConsumerImpl - [persistent://public/functions/metadata][reader-9c9737c2e9] Subscribing to topic on cnx [id: 0x87d329bb, L:/127.0.0.1:51928 - R:localhost/127.0.0.1:6650]
03:19:23.500 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/127.0.0.1:51928] Subscribing on topic persistent://public/functions/metadata / reader-9c9737c2e9
03:19:23.501 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://public/functions/metadata][reader-9c9737c2e9] Creating non-durable subscription at msg id -1:-1:-1:-1
03:19:23.504 [pulsar-io-51-1] INFO  org.apache.bookkeeper.mledger.impl.NonDurableCursorImpl - [public/functions/persistent/metadata] Created non-durable cursor read-position=8:0 mark-delete-position=8:-1
03:19:23.504 [pulsar-io-51-1] INFO  org.apache.bookkeeper.mledger.impl.ManagedLedgerImpl - [public/functions/persistent/metadata] Opened new cursor: NonDurableCursorImpl{ledger=public/functions/persistent/metadata, ackPos=8:-1, readPos=8:0}
03:19:23.506 [pulsar-io-51-1] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [public/functions/persistent/metadata-reader-9c9737c2e9] Rewind from 8:0 to 8:0
03:19:23.507 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://public/functions/metadata] There are no replicated subscriptions on the topic
03:19:23.507 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://public/functions/metadata][reader-9c9737c2e9] Created new subscription for 1
03:19:23.507 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/127.0.0.1:51928] Created subscription on topic persistent://public/functions/metadata / reader-9c9737c2e9
03:19:23.508 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ConsumerImpl - [persistent://public/functions/metadata][reader-9c9737c2e9] Subscribed to topic on localhost/127.0.0.1:6650 -- consumer: 1
03:19:23.514 [main] INFO  org.apache.pulsar.client.impl.ConsumerImpl - [persistent://public/functions/metadata][reader-9c9737c2e9] Get topic last message Id
03:19:23.518 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ConsumerImpl - [persistent://public/functions/metadata][reader-9c9737c2e9] Successfully getLastMessageId 8:-1
03:19:23.519 [pulsar-io-51-1] ERROR org.apache.bookkeeper.client.LedgerHandle - IncorrectParameterException on ledgerId:8 firstEntry:-1 lastEntry:-1
03:19:23.522 [main] INFO  org.apache.pulsar.functions.worker.FunctionRuntimeManager - /** Initializing Runtime Manager **/
03:19:23.529 [pulsar-web-69-3] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:19:23 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 6
03:19:23.555 [pulsar-client-io-82-1] WARN  org.apache.pulsar.client.impl.ClientCnx - [id: 0x87d329bb, L:/127.0.0.1:51928 - R:localhost/127.0.0.1:6650] Received error from server: Failed to get batch size for entry org.apache.bookkeeper.mledger.ManagedLedgerException: Incorrect parameter input
03:19:23.556 [pulsar-client-io-82-1] WARN  org.apache.pulsar.client.impl.ClientCnx - [id: 0x87d329bb, L:/127.0.0.1:51928 - R:localhost/127.0.0.1:6650] Received unknown request id from server: 12
03:19:23.564 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ConsumerStatsRecorderImpl - Starting Pulsar consumer status recorder with config: {
  "topicNames" : [ "persistent://public/functions/assignments" ],
  "topicsPattern" : null,
  "subscriptionName" : "c-standalone-fw-localhost-8080-function-runtime-manager-reader-f34fa8ec84",
  "subscriptionType" : "Exclusive",
  "subscriptionMode" : "NonDurable",
  "receiverQueueSize" : 1000,
  "acknowledgementsGroupTimeMicros" : 100000,
  "negativeAckRedeliveryDelayMicros" : 60000000,
  "maxTotalReceiverQueueSizeAcrossPartitions" : 50000,
  "consumerName" : "c-standalone-fw-localhost-8080-function-runtime-manager",
  "ackTimeoutMillis" : 0,
  "tickDurationMillis" : 1000,
  "priorityLevel" : 0,
  "maxPendingChuckedMessage" : 10,
  "autoAckOldestChunkedMessageOnQueueFull" : false,
  "expireTimeOfIncompleteChunkedMessageMillis" : 60000,
  "cryptoFailureAction" : "FAIL",
  "properties" : { },
  "readCompacted" : true,
  "subscriptionInitialPosition" : "Latest",
  "patternAutoDiscoveryPeriod" : 60,
  "regexSubscriptionMode" : "PersistentOnly",
  "deadLetterPolicy" : null,
  "retryEnable" : false,
  "autoUpdatePartitions" : true,
  "replicateSubscriptionState" : false,
  "resetIncludeHead" : false,
  "keySharedPolicy" : null
}
03:19:23.567 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ConsumerStatsRecorderImpl - Pulsar client config: {
  "serviceUrl" : "pulsar://localhost:6650",
  "authPluginClassName" : null,
  "authParams" : null,
  "authParamMap" : null,
  "operationTimeoutMs" : 30000,
  "statsIntervalSeconds" : 60,
  "numIoThreads" : 1,
  "numListenerThreads" : 1,
  "connectionsPerBroker" : 1,
  "useTcpNoDelay" : true,
  "useTls" : false,
  "tlsTrustCertsFilePath" : "",
  "tlsAllowInsecureConnection" : false,
  "tlsHostnameVerificationEnable" : false,
  "concurrentLookupRequest" : 5000,
  "maxLookupRequest" : 50000,
  "maxLookupRedirects" : 20,
  "maxNumberOfRejectedRequestPerConnection" : 50,
  "keepAliveIntervalSeconds" : 30,
  "connectionTimeoutMs" : 10000,
  "requestTimeoutMs" : 60000,
  "initialBackoffIntervalNanos" : 100000000,
  "maxBackoffIntervalNanos" : 60000000000,
  "listenerName" : null,
  "useKeyStoreTls" : false,
  "sslProvider" : null,
  "tlsTrustStoreType" : "JKS",
  "tlsTrustStorePath" : null,
  "tlsTrustStorePassword" : null,
  "tlsCiphers" : [ ],
  "tlsProtocols" : [ ],
  "proxyServiceUrl" : null,
  "proxyProtocol" : null
}
03:19:23.570 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ConsumerImpl - [persistent://public/functions/assignments][c-standalone-fw-localhost-8080-function-runtime-manager-reader-f34fa8ec84] Subscribing to topic on cnx [id: 0x87d329bb, L:/127.0.0.1:51928 - R:localhost/127.0.0.1:6650]
03:19:23.571 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/127.0.0.1:51928] Subscribing on topic persistent://public/functions/assignments / c-standalone-fw-localhost-8080-function-runtime-manager-reader-f34fa8ec84
03:19:23.572 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://public/functions/assignments][c-standalone-fw-localhost-8080-function-runtime-manager-reader-f34fa8ec84] Creating non-durable subscription at msg id -1:-1:-1:-1
03:19:23.572 [pulsar-io-51-1] INFO  org.apache.bookkeeper.mledger.impl.NonDurableCursorImpl - [public/functions/persistent/assignments] Created non-durable cursor read-position=6:0 mark-delete-position=6:-1
03:19:23.573 [pulsar-io-51-1] INFO  org.apache.bookkeeper.mledger.impl.ManagedLedgerImpl - [public/functions/persistent/assignments] Opened new cursor: NonDurableCursorImpl{ledger=public/functions/persistent/assignments, ackPos=6:-1, readPos=6:0}
03:19:23.573 [pulsar-io-51-1] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [public/functions/persistent/assignments-c-standalone-fw-localhost-8080-function-runtime-manager-reader-f34fa8ec84] Rewind from 6:0 to 6:0
03:19:23.575 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://public/functions/assignments] There are no replicated subscriptions on the topic
03:19:23.575 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://public/functions/assignments][c-standalone-fw-localhost-8080-function-runtime-manager-reader-f34fa8ec84] Created new subscription for 2
03:19:23.575 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/127.0.0.1:51928] Created subscription on topic persistent://public/functions/assignments / c-standalone-fw-localhost-8080-function-runtime-manager-reader-f34fa8ec84
03:19:23.576 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ConsumerImpl - [persistent://public/functions/assignments][c-standalone-fw-localhost-8080-function-runtime-manager-reader-f34fa8ec84] Subscribed to topic on localhost/127.0.0.1:6650 -- consumer: 2
03:19:23.578 [main] INFO  org.apache.pulsar.client.impl.ConsumerImpl - [persistent://public/functions/assignments][c-standalone-fw-localhost-8080-function-runtime-manager-reader-f34fa8ec84] Get topic last message Id
03:19:23.579 [pulsar-io-51-1] ERROR org.apache.bookkeeper.client.LedgerHandle - IncorrectParameterException on ledgerId:6 firstEntry:-1 lastEntry:-1
03:19:23.580 [pulsar-client-io-82-1] INFO  org.apache.pulsar.client.impl.ConsumerImpl - [persistent://public/functions/assignments][c-standalone-fw-localhost-8080-function-runtime-manager-reader-f34fa8ec84] Successfully getLastMessageId 6:-1
03:19:23.580 [main] INFO  org.apache.pulsar.functions.worker.WorkerService - Start cluster services...
03:19:23.582 [pulsar-client-io-82-1] WARN  org.apache.pulsar.client.impl.ClientCnx - [id: 0x87d329bb, L:/127.0.0.1:51928 - R:localhost/127.0.0.1:6650] Received error from server: Failed to get batch size for entry org.apache.bookkeeper.mledger.ManagedLedgerException: Incorrect parameter input
03:19:23.582 [pulsar-client-io-82-1] WARN  org.apache.pulsar.client.impl.ClientCnx - [id: 0x87d329bb, L:/127.0.0.1:51928 - R:localhost/127.0.0.1:6650] Received unknown request id from server: 16
03:19:23.586 [main] INFO  org.apache.pulsar.functions.worker.FunctionRuntimeManager - /** Starting Function Runtime Manager **/
03:19:23.588 [main] INFO  org.apache.pulsar.broker.PulsarService - Function worker service started
03:19:23.588 [main] INFO  org.apache.pulsar.broker.PulsarService - messaging service is ready
03:19:23.609 [main] INFO  org.apache.pulsar.broker.PulsarService - messaging service is ready, bootstrap service port = 8080, broker url= pulsar://localhost:6650, cluster=standalone, configs=org.apache.pulsar.broker.ServiceConfiguration@29911ee3[zookeeperServers=127.0.0.1:2181,globalZookeeperServers=<null>,configurationStoreServers=127.0.0.1:2181,brokerServicePort=Optional[6650],brokerServicePortTls=Optional.empty,webServicePort=Optional[8080],webServicePortTls=Optional.empty,bindAddress=0.0.0.0,advertisedAddress=localhost,advertisedListeners=<null>,internalListenerName=<null>,numIOThreads=2,numHttpServerThreads=8,delayedDeliveryEnabled=true,delayedDeliveryTrackerFactoryClassName=org.apache.pulsar.broker.delayed.InMemoryDelayedDeliveryTrackerFactory,delayedDeliveryTickTimeMillis=1000,acknowledgmentAtBatchIndexLevelEnabled=false,webSocketServiceEnabled=true,isRunningStandalone=true,clusterName=standalone,failureDomainsEnabled=false,zooKeeperSessionTimeoutMillis=30000,zooKeeperOperationTimeoutSeconds=30,zooKeeperCacheExpirySeconds=300,brokerShutdownTimeoutMs=60000,skipBrokerShutdownOnOOM=false,topicLoadTimeoutSeconds=60,backlogQuotaCheckEnabled=true,backlogQuotaCheckIntervalInSeconds=60,backlogQuotaDefaultLimitGB=10,backlogQuotaDefaultRetentionPolicy=producer_request_hold,ttlDurationDefaultInSeconds=0,brokerDeleteInactiveTopicsEnabled=true,brokerDeleteInactiveTopicsFrequencySeconds=60,brokerDeleteInactiveTopicsMode=delete_when_no_subscriptions,brokerDeleteInactiveTopicsMaxInactiveDurationSeconds=<null>,maxPendingPublishRequestsPerConnection=1000,messageExpiryCheckIntervalInMinutes=5,activeConsumerFailoverDelayTimeMillis=1000,subscriptionExpirationTimeMinutes=0,subscriptionRedeliveryTrackerEnabled=true,subscriptionExpiryCheckIntervalInMinutes=5,subscriptionKeySharedEnable=true,subscriptionKeySharedUseConsistentHashing=false,subscriptionKeySharedConsistentHashingReplicaPoints=100,brokerDeduplicationEnabled=false,brokerDeduplicationMaxNumberOfProducers=10000,brokerDeduplicationEntriesInterval=1000,brokerDeduplicationProducerInactivityTimeoutMinutes=360,defaultNumberOfNamespaceBundles=4,clientLibraryVersionCheckEnabled=false,statusFilePath=/usr/local/apache/htdocs,maxUnackedMessagesPerConsumer=50000,maxUnackedMessagesPerSubscription=200000,maxUnackedMessagesPerBroker=0,maxUnackedMessagesPerSubscriptionOnBrokerBlocked=0.16,topicPublisherThrottlingTickTimeMillis=2,preciseTopicPublishRateLimiterEnable=false,brokerPublisherThrottlingTickTimeMillis=50,brokerPublisherThrottlingMaxMessageRate=0,brokerPublisherThrottlingMaxByteRate=0,subscribeThrottlingRatePerConsumer=0,subscribeRatePeriodPerConsumerInSecond=30,dispatchThrottlingRatePerTopicInMsg=0,dispatchThrottlingRatePerTopicInByte=0,dispatchThrottlingRatePerSubscriptionInMsg=0,dispatchThrottlingRatePerSubscriptionInByte=0,dispatchThrottlingRatePerReplicatorInMsg=0,dispatchThrottlingRatePerReplicatorInByte=0,dispatchThrottlingRateRelativeToPublishRate=false,dispatchThrottlingOnNonBacklogConsumerEnabled=true,dispatcherMaxReadBatchSize=100,dispatcherMaxReadSizeBytes=5242880,dispatcherMinReadBatchSize=1,dispatcherMaxRoundRobinBatchSize=20,preciseDispatcherFlowControl=false,maxConcurrentLookupRequest=50000,maxConcurrentTopicLoadRequest=5000,maxConcurrentNonPersistentMessagePerConnection=1000,numWorkerThreadsForNonPersistentTopic=8,enablePersistentTopics=true,enableNonPersistentTopics=true,enableRunBookieTogether=false,enableRunBookieAutoRecoveryTogether=false,maxProducersPerTopic=0,maxConsumersPerTopic=0,maxConsumersPerSubscription=0,maxMessageSize=5242880,enableReplicatedSubscriptions=true,replicatedSubscriptionsSnapshotFrequencyMillis=1000,replicatedSubscriptionsSnapshotTimeoutSeconds=30,replicatedSubscriptionsSnapshotMaxCachedPerSubscription=10,maxMessagePublishBufferSizeInMB=2048,messagePublishBufferCheckIntervalInMillis=100,retentionCheckIntervalInSeconds=120,maxNumPartitionsPerPartitionedTopic=0,brokerInterceptorsDirectory=./interceptors,brokerInterceptors=[],zookeeperSessionExpiredPolicy=shutdown,protocolHandlerDirectory=./protocols,messagingProtocols=[],systemTopicEnabled=false,topicLevelPoliciesEnabled=false,tlsEnabled=false,tlsCertRefreshCheckDurationSec=300,tlsCertificateFilePath=<null>,tlsKeyFilePath=<null>,tlsTrustCertsFilePath=,tlsAllowInsecureConnection=false,tlsProtocols=[],tlsCiphers=[],tlsRequireTrustedClientCertOnConnect=false,authenticationEnabled=false,authenticationProviders=[],authenticationRefreshCheckSeconds=60,authorizationEnabled=false,authorizationProvider=org.apache.pulsar.broker.authorization.PulsarAuthorizationProvider,superUserRoles=[],proxyRoles=[],authenticateOriginalAuthData=false,authorizationAllowWildcardsMatching=false,brokerClientAuthenticationPlugin=org.apache.pulsar.client.impl.auth.AuthenticationDisabled,brokerClientAuthenticationParameters=,brokerClientTrustCertsFilePath=,anonymousUserRole=<null>,httpMaxRequestSize=-1,saslJaasClientAllowedIds=.*pulsar.*,saslJaasServerSectionName=PulsarBroker,kinitCommand=/usr/bin/kinit,bookkeeperMetadataServiceUri=<null>,bookkeeperClientAuthenticationPlugin=<null>,bookkeeperClientAuthenticationParametersName=<null>,bookkeeperClientAuthenticationParameters=<null>,bookkeeperClientTimeoutInSeconds=30,bookkeeperClientSpeculativeReadTimeoutInMillis=0,bookkeeperUseV2WireProtocol=true,bookkeeperClientHealthCheckEnabled=true,bookkeeperClientHealthCheckIntervalSeconds=60,bookkeeperClientHealthCheckErrorThresholdPerInterval=5,bookkeeperClientHealthCheckQuarantineTimeInSeconds=1800,bookkeeperClientRackawarePolicyEnabled=true,bookkeeperClientRegionawarePolicyEnabled=false,bookkeeperClientReorderReadSequenceEnabled=false,bookkeeperClientIsolationGroups=<null>,bookkeeperClientSecondaryIsolationGroups=<null>,bookkeeperClientGetBookieInfoIntervalSeconds=86400,bookkeeperClientGetBookieInfoRetryIntervalSeconds=60,bookkeeperEnableStickyReads=false,bookkeeperTLSProviderFactoryClass=org.apache.bookkeeper.tls.TLSContextFactory,bookkeeperTLSClientAuthentication=false,bookkeeperTLSKeyFileType=PEM,bookkeeperTLSTrustCertTypes=PEM,bookkeeperTLSKeyStorePasswordPath=<null>,bookkeeperTLSTrustStorePasswordPath=<null>,bookkeeperTLSKeyFilePath=<null>,bookkeeperTLSCertificateFilePath=<null>,bookkeeperTLSTrustCertsFilePath=<null>,bookkeeperDiskWeightBasedPlacementEnabled=false,bookkeeperExplicitLacIntervalInMills=0,bookkeeperClientExposeStatsToPrometheus=false,managedLedgerDefaultEnsembleSize=1,managedLedgerDefaultWriteQuorum=1,managedLedgerDefaultAckQuorum=1,managedLedgerDigestType=CRC32C,managedLedgerPassword=,managedLedgerMaxEnsembleSize=5,managedLedgerMaxWriteQuorum=5,managedLedgerMaxAckQuorum=5,managedLedgerCacheSizeMB=819,managedLedgerCacheCopyEntries=false,managedLedgerCacheEvictionWatermark=0.9,managedLedgerCacheEvictionFrequency=100.0,managedLedgerCacheEvictionTimeThresholdMillis=1000,managedLedgerCursorBackloggedThreshold=1000,managedLedgerDefaultMarkDeleteRateLimit=0.1,allowAutoTopicCreation=true,allowAutoTopicCreationType=non-partitioned,allowAutoSubscriptionCreation=true,defaultNumPartitions=1,managedLedgerNumWorkerThreads=4,managedLedgerNumSchedulerThreads=4,managedLedgerMaxEntriesPerLedger=50000,managedLedgerMinLedgerRolloverTimeMinutes=10,managedLedgerMaxLedgerRolloverTimeMinutes=240,managedLedgerMaxSizePerLedgerMbytes=2048,managedLedgerOffloadDeletionLagMs=14400000,managedLedgerOffloadAutoTriggerSizeThresholdBytes=-1,managedLedgerCursorMaxEntriesPerLedger=50000,managedLedgerCursorRolloverTimeInSeconds=14400,managedLedgerMaxUnackedRangesToPersist=10000,managedLedgerMaxUnackedRangesToPersistInZooKeeper=1000,managedLedgerUnackedRangesOpenCacheSetEnabled=true,autoSkipNonRecoverableData=false,managedLedgerMetadataOperationsTimeoutSeconds=60,managedLedgerReadEntryTimeoutSeconds=0,managedLedgerAddEntryTimeoutSeconds=0,managedLedgerPrometheusStatsLatencyRolloverSeconds=60,managedLedgerTraceTaskExecution=true,managedLedgerNewEntriesCheckDelayInMillis=10,loadBalancerEnabled=false,loadBalancerPlacementStrategy=leastLoadedServer,loadBalancerLoadSheddingStrategy=org.apache.pulsar.broker.loadbalance.impl.OverloadShedder,loadBalancerReportUpdateThresholdPercentage=10,loadBalancerReportUpdateMaxIntervalMinutes=15,loadBalancerHostUsageCheckIntervalMinutes=1,loadBalancerSheddingEnabled=true,loadBalancerSheddingIntervalMinutes=1,loadBalancerSheddingGracePeriodMinutes=30,loadBalancerBrokerUnderloadedThresholdPercentage=50,loadBalancerBrokerMaxTopics=50000,loadBalancerBrokerOverloadedThresholdPercentage=85,loadBalancerBrokerThresholdShedderPercentage=10,loadBalancerHistoryResourcePercentage=0.9,loadBalancerBandwithInResourceWeight=1.0,loadBalancerBandwithOutResourceWeight=1.0,loadBalancerCPUResourceWeight=1.0,loadBalancerMemoryResourceWeight=1.0,loadBalancerDirectMemoryResourceWeight=1.0,loadBalancerBundleUnloadMinThroughputThreshold=10.0,loadBalancerResourceQuotaUpdateIntervalMinutes=15,loadBalancerBrokerComfortLoadLevelPercentage=65,loadBalancerAutoBundleSplitEnabled=true,loadBalancerAutoUnloadSplitBundlesEnabled=true,loadBalancerNamespaceBundleMaxTopics=1000,loadBalancerNamespaceBundleMaxSessions=1000,loadBalancerNamespaceBundleMaxMsgRate=30000,loadBalancerNamespaceBundleMaxBandwidthMbytes=100,loadBalancerNamespaceMaximumBundles=128,loadManagerClassName=org.apache.pulsar.broker.loadbalance.NoopLoadManager,supportedNamespaceBundleSplitAlgorithms=[range_equally_divide, topic_count_equally_divide],defaultNamespaceBundleSplitAlgorithm=range_equally_divide,loadBalancerOverrideBrokerNicSpeedGbps=<null>,replicationMetricsEnabled=true,replicationConnectionsPerBroker=16,replicatorPrefix=pulsar.repl,replicationProducerQueueSize=1000,replicationPolicyCheckDurationSeconds=600,replicationTlsEnabled=false,brokerClientTlsEnabled=false,defaultRetentionTimeInMinutes=0,defaultRetentionSizeInMB=0,keepAliveIntervalSeconds=30,brokerServicePurgeInactiveFrequencyInSeconds=60,bootstrapNamespaces=[],properties={loadBalancerNamespaceMaximumBundles=128, managedLedgerDigestType=CRC32C, bookkeeperTLSKeyFileType=PEM, tlsTrustCertsFilePath=, dbStorage_readAheadCacheMaxSizeMb=, dispatchThrottlingRatePerTopicInByte=0, bookkeeperClientReorderReadSequenceEnabled=false, bookkeeperTLSKeyFilePath=, allowAutoTopicCreation=true, enablePersistentTopics=true, brokerShutdownTimeoutMs=60000, preciseDispatcherFlowControl=false, webSocketNumIoThreads=8, maxConsumersPerTopic=0, managedLedgerNumSchedulerThreads=4, skipBrokerShutdownOnOOM=false, topicLevelPoliciesEnabled=false, exposePreciseBacklogInPrometheus=false, brokerPublisherThrottlingMaxMessageRate=0, replicatioPolicyCheckDurationSeconds=600, dbStorage_rocksDB_numLevels=-1, exposePublisherStats=true, managedLedgerAddEntryTimeoutSeconds=0, loadBalancerResourceQuotaUpdateIntervalMinutes=15, bookkeeperClientRackawarePolicyEnabled=true, zooKeeperSessionTimeoutMillis=30000, backlogQuotaCheckIntervalInSeconds=60, tlsProtocols=, brokerClientTlsTrustStore=, dispatchThrottlingOnNonBacklogConsumerEnabled=true, bookkeeperTLSKeyStorePasswordPath=, managedLedgerMinLedgerRolloverTimeMinutes=10, enableNonPersistentTopics=true, bookkeeperClientSpeculativeReadTimeoutInMillis=0, dispatchThrottlingRateRelativeToPublishRate=false, tokenAudience=, brokerDeduplicationProducerInactivityTimeoutMinutes=360, loadBalancerSheddingIntervalMinutes=1, managedLedgerNewEntriesCheckDelayInMillis=10, webSocketMaxTextFrameSize=1048576, allowAutoSubscriptionCreation=true, dbStorage_rocksDB_blockCacheSize=, authenticationProviders=, bookkeeperTLSProviderFactoryClass=org.apache.bookkeeper.tls.TLSContextFactory, subscriptionKeySharedConsistentHashingReplicaPoints=100, brokerClientSslProvider=, managedLedgerMetadataOperationsTimeoutSeconds=60, managedLedgerDefaultAckQuorum=1, managedLedgerCacheEvictionFrequency=100.0, defaultNumPartitions=1, allowAutoTopicCreationType=non-partitioned, authenticateOriginalAuthData=false, loadBalancerNamespaceBundleMaxTopics=1000, managedLedgerCacheEvictionWatermark=0.9, bookkeeperClientAuthenticationPlugin=, managedLedgerMaxLedgerRolloverTimeMinutes=240, managedLedgerMaxEntriesPerLedger=50000, tlsAllowInsecureConnection=false, brokerDeduplicationMaxNumberOfProducers=10000, configurationStoreServers=, bookkeeperClientHealthCheckEnabled=true, defaultRetentionTimeInMinutes=0, managedLedgerReadEntryTimeoutSeconds=0, loadBalancerMemoryResourceWeight=1.0, activeConsumerFailoverDelayTimeMillis=1000, managedLedgerCacheEvictionTimeThresholdMillis=1000, webSocketSessionIdleTimeoutMillis=300000, tlsCertRefreshCheckDurationSec=300, brokerDeleteInactiveTopicsFrequencySeconds=60, keepAliveIntervalSeconds=30, tlsKeyStore=, advertisedAddress=, managedLedgerCacheCopyEntries=false, athenzDomainNames=, ledgerStorageClass=org.apache.bookkeeper.bookie.storage.ldb.DbLedgerStorage, replicationMetricsEnabled=true, tlsProvider=, diskUsageWarnThreshold=0.99, loadBalancerReportUpdateThresholdPercentage=10, loadBalancerCPUResourceWeight=1.0, tlsEnabledWithKeyStore=false, failureDomainsEnabled=false, loadBalancerBundleUnloadMinThroughputThreshold=10, tokenAudienceClaim=, tlsTrustStorePassword=, managedLedgerCursorBackloggedThreshold=1000, loadBalancerReportUpdateMaxIntervalMinutes=15, managedLedgerPrometheusStatsLatencyRolloverSeconds=60, loadBalancerNamespaceBundleMaxBandwidthMbytes=100, bookkeeperClientHealthCheckIntervalSeconds=60, managedLedgerCursorRolloverTimeInSeconds=14400, bookkeeperExplicitLacIntervalInMills=0, tlsKeyStorePassword=, loadBalancerEnabled=false, loadBalancerHistoryResourcePercentage=0.9, bookkeeperClientHealthCheckQuarantineTimeInSeconds=1800, diskUsageThreshold=0.99, systemTopicEnabled=false, bookkeeperClientRegionawarePolicyEnabled=false, managedLedgerMaxSizePerLedgerMbytes=2048, gcWaitTime=300000, allowLoopback=true, brokerServicePurgeInactiveFrequencyInSeconds=60, autoSkipNonRecoverableData=false, numHttpServerThreads=, brokerClientAuthenticationPlugin=, brokerClientTlsTrustStorePassword=, bookkeeperTLSCertificateFilePath=, tlsTrustStoreType=JKS, loadBalancerBandwithOutResourceWeight=1.0, managedLedgerNumWorkerThreads=4, managedLedgerUnackedRangesOpenCacheSetEnabled=true, superUserRoles=, replicationProducerQueueSize=1000, managedLedgerDefaultMarkDeleteRateLimit=0.1, dbStorage_writeCacheMaxSizeMb=, loadBalancerBrokerThresholdShedderPercentage=10, bookkeeperTLSTrustCertTypes=PEM, dispatchThrottlingRatePerTopicInMsg=0, proxyRoles=, brokerPublisherThrottlingMaxByteRate=0, maxConcurrentTopicLoadRequest=5000, tlsEnabled=false, maxConsumersPerSubscription=0, bookkeeperClientSecondaryIsolationGroups=, bookkeeperClientTimeoutInSeconds=30, managedLedgerDefaultEnsembleSize=1, webSocketConnectionsPerBroker=8, maxPendingPublishdRequestsPerConnection=1000, loadBalancerBandwithInResourceWeight=1.0, statusFilePath=/usr/local/apache/htdocs, maxUnackedMessagesPerConsumer=50000, brokerClientTlsProtocols=, dbStorage_rocksDB_writeBufferSizeMB=4, loadBalancerNamespaceBundleMaxSessions=1000, managedLedgerTraceTaskExecution=true, maxConcurrentNonPersistentMessagePerConnection=1000, loadBalancerAutoBundleSplitEnabled=true, loadBalancerAutoUnloadSplitBundlesEnabled=true, defaultNumberOfNamespaceBundles=4, maxNumPartitionsPerPartitionedTopic=0, defaultRetentionSizeInMB=0, brokerDeleteInactiveTopicsEnabled=true, maxUnackedMessagesPerSubscription=200000, flushInterval=60000, transactionMetadataStoreProviderClassName=org.apache.pulsar.transaction.coordinator.impl.InMemTransactionMetadataStoreProvider, bookkeeperTLSClientAuthentication=false, brokerDeduplicationEntriesInterval=1000, backlogQuotaDefaultLimitGB=10, bindAddress=0.0.0.0, topicPublisherThrottlingTickTimeMillis=2, globalZookeeperServers=, maxProducersPerTopic=0, maxConcurrentLookupRequest=50000, tlsKeyStoreType=JKS, zookeeperServers=, loadBalancerDirectMemoryResourceWeight=1.0, bookkeeperClientIsolationGroups=, dbStorage_rocksDB_bloomFilterBitsPerKey=10, authorizationAllowWildcardsMatching=false, journalMaxGroupWaitMSec=1, loadBalancerHostUsageCheckIntervalMinutes=1, tlsRequireTrustedClientCertOnConnect=false, managedLedgerMaxUnackedRangesToPersistInZooKeeper=1000, authenticationEnabled=false, messageExpiryCheckIntervalInMinutes=5, bookkeeperTLSTrustCertsFilePath=, brokerDeduplicationEnabled=false, loadBalancerBrokerMaxTopics=50000, brokerClientTlsTrustStoreType=JKS, managedLedgerCacheSizeMB=, brokerServicePort=6650, tlsTrustStore=, clientLibraryVersionCheckEnabled=false, clusterName=standalone, dbStorage_readAheadCacheBatchSize=1000, maxUnackedMessagesPerBroker=0, webSocketServiceEnabled=true, managedLedgerMaxUnackedRangesToPersist=10000, brokerPublisherThrottlingTickTimeMillis=50, ttlDurationDefaultInSeconds=0, tokenAuthClaim=, subscriptionExpiryCheckIntervalInMinutes=5, managedLedgerCursorMaxEntriesPerLedger=50000, zooKeeperOperationTimeoutSeconds=30, bookkeeperClientMinAvailableBookiesInIsolationGroups=, subscriptionExpirationTimeMinutes=0, loadBalancerNamespaceBundleMaxMsgRate=30000, dbStorage_rocksDB_maxSizeInLevel1MB=256, subscriptionKeySharedUseConsistentHashing=false, dbStorage_rocksDB_numFilesInLevel0=4, bookkeeperDiskWeightBasedPlacementEnabled=false, authorizationEnabled=false, tlsCiphers=, managedLedgerDefaultWriteQuorum=1, webServicePort=8080, dbStorage_rocksDB_sstSizeInMB=4, brokerClientTlsEnabledWithKeyStore=false, bookkeeperClientHealthCheckErrorThresholdPerInterval=5, journalSyncData=false, numWorkerThreadsForNonPersistentTopic=8, bookkeeperClientAuthenticationParametersName=, subscriptionRedeliveryTrackerEnabled=true, backlogQuotaCheckEnabled=true, exposeTopicLevelMetricsInPrometheus=true, anonymousUserRole=, replicationConnectionsPerBroker=16, numIOThreads=, brokerClientTlsCiphers=, authorizationProvider=org.apache.pulsar.broker.authorization.PulsarAuthorizationProvider, loadManagerClassName=org.apache.pulsar.broker.loadbalance.NoopLoadManager, brokerClientAuthenticationParameters=, dbStorage_rocksDB_blockSize=4096, bookkeeperClientAuthenticationParameters=, bookkeeperTLSTrustStorePasswordPath=, loadBalancerSheddingGracePeriodMinutes=30, zooKeeperCacheExpirySeconds=300, tlsKeyFilePath=, maxUnackedMessagesPerSubscriptionOnBrokerBlocked=0.16, tlsCertificateFilePath=},preferLaterVersions=false,brokerServiceCompactionMonitorIntervalInSeconds=60,isSchemaValidationEnforced=false,schemaRegistryStorageClassName=org.apache.pulsar.broker.service.schema.BookkeeperSchemaStorageFactory,schemaRegistryCompatibilityCheckers=[org.apache.pulsar.broker.service.schema.JsonSchemaCompatibilityCheck, org.apache.pulsar.broker.service.schema.AvroSchemaCompatibilityCheck],webSocketNumIoThreads=8,webSocketConnectionsPerBroker=8,webSocketSessionIdleTimeoutMillis=300000,webSocketMaxTextFrameSize=1048576,exposeTopicLevelMetricsInPrometheus=true,exposeConsumerLevelMetricsInPrometheus=false,jvmGCMetricsLoggerClassName=<null>,exposePreciseBacklogInPrometheus=false,functionsWorkerEnabled=false,exposePublisherStats=true,statsUpdateFrequencyInSecs=60,statsUpdateInitialDelayInSecs=60,offloadersDirectory=./offloaders,managedLedgerOffloadDriver=<null>,managedLedgerOffloadMaxThreads=2,narExtractionDirectory=/tmp,managedLedgerOffloadPrefetchRounds=1,transactionCoordinatorEnabled=true,transactionMetadataStoreProviderClassName=org.apache.pulsar.transaction.coordinator.impl.InMemTransactionMetadataStoreProvider,tlsEnabledWithKeyStore=false,tlsProvider=<null>,tlsKeyStoreType=JKS,tlsKeyStore=<null>,tlsKeyStorePassword=<null>,tlsTrustStoreType=JKS,tlsTrustStore=<null>,tlsTrustStorePassword=<null>,brokerClientTlsEnabledWithKeyStore=false,brokerClientSslProvider=<null>,brokerClientTlsTrustStoreType=JKS,brokerClientTlsTrustStore=<null>,brokerClientTlsTrustStorePassword=<null>,brokerClientTlsCiphers=[],brokerClientTlsProtocols=[]]
03:19:23.616 [main] INFO  org.apache.pulsar.broker.TransactionMetadataStoreService - Added new transaction meta store TransactionCoordinatorID(id=0)
03:19:23.712 [pulsar-web-69-6] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:19:23 +0000] "GET /admin/v2/clusters HTTP/1.1" 200 14 "-" "Pulsar-Java-v2.6.0" 11
03:19:23.734 [pulsar-web-69-1] INFO  org.apache.pulsar.broker.admin.impl.ClustersBase - [null] Updated cluster standalone
03:19:23.735 [pulsar-web-69-1] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:19:23 +0000] "POST /admin/v2/clusters/standalone HTTP/1.1" 204 0 "-" "Pulsar-Java-v2.6.0" 14
03:19:23.741 [pulsar-web-69-7] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:19:23 +0000] "GET /admin/v2/clusters HTTP/1.1" 200 14 "-" "Pulsar-Java-v2.6.0" 3
03:19:23.754 [pulsar-ordered-OrderedExecutor-6-0-EventThread] INFO  org.apache.pulsar.zookeeper.ZooKeeperChildrenCache - [State:CONNECTED Timeout:30000 sessionid:0x1000035b049000a local:/127.0.0.1:43576 remoteserver:localhost/127.0.0.1:2181 lastZxid:152 xid:31 sent:32 recv:33 queuedpkts:0 pendingresp:0 queuedevents:0] Received ZooKeeper watch event: WatchedEvent state:SyncConnected type:NodeChildrenChanged path:/admin/clusters
03:19:23.756 [pulsar-web-69-4] INFO  org.apache.pulsar.broker.admin.impl.ClustersBase - [null] Created cluster global
03:19:23.757 [pulsar-web-69-4] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:19:23 +0000] "PUT /admin/v2/clusters/global HTTP/1.1" 204 0 "-" "Pulsar-Java-v2.6.0" 9
03:19:23.758 [pulsar-ordered-OrderedExecutor-6-0-EventThread] INFO  org.apache.pulsar.zookeeper.ZooKeeperChildrenCache - reloadCache called in zookeeperChildrenCache for path /admin/clusters
03:19:23.771 [pulsar-web-69-8] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:19:23 +0000] "GET /admin/v2/tenants HTTP/1.1" 200 10 "-" "Pulsar-Java-v2.6.0" 8
03:19:23.789 [pulsar-web-69-3] INFO  org.apache.pulsar.broker.admin.impl.TenantsBase - [null] Created tenant sample
03:19:23.790 [pulsar-web-69-3] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:19:23 +0000] "PUT /admin/v2/tenants/sample HTTP/1.1" 204 0 "-" "Pulsar-Java-v2.6.0" 12
03:19:23.805 [pulsar-web-69-5] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:19:23 +0000] "GET /admin/v2/namespaces/sample HTTP/1.1" 200 2 "-" "Pulsar-Java-v2.6.0" 11
03:19:23.832 [pulsar-web-69-6] INFO  org.apache.pulsar.broker.web.PulsarWebResource - Successfully validated clusters on tenant [sample]
03:19:23.845 [pulsar-web-69-6] INFO  org.apache.pulsar.broker.admin.impl.NamespacesBase - [null] Created namespace sample/standalone/ns1
03:19:23.846 [pulsar-web-69-6] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:19:23 +0000] "PUT /admin/namespaces/sample/standalone/ns1 HTTP/1.1" 204 0 "-" "Pulsar-Java-v2.6.0" 37
03:19:23.855 [pulsar-web-69-1] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:19:23 +0000] "GET /admin/v2/tenants HTTP/1.1" 200 19 "-" "Pulsar-Java-v2.6.0" 6
03:19:23.866 [pulsar-web-69-7] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:19:23 +0000] "GET /admin/v2/namespaces/public HTTP/1.1" 200 20 "-" "Pulsar-Java-v2.6.0" 9
03:19:23.872 [pulsar-web-69-4] INFO  org.apache.pulsar.broker.web.PulsarWebResource - Successfully validated clusters on tenant [public]
03:19:23.881 [pulsar-web-69-4] INFO  org.apache.pulsar.broker.admin.impl.NamespacesBase - [null] Created namespace public/default
03:19:23.882 [pulsar-web-69-4] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:19:23 +0000] "PUT /admin/v2/namespaces/public/default HTTP/1.1" 204 0 "-" "Pulsar-Java-v2.6.0" 13
03:19:23.893 [pulsar-web-69-8] INFO  org.apache.pulsar.broker.web.PulsarWebResource - Successfully validated clusters on tenant [public]
03:19:23.905 [pulsar-ordered-OrderedExecutor-6-0-EventThread] INFO  org.apache.pulsar.zookeeper.ZooKeeperDataCache - [State:CONNECTED Timeout:30000 sessionid:0x1000035b049000a local:/127.0.0.1:43576 remoteserver:localhost/127.0.0.1:2181 lastZxid:158 xid:47 sent:48 recv:50 queuedpkts:0 pendingresp:0 queuedevents:0] Received ZooKeeper watch event: WatchedEvent state:SyncConnected type:NodeDataChanged path:/admin/policies/public/default
03:19:23.905 [pulsar-web-69-8] INFO  org.apache.pulsar.broker.admin.impl.NamespacesBase - [null] Successfully updated the replication clusters on namespace public/default
03:19:23.908 [pulsar-web-69-8] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:19:23 +0000] "POST /admin/v2/namespaces/public/default/replication HTTP/1.1" 204 0 "-" "Pulsar-Java-v2.6.0" 22
03:19:23.909 [ForkJoinPool.commonPool-worker-0] INFO  org.apache.pulsar.broker.service.BrokerService - /admin/policies/public/default updating with Policies{auth_policies=org.apache.pulsar.common.policies.data.AuthPolicies@745f, replication_clusters=[standalone], bundles=BundlesData{numBundles=4, boundaries=[0x00000000, 0x40000000, 0x80000000, 0xc0000000, 0xffffffff]}, backlog_quota_map={}, persistence=null, deduplicationEnabled=null, autoTopicCreationOverride=null, autoSubscriptionCreationOverride=null, clusterDispatchRate={}, topicDispatchRate={}, subscriptionDispatchRate={}, replicatorDispatchRate={}, clusterSubscribeRate={}, publishMaxMessageRate={}, latency_stats_sample_rate={}, antiAffinityGroup=null, message_ttl_in_seconds=0, subscription_expiration_time_minutes=0, retention_policies=null, deleted=false, encryption_required=false, delayed_delivery_policies=null, subscription_auth_mode=None, max_producers_per_topic=0, max_consumers_per_topic=0, max_consumers_per_subscription=0, max_unacked_messages_per_consumer=-1, max_unacked_messages_per_subscription=-1, compaction_threshold=0, offload_threshold=-1, offload_deletion_lag_ms=null, schema_auto_update_compatibility_strategy=Full, schema_validation_enforced=false, schema_compatibility_Strategy=UNDEFINED, is_allow_auto_update_Schema=true, offload_policies=null}
03:19:24.375 [pulsar-io-51-2] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [public/functions/persistent/coordinate-participants] Rewind from 7:-1 to 7:0
03:19:52.165 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.5:56662
03:19:52.217 [pulsar-ordered-OrderedExecutor-5-0-EventThread] INFO  org.apache.pulsar.broker.cache.LocalZooKeeperCacheService - Successfully copyied bundles data to local zk at /admin/local-policies/sample/standalone/ns1
03:19:52.217 [pulsar-ordered-OrderedExecutor-5-0-EventThread] INFO  org.apache.pulsar.broker.cache.LocalZooKeeperCacheService - Successfully created local policies for /admin/local-policies/sample/standalone/ns1 -- Optional[org.apache.pulsar.common.policies.data.LocalPolicies@6d50a12c]
03:19:52.221 [pulsar-30-7] INFO  org.apache.pulsar.broker.namespace.OwnershipCache - Trying to acquire ownership of sample/standalone/ns1/0xc0000000_0xffffffff
03:19:52.231 [pulsar-ordered-OrderedExecutor-5-0-EventThread] INFO  org.apache.pulsar.broker.namespace.OwnershipCache - Successfully acquired ownership of /namespace/sample/standalone/ns1/0xc0000000_0xffffffff
03:19:52.231 [pulsar-30-3] INFO  org.apache.pulsar.broker.PulsarService - Loading all topics on bundle: sample/standalone/ns1/0xc0000000_0xffffffff
03:19:52.247 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.5:56664
03:19:52.255 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.5:56664][persistent://sample/standalone/ns1/in] Creating producer. producerId=0
03:19:52.258 [pulsar-ordered-OrderedExecutor-0-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedLedgerImpl - Opening managed ledger sample/standalone/ns1/persistent/in
03:19:52.260 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.bookkeeper.mledger.impl.MetaStoreImpl - Creating '/managed-ledgers/sample/standalone/ns1/persistent/in'
03:19:52.269 [pulsar-ordered-OrderedExecutor-5-0-EventThread] INFO  org.apache.pulsar.zookeeper.ZooKeeperManagedLedgerCache - [State:CONNECTED Timeout:30000 sessionid:0x1000035b0490009 local:/127.0.0.1:43574 remoteserver:localhost/127.0.0.1:2181 lastZxid:178 xid:130 sent:130 recv:135 queuedpkts:0 pendingresp:0 queuedevents:1] Received ZooKeeper watch event: WatchedEvent state:SyncConnected type:NodeCreated path:/managed-ledgers/sample/standalone/ns1/persistent
03:19:52.269 [pulsar-ordered-OrderedExecutor-5-0-EventThread] INFO  org.apache.pulsar.zookeeper.ZooKeeperManagedLedgerCache - invalidate called in zookeeperChildrenCache for path /managed-ledgers/sample/standalone/ns1/persistent
03:19:52.272 [zk-metadata-store-callback-48-1] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:19:52.276 [main-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 10
03:19:52.276 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedLedgerImpl - [sample/standalone/ns1/persistent/in] Created ledger 10
03:19:52.279 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.pulsar.broker.service.AbstractTopic - Disabling publish throttling for persistent://sample/standalone/ns1/in
03:19:52.280 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/in] There are no replicated subscriptions on the topic
03:19:52.280 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.pulsar.broker.service.BrokerService - Created topic persistent://sample/standalone/ns1/in - dedup is disabled
03:19:52.282 [Thread-7] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.5:56664] persistent://sample/standalone/ns1/in configured with schema false
03:19:52.284 [Thread-7] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.5:56664] Created new producer: Producer{topic=PersistentTopic{topic=persistent://sample/standalone/ns1/in}, client=/172.17.0.5:56664, producerName=standalone-0-5, producerId=0}
03:19:53.601 [pulsar-web-69-5] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:19:53 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 7
03:19:56.488 [SyncThread-7-1] INFO  org.apache.bookkeeper.bookie.EntryLogManagerBase - Creating a new entry log file because current active log channel has not initialized yet
03:19:56.491 [SyncThread-7-1] INFO  org.apache.bookkeeper.bookie.EntryLoggerAllocator - Created new entry log file data/standalone/bookkeeper0/current/0.log for logId 0.
03:19:56.494 [pool-5-thread-1] INFO  org.apache.bookkeeper.bookie.EntryLoggerAllocator - Created new entry log file data/standalone/bookkeeper0/current/1.log for logId 1.
03:20:23.616 [pulsar-web-69-4] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:20:23 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 18
03:20:53.600 [pulsar-web-69-8] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:20:53 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 7
03:21:23.594 [pulsar-web-69-3] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:21:23 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 6
03:21:53.616 [pulsar-web-69-7] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:21:53 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 25
03:22:23.598 [pulsar-web-69-5] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:22:23 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 9
03:22:30.356 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.15:48706
03:22:30.356 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.15:48704
03:22:30.358 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.15:48708
03:22:30.637 [pulsar-30-6] INFO  org.apache.pulsar.broker.namespace.OwnershipCache - Trying to acquire ownership of sample/standalone/ns1/0x40000000_0x80000000
03:22:30.640 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.15:48710
03:22:30.642 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.15:48712
03:22:30.644 [pulsar-ordered-OrderedExecutor-5-0-EventThread] INFO  org.apache.pulsar.broker.namespace.OwnershipCache - Successfully acquired ownership of /namespace/sample/standalone/ns1/0x40000000_0x80000000
03:22:30.645 [pulsar-30-10] INFO  org.apache.pulsar.broker.PulsarService - Loading all topics on bundle: sample/standalone/ns1/0x40000000_0x80000000
03:22:30.651 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.15:48714
03:22:30.652 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:48712] Subscribing on topic persistent://sample/standalone/ns1/in / scala-sub-1
03:22:30.653 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:48710] Subscribing on topic persistent://sample/standalone/ns1/models / scala-sub-2
03:22:30.657 [pulsar-io-51-1] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [sample/standalone/ns1/persistent/in] Cursor scala-sub-1 recovered to position 10:31
03:22:30.657 [pulsar-io-51-1] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:22:30.657 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:48714][persistent://sample/standalone/ns1/event-log] Creating producer. producerId=0
03:22:30.661 [pulsar-ordered-OrderedExecutor-6-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedLedgerImpl - Opening managed ledger sample/standalone/ns1/persistent/event-log
03:22:30.661 [pulsar-ordered-OrderedExecutor-5-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedLedgerImpl - Opening managed ledger sample/standalone/ns1/persistent/models
03:22:30.663 [main-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 11
03:22:30.666 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.bookkeeper.mledger.impl.MetaStoreImpl - Creating '/managed-ledgers/sample/standalone/ns1/persistent/event-log'
03:22:30.666 [bookkeeper-ml-workers-OrderedExecutor-2-0] INFO  org.apache.bookkeeper.mledger.impl.MetaStoreImpl - Creating '/managed-ledgers/sample/standalone/ns1/persistent/models'
03:22:30.669 [pulsar-ordered-OrderedExecutor-5-0-EventThread] INFO  org.apache.pulsar.zookeeper.ZooKeeperCache - [State:CONNECTED Timeout:30000 sessionid:0x1000035b0490009 local:/127.0.0.1:43574 remoteserver:localhost/127.0.0.1:2181 lastZxid:188 xid:224 sent:224 recv:230 queuedpkts:0 pendingresp:1 queuedevents:2] Received ZooKeeper watch event: WatchedEvent state:SyncConnected type:NodeCreated path:/managed-ledgers/sample/standalone/ns1/persistent/event-log
03:22:30.671 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.bookkeeper.mledger.impl.MetaStoreImpl - [sample/standalone/ns1/persistent/in] [scala-sub-1] Updating cursor info ledgerId=11 mark-delete=10:31
03:22:30.669 [pulsar-ordered-OrderedExecutor-5-0-EventThread] INFO  org.apache.pulsar.zookeeper.ZooKeeperManagedLedgerCache - [State:CONNECTED Timeout:30000 sessionid:0x1000035b0490009 local:/127.0.0.1:43574 remoteserver:localhost/127.0.0.1:2181 lastZxid:188 xid:224 sent:224 recv:230 queuedpkts:1 pendingresp:1 queuedevents:1] Received ZooKeeper watch event: WatchedEvent state:SyncConnected type:NodeChildrenChanged path:/managed-ledgers/sample/standalone/ns1/persistent
03:22:30.672 [pulsar-ordered-OrderedExecutor-5-0-EventThread] INFO  org.apache.pulsar.zookeeper.ZooKeeperManagedLedgerCache - invalidate called in zookeeperChildrenCache for path /managed-ledgers/sample/standalone/ns1/persistent
03:22:30.672 [pulsar-ordered-OrderedExecutor-5-0-EventThread] INFO  org.apache.pulsar.zookeeper.ZooKeeperCache - [State:CONNECTED Timeout:30000 sessionid:0x1000035b0490009 local:/127.0.0.1:43574 remoteserver:localhost/127.0.0.1:2181 lastZxid:189 xid:225 sent:225 recv:232 queuedpkts:0 pendingresp:1 queuedevents:0] Received ZooKeeper watch event: WatchedEvent state:SyncConnected type:NodeCreated path:/managed-ledgers/sample/standalone/ns1/persistent/models
03:22:30.673 [zk-metadata-store-callback-48-1] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:22:30.674 [zk-metadata-store-callback-48-1] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:22:30.676 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [sample/standalone/ns1/persistent/in] Updated cursor scala-sub-1 with ledger id 11 md-position=10:31 rd-position=10:32
03:22:30.677 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedLedgerImpl - [sample/standalone/ns1/persistent/in] Opened new cursor: ManagedCursorImpl{ledger=sample/standalone/ns1/persistent/in, name=scala-sub-1, ackPos=10:31, readPos=10:32}
03:22:30.678 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/in] There are no replicated subscriptions on the topic
03:22:30.679 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/in][scala-sub-1] Created new subscription for 0
03:22:30.679 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:48712] Created subscription on topic persistent://sample/standalone/ns1/in / scala-sub-1
03:22:30.682 [main-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 12
03:22:30.683 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedLedgerImpl - [sample/standalone/ns1/persistent/event-log] Created ledger 12
03:22:30.686 [main-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 13
03:22:30.686 [bookkeeper-ml-workers-OrderedExecutor-2-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedLedgerImpl - [sample/standalone/ns1/persistent/models] Created ledger 13
03:22:30.694 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.pulsar.broker.service.AbstractTopic - Disabling publish throttling for persistent://sample/standalone/ns1/event-log
03:22:30.695 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/event-log] There are no replicated subscriptions on the topic
03:22:30.698 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.pulsar.broker.service.BrokerService - Created topic persistent://sample/standalone/ns1/event-log - dedup is disabled
03:22:30.700 [bookkeeper-ml-workers-OrderedExecutor-2-0] INFO  org.apache.pulsar.broker.service.AbstractTopic - Disabling publish throttling for persistent://sample/standalone/ns1/models
03:22:30.700 [bookkeeper-ml-workers-OrderedExecutor-2-0] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/models] There are no replicated subscriptions on the topic
03:22:30.702 [bookkeeper-ml-workers-OrderedExecutor-2-0] INFO  org.apache.pulsar.broker.service.BrokerService - Created topic persistent://sample/standalone/ns1/models - dedup is disabled
03:22:30.712 [Thread-8] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:48714] persistent://sample/standalone/ns1/event-log configured with schema false
03:22:30.708 [bookkeeper-ml-workers-OrderedExecutor-2-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [sample/standalone/ns1/persistent/models] Cursor scala-sub-2 recovered to position 13:-1
03:22:30.713 [bookkeeper-ml-workers-OrderedExecutor-2-0] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:22:30.717 [Thread-8] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:48714] Created new producer: Producer{topic=PersistentTopic{topic=persistent://sample/standalone/ns1/event-log}, client=/172.17.0.15:48714, producerName=standalone-0-0, producerId=0}
03:22:30.727 [main-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 14
03:22:30.734 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.bookkeeper.mledger.impl.MetaStoreImpl - [sample/standalone/ns1/persistent/models] [scala-sub-2] Updating cursor info ledgerId=14 mark-delete=13:-1
03:22:30.738 [bookkeeper-ml-workers-OrderedExecutor-2-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [sample/standalone/ns1/persistent/models] Updated cursor scala-sub-2 with ledger id 14 md-position=13:-1 rd-position=13:0
03:22:30.738 [bookkeeper-ml-workers-OrderedExecutor-2-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedLedgerImpl - [sample/standalone/ns1/persistent/models] Opened new cursor: ManagedCursorImpl{ledger=sample/standalone/ns1/persistent/models, name=scala-sub-2, ackPos=13:-1, readPos=13:0}
03:22:30.739 [bookkeeper-ml-workers-OrderedExecutor-2-0] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/models] There are no replicated subscriptions on the topic
03:22:30.740 [bookkeeper-ml-workers-OrderedExecutor-2-0] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/models][scala-sub-2] Created new subscription for 0
03:22:30.740 [bookkeeper-ml-workers-OrderedExecutor-2-0] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:48710] Created subscription on topic persistent://sample/standalone/ns1/models / scala-sub-2
03:22:31.678 [pulsar-io-51-1] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [sample/standalone/ns1/persistent/in-scala-sub-1] Rewind from 10:32 to 10:32
03:22:31.739 [pulsar-io-51-2] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [sample/standalone/ns1/persistent/models-scala-sub-2] Rewind from 13:0 to 13:0
03:22:43.167 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /127.0.0.1:53414
03:22:43.356 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/127.0.0.1:53414] Subscribing on topic persistent://sample/standalone/ns1/event-log / tst-consumer
03:22:43.358 [pulsar-io-51-1] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [sample/standalone/ns1/persistent/event-log] Cursor tst-consumer recovered to position 12:2
03:22:43.359 [pulsar-io-51-1] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:22:43.368 [main-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 15
03:22:43.373 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.bookkeeper.mledger.impl.MetaStoreImpl - [sample/standalone/ns1/persistent/event-log] [tst-consumer] Updating cursor info ledgerId=15 mark-delete=12:2
03:22:43.376 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [sample/standalone/ns1/persistent/event-log] Updated cursor tst-consumer with ledger id 15 md-position=12:2 rd-position=12:3
03:22:43.376 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedLedgerImpl - [sample/standalone/ns1/persistent/event-log] Opened new cursor: ManagedCursorImpl{ledger=sample/standalone/ns1/persistent/event-log, name=tst-consumer, ackPos=12:2, readPos=12:3}
03:22:43.377 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [sample/standalone/ns1/persistent/event-log-tst-consumer] Rewind from 12:3 to 12:3
03:22:43.377 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/event-log] There are no replicated subscriptions on the topic
03:22:43.377 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/event-log][tst-consumer] Created new subscription for 0
03:22:43.377 [bookkeeper-ml-workers-OrderedExecutor-1-0] INFO  org.apache.pulsar.broker.service.ServerCnx - [/127.0.0.1:53414] Created subscription on topic persistent://sample/standalone/ns1/event-log / tst-consumer
03:22:53.597 [pulsar-web-69-6] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:22:53 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 9
03:23:23.622 [pulsar-web-69-1] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:23:23 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 30
03:23:53.604 [pulsar-web-69-4] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:23:53 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 11
03:24:23.603 [pulsar-web-69-8] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:24:23 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 14
03:24:53.702 [pulsar-web-69-5] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:24:53 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 61
03:25:23.689 [pulsar-web-69-6] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:25:23 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 87
03:25:46.510 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /127.0.0.1:54638
03:25:47.277 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /127.0.0.1:54646
03:25:47.286 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/127.0.0.1:54646][persistent://sample/standalone/ns1/models] Creating producer. producerId=0
03:25:47.294 [Thread-9] INFO  org.apache.pulsar.broker.service.ServerCnx - [/127.0.0.1:54646] persistent://sample/standalone/ns1/models configured with schema false
03:25:47.297 [Thread-9] INFO  org.apache.pulsar.broker.service.ServerCnx - [/127.0.0.1:54646] Created new producer: Producer{topic=PersistentTopic{topic=persistent://sample/standalone/ns1/models}, client=/127.0.0.1:54646, producerName=standalone-0-1, producerId=0}
03:25:47.877 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [PersistentTopic{topic=persistent://sample/standalone/ns1/models}][standalone-0-1] Closing producer on cnx /127.0.0.1:54646
03:25:47.894 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [PersistentTopic{topic=persistent://sample/standalone/ns1/models}][standalone-0-1] Closed producer on cnx /127.0.0.1:54646
03:25:47.920 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /127.0.0.1:54638
03:25:47.920 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /127.0.0.1:54646
03:25:53.602 [pulsar-web-69-8] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:25:53 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 13
03:26:23.603 [pulsar-web-69-3] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:26:23 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 12
03:26:53.599 [pulsar-web-69-1] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:26:53 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 9
03:27:23.602 [pulsar-web-69-7] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:27:23 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 10
03:27:53.610 [pulsar-web-69-4] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:27:53 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 17
03:28:23.602 [pulsar-web-69-5] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:28:23 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 10
03:28:35.486 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /127.0.0.1:55802
03:28:35.854 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /127.0.0.1:55804
03:28:35.860 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/127.0.0.1:55804][persistent://sample/standalone/ns1/models] Creating producer. producerId=0
03:28:35.862 [Thread-10] INFO  org.apache.pulsar.broker.service.ServerCnx - [/127.0.0.1:55804] persistent://sample/standalone/ns1/models configured with schema false
03:28:35.863 [Thread-10] INFO  org.apache.pulsar.broker.service.ServerCnx - [/127.0.0.1:55804] Created new producer: Producer{topic=PersistentTopic{topic=persistent://sample/standalone/ns1/models}, client=/127.0.0.1:55804, producerName=standalone-0-2, producerId=0}
03:28:36.499 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [PersistentTopic{topic=persistent://sample/standalone/ns1/models}][standalone-0-2] Closing producer on cnx /127.0.0.1:55804
03:28:36.499 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [PersistentTopic{topic=persistent://sample/standalone/ns1/models}][standalone-0-2] Closed producer on cnx /127.0.0.1:55804
03:28:36.508 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /127.0.0.1:55804
03:28:36.510 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /127.0.0.1:55802
03:28:53.601 [pulsar-web-69-6] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:28:53 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 11
03:29:23.592 [pulsar-web-69-8] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:29:23 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 4
03:29:26.837 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.4:54872
03:29:26.837 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.4:54872
03:29:53.603 [pulsar-web-69-3] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:29:53 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 12
03:30:23.620 [pulsar-web-69-1] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:30:23 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 27
03:30:53.606 [pulsar-web-69-7] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:30:53 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 14
03:31:23.601 [pulsar-web-69-4] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:31:23 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 8
03:31:53.608 [pulsar-web-69-5] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:31:53 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 16
03:32:23.609 [pulsar-web-69-6] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:32:23 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 21
03:32:53.614 [pulsar-web-69-8] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:32:53 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 23
03:32:58.804 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.4:56520
03:33:00.083 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.4:56538
03:33:00.090 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.4:56538][persistent://sample/standalone/ns1/models] Creating producer. producerId=0
03:33:00.097 [Thread-11] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.4:56538] persistent://sample/standalone/ns1/models configured with schema false
03:33:00.098 [Thread-11] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.4:56538] Created new producer: Producer{topic=PersistentTopic{topic=persistent://sample/standalone/ns1/models}, client=/172.17.0.4:56538, producerName=standalone-0-3, producerId=0}
03:33:00.254 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [PersistentTopic{topic=persistent://sample/standalone/ns1/models}][standalone-0-3] Closing producer on cnx /172.17.0.4:56538
03:33:00.254 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [PersistentTopic{topic=persistent://sample/standalone/ns1/models}][standalone-0-3] Closed producer on cnx /172.17.0.4:56538
03:33:00.282 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.4:56520
03:33:00.283 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.4:56538
03:33:01.610 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [PersistentTopic{topic=persistent://sample/standalone/ns1/event-log}][standalone-0-0] Closing producer on cnx /172.17.0.15:48714
03:33:01.610 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [PersistentTopic{topic=persistent://sample/standalone/ns1/event-log}][standalone-0-0] Closed producer on cnx /172.17.0.15:48714
03:33:04.198 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:48710] Closing consumer: 0
03:33:04.198 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:48712] Closing consumer: 0
03:33:04.200 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.AbstractDispatcherSingleActiveConsumer - Removing consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/models, name=scala-sub-2}, consumerId=0, consumerName=5353d, address=/172.17.0.15:48710}
03:33:04.200 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.AbstractDispatcherSingleActiveConsumer - Removing consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/in, name=scala-sub-1}, consumerId=0, consumerName=444da, address=/172.17.0.15:48712}
03:33:04.201 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:48710] Closed consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/models, name=scala-sub-2}, consumerId=0, consumerName=5353d, address=/172.17.0.15:48710}
03:33:04.203 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:48712] Closed consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/in, name=scala-sub-1}, consumerId=0, consumerName=444da, address=/172.17.0.15:48712}
03:33:04.204 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.15:48712
03:33:04.204 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.15:48708
03:33:04.212 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.15:48710
03:33:04.213 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.15:48704
03:33:06.215 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.15:53252
03:33:06.215 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.15:53250
03:33:06.376 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.15:53254
03:33:06.567 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.15:53260
03:33:06.567 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.15:53256
03:33:06.569 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.15:53258
03:33:06.579 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53256] Subscribing on topic persistent://sample/standalone/ns1/in / scala-sub-1
03:33:06.579 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53260] Subscribing on topic persistent://sample/standalone/ns1/models / scala-sub-2
03:33:06.584 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/in] There are no replicated subscriptions on the topic
03:33:06.584 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/models] There are no replicated subscriptions on the topic
03:33:06.584 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/in][scala-sub-1] Created new subscription for 0
03:33:06.584 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/models][scala-sub-2] Created new subscription for 0
03:33:06.584 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53256] Created subscription on topic persistent://sample/standalone/ns1/in / scala-sub-1
03:33:06.585 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53260] Created subscription on topic persistent://sample/standalone/ns1/models / scala-sub-2
03:33:06.586 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53258][persistent://sample/standalone/ns1/event-log] Creating producer. producerId=0
03:33:06.592 [Thread-12] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53258] persistent://sample/standalone/ns1/event-log configured with schema false
03:33:06.594 [Thread-12] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53258] Created new producer: Producer{topic=PersistentTopic{topic=persistent://sample/standalone/ns1/event-log}, client=/172.17.0.15:53258, producerName=standalone-0-4, producerId=0}
03:33:07.583 [pulsar-io-51-2] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [sample/standalone/ns1/persistent/models-scala-sub-2] Rewind from 13:3 to 13:2
03:33:07.583 [pulsar-io-51-1] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [sample/standalone/ns1/persistent/in-scala-sub-1] Rewind from 10:158 to 10:150
03:33:08.413 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [PersistentTopic{topic=persistent://sample/standalone/ns1/event-log}][standalone-0-4] Closing producer on cnx /172.17.0.15:53258
03:33:08.413 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [PersistentTopic{topic=persistent://sample/standalone/ns1/event-log}][standalone-0-4] Closed producer on cnx /172.17.0.15:53258
03:33:10.685 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53260] Closing consumer: 0
03:33:10.686 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.AbstractDispatcherSingleActiveConsumer - Removing consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/models, name=scala-sub-2}, consumerId=0, consumerName=e8448, address=/172.17.0.15:53260}
03:33:10.691 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53260] Closed consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/models, name=scala-sub-2}, consumerId=0, consumerName=e8448, address=/172.17.0.15:53260}
03:33:10.708 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53256] Closing consumer: 0
03:33:10.708 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.AbstractDispatcherSingleActiveConsumer - Removing consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/in, name=scala-sub-1}, consumerId=0, consumerName=d0b6a, address=/172.17.0.15:53256}
03:33:10.713 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.15:53260
03:33:10.713 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53256] Closed consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/in, name=scala-sub-1}, consumerId=0, consumerName=d0b6a, address=/172.17.0.15:53256}
03:33:10.717 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.15:53252
03:33:10.728 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.15:53250
03:33:10.728 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.15:53256
03:33:13.457 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.15:53326
03:33:13.458 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.15:53328
03:33:13.722 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.15:53334
03:33:13.722 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.15:53336
03:33:13.728 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53334] Subscribing on topic persistent://sample/standalone/ns1/models / scala-sub-2
03:33:13.728 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53336] Subscribing on topic persistent://sample/standalone/ns1/in / scala-sub-1
03:33:13.729 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/in] There are no replicated subscriptions on the topic
03:33:13.729 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/in][scala-sub-1] Created new subscription for 0
03:33:13.729 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/models] There are no replicated subscriptions on the topic
03:33:13.729 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/models][scala-sub-2] Created new subscription for 0
03:33:13.729 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53336] Created subscription on topic persistent://sample/standalone/ns1/in / scala-sub-1
03:33:13.729 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53334] Created subscription on topic persistent://sample/standalone/ns1/models / scala-sub-2
03:33:14.007 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53334] Closing consumer: 0
03:33:14.007 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53336] Closing consumer: 0
03:33:14.007 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.AbstractDispatcherSingleActiveConsumer - Removing consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/in, name=scala-sub-1}, consumerId=0, consumerName=acb86, address=/172.17.0.15:53336}
03:33:14.007 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.AbstractDispatcherSingleActiveConsumer - Removing consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/models, name=scala-sub-2}, consumerId=0, consumerName=7487b, address=/172.17.0.15:53334}
03:33:14.008 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53334] Closed consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/models, name=scala-sub-2}, consumerId=0, consumerName=7487b, address=/172.17.0.15:53334}
03:33:14.008 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53336] Closed consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/in, name=scala-sub-1}, consumerId=0, consumerName=acb86, address=/172.17.0.15:53336}
03:33:14.016 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.15:53328
03:33:14.016 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.15:53326
03:33:14.019 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.15:53334
03:33:14.020 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.15:53336
03:33:14.729 [pulsar-io-51-2] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [sample/standalone/ns1/persistent/models-scala-sub-2] Rewind from 13:3 to 13:2
03:33:14.730 [pulsar-io-51-1] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [sample/standalone/ns1/persistent/in-scala-sub-1] Rewind from 10:159 to 10:150
03:33:16.676 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.15:53350
03:33:16.677 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.15:53352
03:33:16.922 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.15:53358
03:33:16.923 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.15:53360
03:33:16.928 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53360] Subscribing on topic persistent://sample/standalone/ns1/in / scala-sub-1
03:33:16.928 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53358] Subscribing on topic persistent://sample/standalone/ns1/models / scala-sub-2
03:33:16.929 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/in] There are no replicated subscriptions on the topic
03:33:16.929 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/models] There are no replicated subscriptions on the topic
03:33:16.929 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/models][scala-sub-2] Created new subscription for 0
03:33:16.929 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/in][scala-sub-1] Created new subscription for 0
03:33:16.929 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53358] Created subscription on topic persistent://sample/standalone/ns1/models / scala-sub-2
03:33:16.929 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53360] Created subscription on topic persistent://sample/standalone/ns1/in / scala-sub-1
03:33:17.140 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53358] Closing consumer: 0
03:33:17.140 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53360] Closing consumer: 0
03:33:17.141 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.AbstractDispatcherSingleActiveConsumer - Removing consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/in, name=scala-sub-1}, consumerId=0, consumerName=15581, address=/172.17.0.15:53360}
03:33:17.141 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.AbstractDispatcherSingleActiveConsumer - Removing consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/models, name=scala-sub-2}, consumerId=0, consumerName=6cc3b, address=/172.17.0.15:53358}
03:33:17.141 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53360] Closed consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/in, name=scala-sub-1}, consumerId=0, consumerName=15581, address=/172.17.0.15:53360}
03:33:17.141 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53358] Closed consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/models, name=scala-sub-2}, consumerId=0, consumerName=6cc3b, address=/172.17.0.15:53358}
03:33:17.929 [pulsar-io-51-1] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [sample/standalone/ns1/persistent/in-scala-sub-1] Rewind from 10:150 to 10:150
03:33:17.929 [pulsar-io-51-2] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [sample/standalone/ns1/persistent/models-scala-sub-2] Rewind from 13:2 to 13:2
03:33:23.593 [pulsar-web-69-3] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:33:23 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 6
03:33:36.380 [pulsar-io-51-1] WARN  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.15:53254] Got exception io.netty.channel.unix.Errors$NativeIoException: readAddress(..) failed: Connection reset by peer
03:33:36.382 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.15:53254
03:33:36.570 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.15:53258
03:33:48.107 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.15:53350
03:33:48.108 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.15:53352
03:33:48.108 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.15:53358
03:33:48.112 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.15:53360
03:33:53.599 [pulsar-web-69-1] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:33:53 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 10
03:34:05.460 [io-write-scheduler-OrderedScheduler-1-0] INFO  org.apache.bookkeeper.statelib.impl.kv.RocksdbKVStore - Checkpoint local state store 000000000000000000/000000000000000001/000000000000000000 at revision -1
03:34:05.475 [io-write-scheduler-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.statelib.impl.kv.RocksdbKVStore - Checkpoint local state store 000000000000000000/000000000000000000/000000000000000000 at revision -1
03:34:05.476 [io-checkpoint-scheduler-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.statelib.impl.rocksdb.checkpoint.RocksdbCheckpointTask - Create a local checkpoint of state store 000000000000000000/000000000000000000/000000000000000000 at /pulsar/data/standalone/bookkeeper/ranges/data/ranges/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302
03:34:05.477 [io-checkpoint-scheduler-OrderedScheduler-1-0] INFO  org.apache.bookkeeper.statelib.impl.rocksdb.checkpoint.RocksdbCheckpointTask - Create a local checkpoint of state store 000000000000000000/000000000000000001/000000000000000000 at /pulsar/data/standalone/bookkeeper/ranges/data/ranges/000000000000000000/000000000000000001/000000000000000000/checkpoints/d8b8b1a0-52ad-444d-a3e3-c72d10c7e631
03:34:05.520 [io-write-scheduler-OrderedScheduler-1-0] INFO  org.apache.bookkeeper.statelib.impl.kv.RocksdbKVStore - Checkpoint local state store 000000000000000001/000000000000000001/000000000000000000 at revision -1
03:34:05.595 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/MANIFEST-000004/<default>/allocation moved version from -1 to 0.
03:34:05.606 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/MANIFEST-000004:<default> : []
03:34:05.569 [io-checkpoint-scheduler-OrderedScheduler-1-0] ERROR org.apache.bookkeeper.statelib.impl.rocksdb.checkpoint.RocksdbCheckpointTask - Failed to checkpoint db 000000000000000000/000000000000000001/000000000000000000 to dir /pulsar/data/standalone/bookkeeper/ranges/data/ranges/000000000000000000/000000000000000001/000000000000000000/checkpoints/d8b8b1a0-52ad-444d-a3e3-c72d10c7e631
org.apache.distributedlog.exceptions.LogExistsException: Someone just created log /stream/storage/000000000000000000/000000000000000001/000000000000000000/checkpoints/d8b8b1a0-52ad-444d-a3e3-c72d10c7e631/<default>
	at org.apache.distributedlog.impl.metadata.ZKLogStreamMetadataStore$4.processResult(ZKLogStreamMetadataStore.java:511) ~[org.apache.distributedlog-distributedlog-core-4.10.0.jar:4.10.0]
	at org.apache.bookkeeper.zookeeper.ZooKeeperClient$3$1.processResult(ZooKeeperClient.java:488) ~[org.apache.bookkeeper-bookkeeper-server-4.10.0.jar:4.10.0]
	at org.apache.zookeeper.ClientCnxn$EventThread.processEvent(ClientCnxn.java:669) ~[org.apache.pulsar-pulsar-zookeeper-2.6.0.jar:2.6.0]
	at org.apache.zookeeper.ClientCnxn$EventThread.run(ClientCnxn.java:510) ~[org.apache.pulsar-pulsar-zookeeper-2.6.0.jar:2.6.0]
03:34:05.665 [io-checkpoint-scheduler-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/MANIFEST-000004:<default> : []
03:34:05.669 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/MANIFEST-000004/<default>/allocation moved to phase ALLOCATING : version = 0.
03:34:05.671 [DLM-/stream/storage-OrderedScheduler-0-0] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:34:05.670 [io-checkpoint-scheduler-OrderedScheduler-1-0] ERROR org.apache.bookkeeper.statelib.impl.kv.RocksdbKVStore - Failed to checkpoint state store 000000000000000000/000000000000000001/000000000000000000 at revision 0
org.apache.bookkeeper.statelib.api.exceptions.StateStoreException: Failed to checkpoint db 000000000000000000/000000000000000001/000000000000000000 to dir /pulsar/data/standalone/bookkeeper/ranges/data/ranges/000000000000000000/000000000000000001/000000000000000000/checkpoints/d8b8b1a0-52ad-444d-a3e3-c72d10c7e631
	at org.apache.bookkeeper.statelib.impl.rocksdb.checkpoint.RocksdbCheckpointTask.checkpoint(RocksdbCheckpointTask.java:112) ~[org.apache.bookkeeper-statelib-4.10.0.jar:4.10.0]
	at org.apache.bookkeeper.statelib.impl.rocksdb.checkpoint.RocksCheckpointer.checkpointAtTxid(RocksCheckpointer.java:160) ~[org.apache.bookkeeper-statelib-4.10.0.jar:4.10.0]
	at org.apache.bookkeeper.statelib.impl.kv.RocksdbKVStore.lambda$checkpoint$0(RocksdbKVStore.java:172) ~[org.apache.bookkeeper-statelib-4.10.0.jar:4.10.0]
	at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:511) [?:1.8.0_252]
	at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125) [com.google.guava-guava-25.1-jre.jar:?]
	at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:57) [com.google.guava-guava-25.1-jre.jar:?]
	at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78) [com.google.guava-guava-25.1-jre.jar:?]
	at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:511) [?:1.8.0_252]
	at java.util.concurrent.FutureTask.run(FutureTask.java:266) [?:1.8.0_252]
	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.access$201(ScheduledThreadPoolExecutor.java:180) [?:1.8.0_252]
	at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.run(ScheduledThreadPoolExecutor.java:293) [?:1.8.0_252]
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149) [?:1.8.0_252]
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624) [?:1.8.0_252]
	at io.netty.util.concurrent.FastThreadLocalRunnable.run(FastThreadLocalRunnable.java:30) [io.netty-netty-common-4.1.48.Final.jar:4.1.48.Final]
	at java.lang.Thread.run(Thread.java:748) [?:1.8.0_252]
Caused by: org.apache.distributedlog.exceptions.LogExistsException: Someone just created log /stream/storage/000000000000000000/000000000000000001/000000000000000000/checkpoints/d8b8b1a0-52ad-444d-a3e3-c72d10c7e631/<default>
	at org.apache.distributedlog.impl.metadata.ZKLogStreamMetadataStore$4.processResult(ZKLogStreamMetadataStore.java:511) ~[org.apache.distributedlog-distributedlog-core-4.10.0.jar:4.10.0]
	at org.apache.bookkeeper.zookeeper.ZooKeeperClient$3$1.processResult(ZooKeeperClient.java:488) ~[org.apache.bookkeeper-bookkeeper-server-4.10.0.jar:4.10.0]
	at org.apache.zookeeper.ClientCnxn$EventThread.processEvent(ClientCnxn.java:669) ~[org.apache.pulsar-pulsar-zookeeper-2.6.0.jar:2.6.0]
	at org.apache.zookeeper.ClientCnxn$EventThread.run(ClientCnxn.java:510) ~[org.apache.pulsar-pulsar-zookeeper-2.6.0.jar:2.6.0]
03:34:05.672 [io-checkpoint-scheduler-OrderedScheduler-1-0] INFO  org.apache.bookkeeper.statelib.impl.rocksdb.checkpoint.RocksdbCheckpointTask - Create a local checkpoint of state store 000000000000000001/000000000000000001/000000000000000000 at /pulsar/data/standalone/bookkeeper/ranges/data/ranges/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5
03:34:05.681 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 16
03:34:05.683 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/MANIFEST-000004/<default>/allocation moved version from 0 to 1.
03:34:05.683 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/MANIFEST-000004/<default>/allocation moved to phase ALLOCATED : version = 1.
03:34:05.683 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/MANIFEST-000004/<default>/allocation moved to phase HANDING_OVER : version = 1.
03:34:05.683 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - No max ledger sequence number found while creating log segment 1 for 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/MANIFEST-000004:<default>.
03:34:05.686 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/MANIFEST-000004/<default>/allocation moved to phase HANDED_OVER : version = 1.
03:34:05.686 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/MANIFEST-000004/<default>/allocation moved version from 1 to 2.
03:34:05.686 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/MANIFEST-000004/<default>/allocation moved to phase ALLOCATING : version = 2.
03:34:05.686 [main-EventThread] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:34:05.688 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/MANIFEST-000004 added log segment (inprogress_000000000000000001 : [LogSegmentId:16, firstTxId:152, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]) to cache.
03:34:05.691 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 17
03:34:05.692 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Deleting log segments older than 1595475245690 for 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/MANIFEST-000004:<default> : []
03:34:05.694 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/MANIFEST-000004/<default>/allocation moved version from 2 to 3.
03:34:05.694 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/MANIFEST-000004/<default>/allocation moved to phase ALLOCATED : version = 3.
03:34:05.714 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Flushing before closing log segment 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/MANIFEST-000004:<default>:inprogress_000000000000000001
03:34:05.720 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Closing BKPerStreamLogWriter (abort=false) for 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/MANIFEST-000004:<default>:inprogress_000000000000000001 : lastDLSN = DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0} outstandingTransmits = 1 writesPendingTransmit = 0
03:34:05.724 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Stream 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/MANIFEST-000004:<default>:inprogress_000000000000000001 aborted 0 writes
03:34:05.729 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/MANIFEST-000004/<default>/allocation moved version from -1 to 0.
03:34:05.732 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/MANIFEST-000004:<default> : []
03:34:05.735 [io-checkpoint-scheduler-OrderedScheduler-1-0] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/MANIFEST-000004:<default> : []
03:34:05.738 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/MANIFEST-000004/<default>/allocation moved to phase ALLOCATING : version = 0.
03:34:05.739 [DLM-/stream/storage-OrderedScheduler-0-0] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:34:05.744 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 18
03:34:05.746 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/MANIFEST-000004/<default>/allocation moved version from 0 to 1.
03:34:05.746 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/MANIFEST-000004/<default>/allocation moved to phase ALLOCATED : version = 1.
03:34:05.746 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/MANIFEST-000004/<default>/allocation moved to phase HANDING_OVER : version = 1.
03:34:05.747 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - No max ledger sequence number found while creating log segment 1 for 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/MANIFEST-000004:<default>.
03:34:05.749 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/MANIFEST-000004/<default>/allocation moved to phase HANDED_OVER : version = 1.
03:34:05.749 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/MANIFEST-000004/<default>/allocation moved version from 1 to 2.
03:34:05.749 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/MANIFEST-000004/<default>/allocation moved to phase ALLOCATING : version = 2.
03:34:05.749 [main-EventThread] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:34:05.750 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/MANIFEST-000004 added log segment (inprogress_000000000000000001 : [LogSegmentId:18, firstTxId:99, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]) to cache.
03:34:05.753 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Deleting log segments older than 1595475245752 for 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/MANIFEST-000004:<default> : []
03:34:05.759 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 19
03:34:05.760 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/MANIFEST-000004/<default>/allocation moved version from 2 to 3.
03:34:05.760 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/MANIFEST-000004/<default>/allocation moved to phase ALLOCATED : version = 3.
03:34:05.774 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Try storing max sequence number 1 in completing /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/MANIFEST-000004/<default>/ledgers/inprogress_000000000000000001.
03:34:05.776 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.distributedlog.impl.ZKLogSegmentMetadataStore - Delete segment : [LogSegmentId:16, firstTxId:152, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]
03:34:05.786 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Flushing before closing log segment 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/MANIFEST-000004:<default>:inprogress_000000000000000001
03:34:05.788 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/MANIFEST-000004 added log segment (logrecs_000000000000000001 : [LogSegmentId:16, firstTxId:152, lastTxId:152, version:VERSION_V5_SEQUENCE_ID, completionTime:1595734445774, recordCount:1, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:0, lastSlotId:0, inprogress:false, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:0]) to cache.
03:34:05.789 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogWriteHandler - Completed inprogress_000000000000000001 to logrecs_000000000000000001 for 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/MANIFEST-000004:<default> : [LogSegmentId:16, firstTxId:152, lastTxId:152, version:VERSION_V5_SEQUENCE_ID, completionTime:1595734445774, recordCount:1, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:0, lastSlotId:0, inprogress:false, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:0]
03:34:05.791 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Closing BKPerStreamLogWriter (abort=false) for 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/MANIFEST-000004:<default>:inprogress_000000000000000001 : lastDLSN = DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0} outstandingTransmits = 1 writesPendingTransmit = 0
03:34:05.792 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Stream 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/MANIFEST-000004:<default>:inprogress_000000000000000001 aborted 0 writes
03:34:05.793 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Abort ledger allocator without cleaning up on /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/MANIFEST-000004/<default>/allocation.
03:34:05.795 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Try storing max sequence number 1 in completing /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/MANIFEST-000004/<default>/ledgers/inprogress_000000000000000001.
03:34:05.795 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.distributedlog.impl.ZKLogSegmentMetadataStore - Delete segment : [LogSegmentId:18, firstTxId:99, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]
03:34:05.798 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/MANIFEST-000004 added log segment (logrecs_000000000000000001 : [LogSegmentId:18, firstTxId:99, lastTxId:99, version:VERSION_V5_SEQUENCE_ID, completionTime:1595734445795, recordCount:1, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:0, lastSlotId:0, inprogress:false, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:0]) to cache.
03:34:05.799 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogWriteHandler - Completed inprogress_000000000000000001 to logrecs_000000000000000001 for 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/MANIFEST-000004:<default> : [LogSegmentId:18, firstTxId:99, lastTxId:99, version:VERSION_V5_SEQUENCE_ID, completionTime:1595734445795, recordCount:1, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:0, lastSlotId:0, inprogress:false, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:0]
03:34:05.799 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Abort ledger allocator without cleaning up on /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/MANIFEST-000004/<default>/allocation.
03:34:05.807 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst/<default>/allocation moved version from -1 to 0.
03:34:05.809 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/OPTIONS-000008/<default>/allocation moved version from -1 to 0.
03:34:05.812 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst:<default> : []
03:34:05.813 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/OPTIONS-000008:<default> : []
03:34:05.815 [io-checkpoint-scheduler-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst:<default> : []
03:34:05.815 [io-checkpoint-scheduler-OrderedScheduler-1-0] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/OPTIONS-000008:<default> : []
03:34:05.816 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst/<default>/allocation moved to phase ALLOCATING : version = 0.
03:34:05.817 [DLM-/stream/storage-OrderedScheduler-0-0] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:34:05.818 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/OPTIONS-000008/<default>/allocation moved to phase ALLOCATING : version = 0.
03:34:05.818 [DLM-/stream/storage-OrderedScheduler-0-0] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:34:05.821 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 20
03:34:05.822 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 21
03:34:05.823 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst/<default>/allocation moved version from 0 to 1.
03:34:05.823 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst/<default>/allocation moved to phase ALLOCATED : version = 1.
03:34:05.823 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst/<default>/allocation moved to phase HANDING_OVER : version = 1.
03:34:05.823 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - No max ledger sequence number found while creating log segment 1 for 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst:<default>.
03:34:05.824 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/OPTIONS-000008/<default>/allocation moved version from 0 to 1.
03:34:05.824 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/OPTIONS-000008/<default>/allocation moved to phase ALLOCATED : version = 1.
03:34:05.825 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/OPTIONS-000008/<default>/allocation moved to phase HANDING_OVER : version = 1.
03:34:05.825 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - No max ledger sequence number found while creating log segment 1 for 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/OPTIONS-000008:<default>.
03:34:05.827 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst/<default>/allocation moved to phase HANDED_OVER : version = 1.
03:34:05.827 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst/<default>/allocation moved version from 1 to 2.
03:34:05.827 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst/<default>/allocation moved to phase ALLOCATING : version = 2.
03:34:05.827 [main-EventThread] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:34:05.828 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst added log segment (inprogress_000000000000000001 : [LogSegmentId:20, firstTxId:1051, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]) to cache.
03:34:05.828 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/OPTIONS-000008/<default>/allocation moved to phase HANDED_OVER : version = 1.
03:34:05.828 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/OPTIONS-000008/<default>/allocation moved version from 1 to 2.
03:34:05.828 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/OPTIONS-000008/<default>/allocation moved to phase ALLOCATING : version = 2.
03:34:05.828 [main-EventThread] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:34:05.830 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/OPTIONS-000008 added log segment (inprogress_000000000000000001 : [LogSegmentId:21, firstTxId:7184, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]) to cache.
03:34:05.834 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Deleting log segments older than 1595475245830 for 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst:<default> : []
03:34:05.835 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 22
03:34:05.835 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Deleting log segments older than 1595475245832 for 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/OPTIONS-000008:<default> : []
03:34:05.840 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 23
03:34:05.840 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst/<default>/allocation moved version from 2 to 3.
03:34:05.840 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst/<default>/allocation moved to phase ALLOCATED : version = 3.
03:34:05.844 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/OPTIONS-000008/<default>/allocation moved version from 2 to 3.
03:34:05.845 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/OPTIONS-000008/<default>/allocation moved to phase ALLOCATED : version = 3.
03:34:05.853 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Flushing before closing log segment 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst:<default>:inprogress_000000000000000001
03:34:05.855 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Flushing before closing log segment 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/OPTIONS-000008:<default>:inprogress_000000000000000001
03:34:05.858 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Closing BKPerStreamLogWriter (abort=false) for 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst:<default>:inprogress_000000000000000001 : lastDLSN = DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0} outstandingTransmits = 1 writesPendingTransmit = 0
03:34:05.859 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Stream 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst:<default>:inprogress_000000000000000001 aborted 0 writes
03:34:05.860 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Closing BKPerStreamLogWriter (abort=false) for 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/OPTIONS-000008:<default>:inprogress_000000000000000001 : lastDLSN = DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0} outstandingTransmits = 1 writesPendingTransmit = 0
03:34:05.860 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Stream 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/OPTIONS-000008:<default>:inprogress_000000000000000001 aborted 0 writes
03:34:05.864 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Try storing max sequence number 1 in completing /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst/<default>/ledgers/inprogress_000000000000000001.
03:34:05.865 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.distributedlog.impl.ZKLogSegmentMetadataStore - Delete segment : [LogSegmentId:20, firstTxId:1051, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]
03:34:05.867 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Try storing max sequence number 1 in completing /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/OPTIONS-000008/<default>/ledgers/inprogress_000000000000000001.
03:34:05.868 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.distributedlog.impl.ZKLogSegmentMetadataStore - Delete segment : [LogSegmentId:21, firstTxId:7184, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]
03:34:05.870 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst added log segment (logrecs_000000000000000001 : [LogSegmentId:20, firstTxId:1051, lastTxId:1051, version:VERSION_V5_SEQUENCE_ID, completionTime:1595734445864, recordCount:1, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:0, lastSlotId:0, inprogress:false, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:0]) to cache.
03:34:05.871 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogWriteHandler - Completed inprogress_000000000000000001 to logrecs_000000000000000001 for 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst:<default> : [LogSegmentId:20, firstTxId:1051, lastTxId:1051, version:VERSION_V5_SEQUENCE_ID, completionTime:1595734445864, recordCount:1, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:0, lastSlotId:0, inprogress:false, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:0]
03:34:05.871 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Abort ledger allocator without cleaning up on /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst/<default>/allocation.
03:34:05.872 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/OPTIONS-000008 added log segment (logrecs_000000000000000001 : [LogSegmentId:21, firstTxId:7184, lastTxId:7184, version:VERSION_V5_SEQUENCE_ID, completionTime:1595734445868, recordCount:1, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:0, lastSlotId:0, inprogress:false, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:0]) to cache.
03:34:05.872 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogWriteHandler - Completed inprogress_000000000000000001 to logrecs_000000000000000001 for 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/OPTIONS-000008:<default> : [LogSegmentId:21, firstTxId:7184, lastTxId:7184, version:VERSION_V5_SEQUENCE_ID, completionTime:1595734445868, recordCount:1, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:0, lastSlotId:0, inprogress:false, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:0]
03:34:05.872 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Abort ledger allocator without cleaning up on /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/OPTIONS-000008/<default>/allocation.
03:34:05.882 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/OPTIONS-000008/<default>/allocation moved version from -1 to 0.
03:34:05.885 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/CURRENT/<default>/allocation moved version from -1 to 0.
03:34:05.888 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/OPTIONS-000008:<default> : []
03:34:05.892 [io-checkpoint-scheduler-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/OPTIONS-000008:<default> : []
03:34:05.892 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/CURRENT:<default> : []
03:34:05.897 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/OPTIONS-000008/<default>/allocation moved to phase ALLOCATING : version = 0.
03:34:05.900 [io-checkpoint-scheduler-OrderedScheduler-1-0] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/CURRENT:<default> : []
03:34:05.903 [DLM-/stream/storage-OrderedScheduler-0-0] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:34:05.904 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/CURRENT/<default>/allocation moved to phase ALLOCATING : version = 0.
03:34:05.905 [DLM-/stream/storage-OrderedScheduler-0-0] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:34:05.909 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 24
03:34:05.911 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 25
03:34:05.912 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/OPTIONS-000008/<default>/allocation moved version from 0 to 1.
03:34:05.912 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/OPTIONS-000008/<default>/allocation moved to phase ALLOCATED : version = 1.
03:34:05.912 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/OPTIONS-000008/<default>/allocation moved to phase HANDING_OVER : version = 1.
03:34:05.913 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - No max ledger sequence number found while creating log segment 1 for 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/OPTIONS-000008:<default>.
03:34:05.913 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/CURRENT/<default>/allocation moved version from 0 to 1.
03:34:05.913 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/CURRENT/<default>/allocation moved to phase ALLOCATED : version = 1.
03:34:05.913 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/CURRENT/<default>/allocation moved to phase HANDING_OVER : version = 1.
03:34:05.915 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - No max ledger sequence number found while creating log segment 1 for 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/CURRENT:<default>.
03:34:05.916 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/OPTIONS-000008/<default>/allocation moved to phase HANDED_OVER : version = 1.
03:34:05.916 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/OPTIONS-000008/<default>/allocation moved version from 1 to 2.
03:34:05.916 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/OPTIONS-000008/<default>/allocation moved to phase ALLOCATING : version = 2.
03:34:05.916 [main-EventThread] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:34:05.917 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/OPTIONS-000008 added log segment (inprogress_000000000000000001 : [LogSegmentId:24, firstTxId:7184, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]) to cache.
03:34:05.917 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/CURRENT/<default>/allocation moved to phase HANDED_OVER : version = 1.
03:34:05.917 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/CURRENT/<default>/allocation moved version from 1 to 2.
03:34:05.917 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/CURRENT/<default>/allocation moved to phase ALLOCATING : version = 2.
03:34:05.917 [main-EventThread] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:34:05.918 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/CURRENT added log segment (inprogress_000000000000000001 : [LogSegmentId:25, firstTxId:16, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]) to cache.
03:34:05.923 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 26
03:34:05.923 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 27
03:34:05.926 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Deleting log segments older than 1595475245921 for 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/OPTIONS-000008:<default> : []
03:34:05.928 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/OPTIONS-000008/<default>/allocation moved version from 2 to 3.
03:34:05.928 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/OPTIONS-000008/<default>/allocation moved to phase ALLOCATED : version = 3.
03:34:05.928 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/CURRENT/<default>/allocation moved version from 2 to 3.
03:34:05.930 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/CURRENT/<default>/allocation moved to phase ALLOCATED : version = 3.
03:34:05.935 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Deleting log segments older than 1595475245927 for 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/CURRENT:<default> : []
03:34:05.957 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Flushing before closing log segment 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/OPTIONS-000008:<default>:inprogress_000000000000000001
03:34:05.960 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Flushing before closing log segment 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/CURRENT:<default>:inprogress_000000000000000001
03:34:05.964 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Closing BKPerStreamLogWriter (abort=false) for 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/OPTIONS-000008:<default>:inprogress_000000000000000001 : lastDLSN = DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0} outstandingTransmits = 1 writesPendingTransmit = 0
03:34:05.965 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Stream 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/OPTIONS-000008:<default>:inprogress_000000000000000001 aborted 0 writes
03:34:05.966 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Closing BKPerStreamLogWriter (abort=false) for 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/CURRENT:<default>:inprogress_000000000000000001 : lastDLSN = DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0} outstandingTransmits = 1 writesPendingTransmit = 0
03:34:05.966 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Stream 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/CURRENT:<default>:inprogress_000000000000000001 aborted 0 writes
03:34:05.970 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Try storing max sequence number 1 in completing /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/OPTIONS-000008/<default>/ledgers/inprogress_000000000000000001.
03:34:05.971 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.distributedlog.impl.ZKLogSegmentMetadataStore - Delete segment : [LogSegmentId:24, firstTxId:7184, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]
03:34:05.974 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Try storing max sequence number 1 in completing /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/CURRENT/<default>/ledgers/inprogress_000000000000000001.
03:34:05.975 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.distributedlog.impl.ZKLogSegmentMetadataStore - Delete segment : [LogSegmentId:25, firstTxId:16, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]
03:34:05.977 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/OPTIONS-000008 added log segment (logrecs_000000000000000001 : [LogSegmentId:24, firstTxId:7184, lastTxId:7184, version:VERSION_V5_SEQUENCE_ID, completionTime:1595734445971, recordCount:1, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:0, lastSlotId:0, inprogress:false, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:0]) to cache.
03:34:05.978 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogWriteHandler - Completed inprogress_000000000000000001 to logrecs_000000000000000001 for 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/OPTIONS-000008:<default> : [LogSegmentId:24, firstTxId:7184, lastTxId:7184, version:VERSION_V5_SEQUENCE_ID, completionTime:1595734445971, recordCount:1, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:0, lastSlotId:0, inprogress:false, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:0]
03:34:05.979 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Abort ledger allocator without cleaning up on /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/OPTIONS-000008/<default>/allocation.
03:34:05.979 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/CURRENT added log segment (logrecs_000000000000000001 : [LogSegmentId:25, firstTxId:16, lastTxId:16, version:VERSION_V5_SEQUENCE_ID, completionTime:1595734445975, recordCount:1, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:0, lastSlotId:0, inprogress:false, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:0]) to cache.
03:34:05.979 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogWriteHandler - Completed inprogress_000000000000000001 to logrecs_000000000000000001 for 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/CURRENT:<default> : [LogSegmentId:25, firstTxId:16, lastTxId:16, version:VERSION_V5_SEQUENCE_ID, completionTime:1595734445975, recordCount:1, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:0, lastSlotId:0, inprogress:false, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:0]
03:34:05.979 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Abort ledger allocator without cleaning up on /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/CURRENT/<default>/allocation.
03:34:05.989 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/CURRENT/<default>/allocation moved version from -1 to 0.
03:34:05.995 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/CURRENT:<default> : []
03:34:06.003 [io-checkpoint-scheduler-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/CURRENT:<default> : []
03:34:06.007 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/CURRENT/<default>/allocation moved to phase ALLOCATING : version = 0.
03:34:06.007 [DLM-/stream/storage-OrderedScheduler-0-0] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:34:06.013 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 28
03:34:06.015 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/CURRENT/<default>/allocation moved version from 0 to 1.
03:34:06.015 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/CURRENT/<default>/allocation moved to phase ALLOCATED : version = 1.
03:34:06.015 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/CURRENT/<default>/allocation moved to phase HANDING_OVER : version = 1.
03:34:06.016 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - No max ledger sequence number found while creating log segment 1 for 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/CURRENT:<default>.
03:34:06.018 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/metadata/<default>/allocation moved version from -1 to 0.
03:34:06.020 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/CURRENT/<default>/allocation moved to phase HANDED_OVER : version = 1.
03:34:06.020 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/CURRENT/<default>/allocation moved version from 1 to 2.
03:34:06.020 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/CURRENT/<default>/allocation moved to phase ALLOCATING : version = 2.
03:34:06.021 [main-EventThread] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:34:06.021 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/CURRENT added log segment (inprogress_000000000000000001 : [LogSegmentId:28, firstTxId:16, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]) to cache.
03:34:06.021 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/metadata:<default> : []
03:34:06.027 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Deleting log segments older than 1595475246023 for 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/CURRENT:<default> : []
03:34:06.031 [io-checkpoint-scheduler-OrderedScheduler-1-0] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/metadata:<default> : []
03:34:06.038 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/metadata/<default>/allocation moved to phase ALLOCATING : version = 0.
03:34:06.039 [DLM-/stream/storage-OrderedScheduler-0-0] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:34:06.040 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 29
03:34:06.048 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/CURRENT/<default>/allocation moved version from 2 to 3.
03:34:06.051 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/CURRENT/<default>/allocation moved to phase ALLOCATED : version = 3.
03:34:06.051 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 30
03:34:06.053 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/metadata/<default>/allocation moved version from 0 to 1.
03:34:06.053 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/metadata/<default>/allocation moved to phase ALLOCATED : version = 1.
03:34:06.053 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/metadata/<default>/allocation moved to phase HANDING_OVER : version = 1.
03:34:06.054 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - No max ledger sequence number found while creating log segment 1 for 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/metadata:<default>.
03:34:06.054 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Flushing before closing log segment 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/CURRENT:<default>:inprogress_000000000000000001
03:34:06.057 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/metadata/<default>/allocation moved to phase HANDED_OVER : version = 1.
03:34:06.058 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/metadata/<default>/allocation moved version from 1 to 2.
03:34:06.058 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/metadata/<default>/allocation moved to phase ALLOCATING : version = 2.
03:34:06.059 [main-EventThread] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:34:06.060 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Closing BKPerStreamLogWriter (abort=false) for 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/CURRENT:<default>:inprogress_000000000000000001 : lastDLSN = DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0} outstandingTransmits = 1 writesPendingTransmit = 0
03:34:06.060 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/metadata added log segment (inprogress_000000000000000001 : [LogSegmentId:30, firstTxId:59, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]) to cache.
03:34:06.061 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Stream 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/CURRENT:<default>:inprogress_000000000000000001 aborted 0 writes
03:34:06.066 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Deleting log segments older than 1595475246063 for 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/metadata:<default> : []
03:34:06.068 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Try storing max sequence number 1 in completing /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/CURRENT/<default>/ledgers/inprogress_000000000000000001.
03:34:06.069 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.distributedlog.impl.ZKLogSegmentMetadataStore - Delete segment : [LogSegmentId:28, firstTxId:16, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]
03:34:06.071 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 31
03:34:06.081 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/CURRENT added log segment (logrecs_000000000000000001 : [LogSegmentId:28, firstTxId:16, lastTxId:16, version:VERSION_V5_SEQUENCE_ID, completionTime:1595734446069, recordCount:1, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:0, lastSlotId:0, inprogress:false, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:0]) to cache.
03:34:06.081 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/metadata/<default>/allocation moved version from 2 to 3.
03:34:06.081 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/metadata/<default>/allocation moved to phase ALLOCATED : version = 3.
03:34:06.081 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogWriteHandler - Completed inprogress_000000000000000001 to logrecs_000000000000000001 for 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/CURRENT:<default> : [LogSegmentId:28, firstTxId:16, lastTxId:16, version:VERSION_V5_SEQUENCE_ID, completionTime:1595734446069, recordCount:1, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:0, lastSlotId:0, inprogress:false, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:0]
03:34:06.081 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Abort ledger allocator without cleaning up on /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/CURRENT/<default>/allocation.
03:34:06.082 [io-checkpoint-scheduler-OrderedScheduler-0-0] INFO  org.apache.bookkeeper.statelib.impl.rocksdb.checkpoint.dlog.DLCheckpointStore - Renaming 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/000009.sst to 000000000000000000/000000000000000000/000000000000000000/ssts/000009.sst
03:34:06.089 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Flushing before closing log segment 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/metadata:<default>:inprogress_000000000000000001
03:34:06.094 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Closing BKPerStreamLogWriter (abort=false) for 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/metadata:<default>:inprogress_000000000000000001 : lastDLSN = DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0} outstandingTransmits = 1 writesPendingTransmit = 0
03:34:06.095 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Stream 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/metadata:<default>:inprogress_000000000000000001 aborted 0 writes
03:34:06.104 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Try storing max sequence number 1 in completing /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/metadata/<default>/ledgers/inprogress_000000000000000001.
03:34:06.104 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.distributedlog.impl.ZKLogSegmentMetadataStore - Delete segment : [LogSegmentId:30, firstTxId:59, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]
03:34:06.138 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/metadata added log segment (logrecs_000000000000000001 : [LogSegmentId:30, firstTxId:59, lastTxId:59, version:VERSION_V5_SEQUENCE_ID, completionTime:1595734446104, recordCount:1, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:0, lastSlotId:0, inprogress:false, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:0]) to cache.
03:34:06.139 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogWriteHandler - Completed inprogress_000000000000000001 to logrecs_000000000000000001 for 000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/metadata:<default> : [LogSegmentId:30, firstTxId:59, lastTxId:59, version:VERSION_V5_SEQUENCE_ID, completionTime:1595734446104, recordCount:1, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:0, lastSlotId:0, inprogress:false, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:0]
03:34:06.139 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Abort ledger allocator without cleaning up on /stream/storage/000000000000000001/000000000000000001/000000000000000000/checkpoints/96a58ad1-e4d4-4d3e-bf4e-34ce221188e5/metadata/<default>/allocation.
03:34:06.160 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/metadata/<default>/allocation moved version from -1 to 0.
03:34:06.162 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/metadata:<default> : []
03:34:06.164 [io-checkpoint-scheduler-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogWriteHandler - Initiating Recovery For 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/metadata:<default> : []
03:34:06.166 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/metadata/<default>/allocation moved to phase ALLOCATING : version = 0.
03:34:06.166 [DLM-/stream/storage-OrderedScheduler-0-0] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:34:06.170 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 32
03:34:06.172 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/metadata/<default>/allocation moved version from 0 to 1.
03:34:06.172 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/metadata/<default>/allocation moved to phase ALLOCATED : version = 1.
03:34:06.172 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/metadata/<default>/allocation moved to phase HANDING_OVER : version = 1.
03:34:06.173 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - No max ledger sequence number found while creating log segment 1 for 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/metadata:<default>.
03:34:06.175 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/metadata/<default>/allocation moved to phase HANDED_OVER : version = 1.
03:34:06.176 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/metadata/<default>/allocation moved version from 1 to 2.
03:34:06.176 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/metadata/<default>/allocation moved to phase ALLOCATING : version = 2.
03:34:06.176 [main-EventThread] WARN  org.apache.bookkeeper.client.BookieWatcherImpl - New ensemble: [127.0.0.1:3181] is not adhering to Placement Policy. quarantinedBookies: []
03:34:06.177 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/metadata added log segment (inprogress_000000000000000001 : [LogSegmentId:32, firstTxId:71, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]) to cache.
03:34:06.182 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.bookkeeper.client.LedgerCreateOp - Ensemble: [127.0.0.1:3181] for ledger: 33
03:34:06.182 [main-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Deleting log segments older than 1595475246179 for 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/metadata:<default> : []
03:34:06.185 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator for /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/metadata/<default>/allocation moved version from 2 to 3.
03:34:06.187 [main-EventThread] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Ledger allocator /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/metadata/<default>/allocation moved to phase ALLOCATED : version = 3.
03:34:06.189 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Flushing before closing log segment 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/metadata:<default>:inprogress_000000000000000001
03:34:06.193 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Closing BKPerStreamLogWriter (abort=false) for 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/metadata:<default>:inprogress_000000000000000001 : lastDLSN = DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0} outstandingTransmits = 1 writesPendingTransmit = 0
03:34:06.193 [BookKeeperClientWorker-OrderedExecutor-0-0] INFO  org.apache.distributedlog.BKLogSegmentWriter - Stream 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/metadata:<default>:inprogress_000000000000000001 aborted 0 writes
03:34:06.197 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.distributedlog.BKLogWriteHandler - Try storing max sequence number 1 in completing /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/metadata/<default>/ledgers/inprogress_000000000000000001.
03:34:06.198 [io-write-scheduler-OrderedScheduler-0-0-EventThread] INFO  org.apache.distributedlog.impl.ZKLogSegmentMetadataStore - Delete segment : [LogSegmentId:32, firstTxId:71, lastTxId:-999, version:VERSION_V5_SEQUENCE_ID, completionTime:0, recordCount:0, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:-1, lastSlotId:-1, inprogress:true, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:-1]
03:34:06.201 [main-EventThread] INFO  org.apache.distributedlog.logsegment.PerStreamLogSegmentCache - 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/metadata added log segment (logrecs_000000000000000001 : [LogSegmentId:32, firstTxId:71, lastTxId:71, version:VERSION_V5_SEQUENCE_ID, completionTime:1595734446197, recordCount:1, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:0, lastSlotId:0, inprogress:false, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:0]) to cache.
03:34:06.202 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.BKLogWriteHandler - Completed inprogress_000000000000000001 to logrecs_000000000000000001 for 000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/metadata:<default> : [LogSegmentId:32, firstTxId:71, lastTxId:71, version:VERSION_V5_SEQUENCE_ID, completionTime:1595734446197, recordCount:1, regionId:0, status:0, logSegmentSequenceNumber:1, lastEntryId:0, lastSlotId:0, inprogress:false, minActiveDLSN:DLSN{logSegmentSequenceNo=1, entryId=0, slotId=0}, startSequenceId:0]
03:34:06.202 [DLM-/stream/storage-OrderedScheduler-0-0] INFO  org.apache.distributedlog.bk.SimpleLedgerAllocator - Abort ledger allocator without cleaning up on /stream/storage/000000000000000000/000000000000000000/000000000000000000/checkpoints/4fd47ba1-d2af-410a-9148-73302886d302/metadata/<default>/allocation.
03:34:23.593 [pulsar-web-69-7] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:34:23 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 5
03:34:53.712 [pulsar-web-69-5] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:34:53 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 40
03:35:23.600 [pulsar-web-69-4] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:35:23 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 9
03:35:53.605 [pulsar-web-69-1] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:35:53 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 11
03:36:00.459 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.14:34110
03:36:00.456 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.14:34108
03:36:00.461 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.14:34112
03:36:00.877 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.14:34114
03:36:00.882 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.14:34116
03:36:00.882 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.14:34118
03:36:00.889 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34114] Subscribing on topic persistent://sample/standalone/ns1/in / scala-sub-1
03:36:00.889 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34116] Subscribing on topic persistent://sample/standalone/ns1/models / scala-sub-2
03:36:00.892 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/in] There are no replicated subscriptions on the topic
03:36:00.892 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/models] There are no replicated subscriptions on the topic
03:36:00.893 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/in][scala-sub-1] Created new subscription for 0
03:36:00.893 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34114] Created subscription on topic persistent://sample/standalone/ns1/in / scala-sub-1
03:36:00.893 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/models][scala-sub-2] Created new subscription for 0
03:36:00.893 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34116] Created subscription on topic persistent://sample/standalone/ns1/models / scala-sub-2
03:36:00.894 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34118][persistent://sample/standalone/ns1/event-log] Creating producer. producerId=0
03:36:00.898 [Thread-13] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34118] persistent://sample/standalone/ns1/event-log configured with schema false
03:36:00.900 [Thread-13] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34118] Created new producer: Producer{topic=PersistentTopic{topic=persistent://sample/standalone/ns1/event-log}, client=/172.17.0.14:34118, producerName=standalone-0-5, producerId=0}
03:36:01.892 [pulsar-io-51-1] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [sample/standalone/ns1/persistent/in-scala-sub-1] Rewind from 10:150 to 10:150
03:36:01.892 [pulsar-io-51-2] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [sample/standalone/ns1/persistent/models-scala-sub-2] Rewind from 13:2 to 13:2
03:36:03.769 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [PersistentTopic{topic=persistent://sample/standalone/ns1/event-log}][standalone-0-5] Closing producer on cnx /172.17.0.14:34118
03:36:03.769 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [PersistentTopic{topic=persistent://sample/standalone/ns1/event-log}][standalone-0-5] Closed producer on cnx /172.17.0.14:34118
03:36:06.054 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34116] Closing consumer: 0
03:36:06.055 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.AbstractDispatcherSingleActiveConsumer - Removing consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/models, name=scala-sub-2}, consumerId=0, consumerName=3ff4a, address=/172.17.0.14:34116}
03:36:06.056 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34116] Closed consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/models, name=scala-sub-2}, consumerId=0, consumerName=3ff4a, address=/172.17.0.14:34116}
03:36:06.062 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34114] Closing consumer: 0
03:36:06.062 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.AbstractDispatcherSingleActiveConsumer - Removing consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/in, name=scala-sub-1}, consumerId=0, consumerName=543b2, address=/172.17.0.14:34114}
03:36:06.063 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34114] Closed consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/in, name=scala-sub-1}, consumerId=0, consumerName=543b2, address=/172.17.0.14:34114}
03:36:06.076 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.14:34112
03:36:06.080 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.14:34114
03:36:06.082 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.14:34110
03:36:06.082 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.14:34116
03:36:08.392 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.14:34172
03:36:08.397 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.14:34174
03:36:08.400 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.14:34170
03:36:08.982 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.14:34180
03:36:08.984 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.14:34182
03:36:08.987 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.14:34186
03:36:09.000 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34180] Subscribing on topic persistent://sample/standalone/ns1/models / scala-sub-2
03:36:09.001 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34182] Subscribing on topic persistent://sample/standalone/ns1/in / scala-sub-1
03:36:09.002 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/in] There are no replicated subscriptions on the topic
03:36:09.002 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/models] There are no replicated subscriptions on the topic
03:36:09.002 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/in][scala-sub-1] Created new subscription for 0
03:36:09.003 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34182] Created subscription on topic persistent://sample/standalone/ns1/in / scala-sub-1
03:36:09.003 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/models][scala-sub-2] Created new subscription for 0
03:36:09.003 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34180] Created subscription on topic persistent://sample/standalone/ns1/models / scala-sub-2
03:36:09.004 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34186][persistent://sample/standalone/ns1/event-log] Creating producer. producerId=0
03:36:09.007 [Thread-14] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34186] persistent://sample/standalone/ns1/event-log configured with schema false
03:36:09.010 [Thread-14] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34186] Created new producer: Producer{topic=PersistentTopic{topic=persistent://sample/standalone/ns1/event-log}, client=/172.17.0.14:34186, producerName=standalone-0-6, producerId=0}
03:36:10.002 [pulsar-io-51-1] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [sample/standalone/ns1/persistent/models-scala-sub-2] Rewind from 13:3 to 13:2
03:36:10.002 [pulsar-io-51-2] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [sample/standalone/ns1/persistent/in-scala-sub-1] Rewind from 10:194 to 10:150
03:36:10.746 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [PersistentTopic{topic=persistent://sample/standalone/ns1/event-log}][standalone-0-6] Closing producer on cnx /172.17.0.14:34186
03:36:10.747 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [PersistentTopic{topic=persistent://sample/standalone/ns1/event-log}][standalone-0-6] Closed producer on cnx /172.17.0.14:34186
03:36:13.006 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34180] Closing consumer: 0
03:36:13.006 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.AbstractDispatcherSingleActiveConsumer - Removing consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/models, name=scala-sub-2}, consumerId=0, consumerName=cc730, address=/172.17.0.14:34180}
03:36:13.007 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34180] Closed consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/models, name=scala-sub-2}, consumerId=0, consumerName=cc730, address=/172.17.0.14:34180}
03:36:13.008 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34182] Closing consumer: 0
03:36:13.008 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.AbstractDispatcherSingleActiveConsumer - Removing consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/in, name=scala-sub-1}, consumerId=0, consumerName=b5daf, address=/172.17.0.14:34182}
03:36:13.010 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34182] Closed consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/in, name=scala-sub-1}, consumerId=0, consumerName=b5daf, address=/172.17.0.14:34182}
03:36:13.020 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.14:34172
03:36:13.020 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.14:34174
03:36:13.020 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.14:34180
03:36:13.020 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.14:34182
03:36:17.188 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.14:34252
03:36:17.532 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.14:34254
03:36:17.536 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34254][persistent://sample/standalone/ns1/event-log] Creating producer. producerId=0
03:36:17.538 [Thread-15] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34254] persistent://sample/standalone/ns1/event-log configured with schema false
03:36:17.538 [Thread-15] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34254] Created new producer: Producer{topic=PersistentTopic{topic=persistent://sample/standalone/ns1/event-log}, client=/172.17.0.14:34254, producerName=standalone-0-7, producerId=0}
03:36:17.932 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [PersistentTopic{topic=persistent://sample/standalone/ns1/event-log}][standalone-0-7] Closing producer on cnx /172.17.0.14:34254
03:36:17.932 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [PersistentTopic{topic=persistent://sample/standalone/ns1/event-log}][standalone-0-7] Closed producer on cnx /172.17.0.14:34254
03:36:23.594 [pulsar-web-69-7] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:36:23 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 5
03:36:30.356 [pulsar-io-51-2] WARN  org.apache.pulsar.common.protocol.PulsarHandler - [[id: 0xc2bae1c0, L:/172.17.0.12:6650 - R:/172.17.0.15:48706]] Forcing connection to close after keep-alive timeout
03:36:30.358 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.15:48706
03:36:30.458 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.14:34108
03:36:30.651 [pulsar-io-51-2] WARN  org.apache.pulsar.common.protocol.PulsarHandler - [[id: 0x15feeee7, L:/172.17.0.12:6650 - R:/172.17.0.15:48714]] Forcing connection to close after keep-alive timeout
03:36:30.652 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.15:48714
03:36:30.885 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.14:34118
03:36:34.641 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.14:34378
03:36:34.851 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - New connection from /172.17.0.14:34380
03:36:34.855 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34380] Subscribing on topic persistent://sample/standalone/ns1/models / scala-sub-2
03:36:34.857 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/models] There are no replicated subscriptions on the topic
03:36:34.857 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.persistent.PersistentTopic - [persistent://sample/standalone/ns1/models][scala-sub-2] Created new subscription for 0
03:36:34.857 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34380] Created subscription on topic persistent://sample/standalone/ns1/models / scala-sub-2
03:36:35.251 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34380] Closing consumer: 0
03:36:35.251 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.AbstractDispatcherSingleActiveConsumer - Removing consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/models, name=scala-sub-2}, consumerId=0, consumerName=1007d, address=/172.17.0.14:34380}
03:36:35.252 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34380] Closed consumer Consumer{subscription=PersistentSubscription{topic=persistent://sample/standalone/ns1/models, name=scala-sub-2}, consumerId=0, consumerName=1007d, address=/172.17.0.14:34380}
03:36:35.857 [pulsar-io-51-1] INFO  org.apache.bookkeeper.mledger.impl.ManagedCursorImpl - [sample/standalone/ns1/persistent/models-scala-sub-2] Rewind from 13:3 to 13:2
03:36:38.402 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.14:34170
03:36:39.135 [pulsar-io-51-2] WARN  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34186] Got exception io.netty.channel.unix.Errors$NativeIoException: readAddress(..) failed: Connection reset by peer
03:36:39.136 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.14:34186
03:36:47.262 [pulsar-io-51-1] WARN  org.apache.pulsar.broker.service.ServerCnx - [/172.17.0.14:34252] Got exception io.netty.channel.unix.Errors$NativeIoException: readAddress(..) failed: Connection reset by peer
03:36:47.263 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.14:34252
03:36:47.589 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.14:34254
03:36:53.597 [pulsar-web-69-6] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:36:53 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 6
03:37:05.680 [pulsar-io-51-1] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.14:34378
03:37:05.681 [pulsar-io-51-2] INFO  org.apache.pulsar.broker.service.ServerCnx - Closed connection from /172.17.0.14:34380
03:37:23.601 [pulsar-web-69-8] INFO  org.eclipse.jetty.server.RequestLog - 127.0.0.1 - - [26/Jul/2020:03:37:23 +0000] "GET /admin/v2/persistent/public/functions/coordinate/stats?getPreciseBacklog=false HTTP/1.1" 200 1277 "-" "Pulsar-Java-v2.6.0" 9
