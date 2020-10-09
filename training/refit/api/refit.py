import json
import string
import uuid
from datetime import datetime

import onnxmltools
import requests
from minio import Minio
from minio.error import BucketAlreadyOwnedByYou, BucketAlreadyExists, ResponseError
from pandas import DataFrame

from refit.enums.ModelFormat import ModelFormat
from refit.util import ModelFactory
from ..util.DataFrameHelpers import extract_timestamps, extract_flag
from ..util.RefitConfig import RefitConfig
from ..util.Schema import SchemaFactory
from refit.dao.TrainingDao import TrainingDao

refit_config = RefitConfig()

import_bucket = refit_config.minio_bucket_import
model_bucket = refit_config.minio_bucket_models
schema_bucket = refit_config.minio_bucket_schema

minio_host = refit_config.minio_host
minio_access_key = refit_config.minio_access_key
minio_secret_key = refit_config.minio_secret_key


def upload_file(bucket_name: string, object_name: string, file_path: string):
    client = Minio(minio_host,
                   access_key=minio_access_key,
                   secret_key=minio_secret_key,
                   secure=False)

    try:
        client.make_bucket(bucket_name, location="us-east-1")
    except BucketAlreadyOwnedByYou as err:
        pass
    except BucketAlreadyExists as err:
        pass
    except ResponseError as err:
        raise

    try:
        client.fput_object(bucket_name, object_name, file_path)
    except ResponseError as err:
        print("Error putting file")
        print(err)
    return True


class Refit():
    def __init__(self, project_guid: string):
        self.project_guid = project_guid
        self.training_dao = TrainingDao()
        self.schemaFactory = SchemaFactory(self.training_dao)
        self.schema = self.schemaFactory.getSchema(project_guid)

    def get_sensor_data(self, start: datetime, end: datetime, sensors: list = None) -> DataFrame:
        partitions = self.schema.get_partitions_in_range(start, end)
        df = self.training_dao.get_sensor_data(self.project_guid, partitions, sensors)
        df = extract_timestamps(df, ['timestamp'])
        return df.drop(['data', 'prediction'], axis=1)

    def get_training_windows(self, start: datetime, end: datetime, sensors: list = None) -> DataFrame:
        partitions = self.schema.get_partitions_in_range(start, end)
        df = self.training_dao.get_training_data(self.project_guid, partitions, sensors)
        df = extract_timestamps(df, ['start', 'end'])
        return df

    def sensor_data_with_flag(self, start: datetime, end: datetime, sensors: list = None,
                              flag_name: string = 'operable') -> DataFrame:
        partitions = self.schema.get_partitions_in_range(start, end)
        sensor_data = self.training_dao.get_sensor_data(self.project_guid, partitions, sensors).drop(
            ['data', 'prediction'], axis=1)
        training_window = self.training_dao.get_training_data(self.project_guid, partitions, sensors)
        return extract_flag(sensor_data, training_window, flag_name)

    def save(self,
             model,
             model_format: ModelFormat = ModelFormat.KERAS,
             initial_types: list = None) -> string:
        model_guid = str(uuid.uuid4())
        file_name = f"models/{model_guid}.onnx"
        onnx_model = ModelFactory.get_onnx_model(model_format, model, initial_types=initial_types)
        onnxmltools.utils.save_model(onnx_model, file_name)
        path = f"{self.project_guid}/models/{model_guid}/model.onnx"
        upload_file(model_bucket, path, file_name)
        self.training_dao.save_model(self.schema, model_guid)
        payload = json.dumps({
            "projectGuid": self.project_guid,
            "modelGuid": model_guid,
            "path": path
        })
        url = f"http://{refit_config.ingestion_host}:3030/models"
        requests.post(url, payload)
        return "Model Published"

    def __get_file_path(self, object_name: string):
        return f"import/{self.project_guid}/{object_name}"

    def import_file(self, file_path: string, object_name: string, delete_when_complete: bool = True) -> str:
        path = self.__get_file_path(object_name)
        if not upload_file(import_bucket, path, file_path):
            raise Exception("Error Uploading file to bucket")
        url = f"http://{refit_config.ingestion_host}:3030/import"
        payload = json.dumps({
            "projectGuid": self.project_guid,
            "filePath": path,
            "deleteWhenComplete": delete_when_complete,
            "importType": "sensor_data"
        })
        response = requests.post(url, payload)
        return response.text

    def import_training_window(self, file_path: string, object_name: string, delete_when_complete: bool = True):
        path = self.__get_file_path(object_name)
        if not upload_file(import_bucket, path, file_path):
            raise Exception("Error Uploading file to bucket")
        url = f"http://{refit_config.ingestion_host}:3030/import"
        payload = json.dumps({
            "projectGuid": self.project_guid,
            "filePath": path,
            "deleteWhenComplete": delete_when_complete,
            "importType": "training_window"
        })
        response = requests.post(url, payload)
        return response.text


def create_project(file_path: string, project_guid: string = None):
    if project_guid is None:
        project_guid = str(uuid.uuid4())

    path = f"schemas/{project_guid}/schema.yaml"

    if not upload_file(schema_bucket, path, file_path):
        raise Exception("Error Uploading file to bucket")

    url = f"http://{refit_config.ingestion_host}:3030/project"
    payload = json.dumps({
        "path": path
    })
    response = requests.post(url, payload)
    return response.text