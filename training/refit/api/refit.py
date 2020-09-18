import string
import uuid
from datetime import datetime

import onnxmltools
from minio import Minio
from minio.error import BucketAlreadyOwnedByYou, BucketAlreadyExists, ResponseError
from pandas import DataFrame

from refit.enums.ModelFormat import ModelFormat
from refit.enums.SerializationFormat import SerializationFormat
from refit.util import ModelFactory
from ..util.DataFrameHelpers import extract_timestamps, extract_flag
from ..util.Schema import SchemaFactory
from refit.dao.TrainingDao import TrainingDao

bucket_name = "raw-import"
minio_host = "127.0.0.1:9000"
minio_access_key = "minio"
minio_secret_key = "minio123"


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
             serialization_format: SerializationFormat = SerializationFormat.ONNX) -> bytearray:
        model_guid = str(uuid.uuid4())
        file_name = f"models/{model_guid}.onnx"
        onnx_model = ModelFactory.get_onnx_model(model_format, model)
        onnxmltools.utils.save_model(onnx_model, file_name)
        in_file = open(file_name, "rb")
        model_bytes = bytearray(in_file.read())
        in_file.close()
        # TODO: Move this to save to minio
        self.training_dao.save_model(self.schema, model_guid, model_bytes, model_format)
        return model_bytes

    def import_file(self, file_path: string, object_name: string) -> bool:
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
            client.fput_object(bucket_name, f"import/{self.project_guid}/{object_name}", file_path)
        except ResponseError as err:
            print("Error putting file")
            print(err)
        return True
