import os

env_constants = {
    "cassandra": {
        "host": "CASSANDRA_HOST",
        "port": "CASSANDRA_PORT",
        "user": "CASSANDRA_USER",
        "password": "CASSANDRA_PASSWORD",
        "keyspace": "CASSANDRA_KEYSPACE"
    },
    "minio": {
        "host": "MINIO_HOST",
        "access_key": "MINIO_ACCESS_KEY",
        "secret_key": "MINIO_SECRET_KEY",
        "buckets": {
            "import": "MINIO_BUCKET_IMPORT",
            "models": "MINIO_BUCKET_MODELS"
        }
    },
    "encryption_key": "ENCRYPTION_KEY"
}


class RefitConfig():
    def __init__(self):
        self.cassandra_host = os.environ['CASSANDRA_HOST']
        self.cassandra_port = os.environ['CASSANDRA_PORT']
        self.cassandra_user = os.environ['CASSANDRA_USER']
        self.cassandra_password = os.environ['CASSANDRA_PASSWORD']
        self.cassandra_keyspace = os.environ['CASSANDRA_KEYSPACE']
        self.minio_host = os.environ['MINIO_HOST']
        self.minio_access_key = os.environ['MINIO_ACCESS_KEY']
        self.minio_secret_key = os.environ['MINIO_SECRET_KEY']
        self.minio_bucket_import = os.environ['MINIO_BUCKET_IMPORT']
        self.minio_bucket_models = os.environ['MINIO_BUCKET_MODELS']
        self.minio_bucket_schema = os.environ['MINIO_BUCKET_SCHEMA']
        self.encryption_key = os.environ['ENCRYPTION_KEY']
        self.ingestion_host = os.environ['INGESTION_HOST']
