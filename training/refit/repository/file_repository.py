from minio import Minio
from minio.error import BucketAlreadyOwnedByYou, BucketAlreadyExists, ResponseError

from refit.util.refit_config import RefitConfig


class FileRepository:
    def __init__(self, config: RefitConfig):
        self._minio = Minio(
            endpoint=config.minio_host,
            access_key=config.minio_access_key,
            secret_key=config.minio_secret_key,
            secure=False
        )

    def upload_file(self, bucket_name: str, object_name: str, file_path: str):
        try:
            self._minio.make_bucket(bucket_name, location="us-east-1")
        except BucketAlreadyOwnedByYou as err:
            pass
        except BucketAlreadyExists as err:
            pass
        except ResponseError as err:
            raise

        try:
            self._minio.fput_object(bucket_name, object_name, file_path)
        except ResponseError as err:
            print("Error putting file")
            print(err)
        return True
