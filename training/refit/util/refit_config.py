import os


class RefitConfig():
    def __init__(self):
        self.minio_host = os.environ['MINIO_HOST'].replace('http://', '')
        self.minio_access_key = os.environ['MINIO_ACCESS_KEY']
        self.minio_secret_key = os.environ['MINIO_SECRET_KEY']
        self.minio_bucket_import = os.environ['MINIO_BUCKET_IMPORT']
        self.minio_bucket_models = os.environ['MINIO_BUCKET_MODELS']
        self.minio_bucket_schema = os.environ['MINIO_BUCKET_SCHEMA']
        self.integrations_host = os.environ['INTEGRATIONS_HOST']


