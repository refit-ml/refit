import string
import uuid
from datetime import datetime

import onnxmltools

from enums.ModelFormat import ModelFormat
from enums.SerializationFormat import SerializationFormat
from util import ModelFactory
from util.Schema import SchemaFactory
from dao.TrainingDao import TrainingDao


class Refit():
    def __init__(self, project_guid: string):
        self.project_guid = project_guid
        self.training_dao = TrainingDao()
        self.schemaFactory = SchemaFactory(self.training_dao)
        self.schema = self.schemaFactory.getSchema(project_guid)

    def get_sensor_data(self, start: datetime, end: datetime, sensors: list = None):
        partitions = self.schema.get_partitions_in_range(start, end)
        return self.training_dao.get_sensor_data(self.project_guid, partitions, sensors)

    def get_training_windows(self, start: datetime, end: datetime, sensors: list = None):
        partitions = self.schema.get_partitions_in_range(start, end)
        return self.training_dao.get_training_data(self.project_guid, partitions, sensors)

    def save(self,
             model,
             model_format: ModelFormat = ModelFormat.KERAS,
             serialization_format: SerializationFormat = SerializationFormat.ONNX):
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
