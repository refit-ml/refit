package edu.cdl.iot.common.constants

object EnvConstants {
  val KAFKA_HOST = "KAFKA_HOST"
  val DATA_TOPIC = "KAFKA_DATA_TOPIC"
  val MODEL_PUBLISHED_TOPIC = "KAFKA_MODEL_PUBLISHED_TOPIC"
  val MODEL_DEPLOYED_TOPIC = "KAFKA_MODEL_DEPLOYED_TOPIC"
  val PREDICTIONS_TOPIC = "KAFKA_PREDICTIONS_TOPIC"
  val IMPORT_TOPIC = "KAFKA_IMPORT_TOPIC"
  val TRAINING_WINDOW_IMPORT_TOPIC = "KAFKA_TRAINING_WINDOW_IMPORT_TOPIC"
  val STATIC_DATA_IMPORT_TOPIC = "KAFKA_STATIC_DATA_IMPORT_TOPIC"
  val RAW_SENSOR_DATA_TOPIC = "KAFKA_RAW_SENSOR_DATA_TOPIC"
  val SENSOR_DATA_TOPIC = "KAFKA_SENSOR_DATA_TOPIC"
  val TRAINING_JOB_SCHEDULED_TOPIC = "KAFKA_TRAINING_JOB_SCHEDULED"
  val CASSANDRA_KEYSPACE = "CASSANDRA_KEYSPACE"
  val CASSANDRA_HOST = "CASSANDRA_HOST"
  val CASSANDRA_PORT = "CASSANDRA_PORT"
  val CASSANDRA_USER = "CASSANDRA_USER"
  val CASSANDRA_PASSWORD = "CASSANDRA_PASSWORD"
  val ENCRYPTION_KEY = "ENCRYPTION_KEY"
  val PROJECT = "PROJECT"
  val DEMO = "REFIT_DEMO"
  val MINIO_HOST = "MINIO_HOST"
  val MINIO_ACCESS_KEY = "MINIO_ACCESS_KEY"
  val MINIO_SECRET_KEY = "MINIO_SECRET_KEY"
  val MINIO_BUCKET_IMPORT = "MINIO_BUCKET_IMPORT"
  val MINIO_BUCKET_MODELS = "MINIO_BUCKET_MODELS"
  val MINIO_BUCKET_SCHEMA = "MINIO_BUCKET_SCHEMA"

  val POSTGRES_HOST = "POSTGRES_HOST"
  val POSTGRES_USERNAME = "POSTGRES_USERNAME"
  val POSTGRES_PASSWORD = "POSTGRES_PASSWORD"
  val POSTGRES_SCHEMA = "POSTGRES_SCHEMA"
  val POSTGRES_PORT = "POSTGRES_PORT"
}

