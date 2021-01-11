import uuid
from datetime import datetime
from typing import List

import onnxmltools
import pandas as pd
from pandas import DataFrame

from refit.enums.model_format import ModelFormat
from refit.flink import submit
from refit.flink.refit_feature_extractor import RefitFeatureExtractor
from refit.repository.file_repository import FileRepository
from refit.repository.ingestion_repository import IngestionRepository
from refit.repository.notebook_repository import NotebookRepository
from refit.util import model_factory
from refit.util.dataframe_helpers import extract_flag
from refit.util.refit_config import RefitConfig


def submit_job(feature_extractor=None):
    submit.clear_jobs()
    submit.submit_python(feature_extractor)


class Refit():
    def __init__(self,
                 project_guid: str,
                 config: RefitConfig = None,
                 notebook_repository: NotebookRepository = None,
                 ingestion_repository: IngestionRepository = None,
                 file_repository: FileRepository = None):

        config = RefitConfig() if config is None else config
        self._import_bucket = config.minio_bucket_import
        self._model_bucket = config.minio_bucket_models
        self._schema_bucket = config.minio_bucket_schema
        self.project_guid = project_guid
        self.notebook_repository = NotebookRepository(
            config.integrations_host) if notebook_repository is None else notebook_repository
        self.ingestion_repository = IngestionRepository(
            config.ingestion_host) if ingestion_repository is None else ingestion_repository

        self.file_repository = FileRepository(config) if file_repository is None else file_repository

        self.schema = self.notebook_repository.get_schema(project_guid)

    @staticmethod
    def of(project_guid: str):
        return Refit(project_guid)

    def sensor_data(self,
                    start: datetime,
                    end: datetime,
                    sensors: list = None,
                    feature_extractor: RefitFeatureExtractor = None,
                    include_flag: bool = False,
                    flag_name: str = 'operable') -> DataFrame:
        sensor_data_dicts = self.notebook_repository.sensor_data(
            project_guid=self.project_guid,
            start=start,
            end=end,
            sensors=sensors
        )

        df = pd.DataFrame(sensor_data_dicts)

        if include_flag:
            training_window_dicts = self.notebook_repository.training_window(
                project_guid=self.project_guid,
                start=start,
                end=end,
                sensors=sensors
            )

            if len(training_window_dicts):
                training_window_df = pd.DataFrame(training_window_dicts)
                df = extract_flag(df, training_window_df, flag_name)

        if feature_extractor is not None:
            df = pd.merge(df, feature_extractor.extract_doubles(df))
            df = pd.merge(df, feature_extractor.extract_strings(df))
            df = pd.merge(df, feature_extractor.extract_integers(df))
            df = pd.merge(df, feature_extractor.extract_labels(df))

        return df

    def save(self,
             model,
             input_fields: List[str],
             model_format: ModelFormat = ModelFormat.KERAS,
             initial_types: list = None) -> str:
        model_guid = str(uuid.uuid4())
        file_name = f"models/{model_guid}.onnx"
        onnx_model = model_factory.get_onnx_model(model_format, model, initial_types=initial_types)
        onnxmltools.utils.save_model(onnx_model, file_name)
        path = f"{self.project_guid}/models/{model_guid}/model.onnx"

        self.file_repository.upload_file(self._model_bucket, path, file_name)
        self.notebook_repository.save_model(self.project_guid, model_guid)
        self.ingestion_repository.publish_model(self.project_guid, model_guid, path, input_fields)
        return "Model Published"

    def __get_file_path(self, object_name: str):
        return f"import/{self.project_guid}/{object_name}"

    def import_file(self,
                    file_path: str,
                    object_name: str,
                    delete_when_complete: bool = True, ) -> str:
        path = self.__get_file_path(object_name)
        if not self.file_repository.upload_file(self._import_bucket, path, file_path):
            raise Exception("Error Uploading file to bucket")

        return self.ingestion_repository.import_file(self.project_guid, path, delete_when_complete)

    def import_training_window(self, file_path: str, object_name: str, delete_when_complete: bool = True):
        path = self.__get_file_path(object_name)
        if not self.file_repository.upload_file(self._import_bucket, path, file_path):
            raise Exception("Error Uploading file to bucket")

        return self.ingestion_repository.import_file(
            project_guid=self.project_guid,
            path=path,
            delete_when_complete=delete_when_complete,
            import_type='training_window'
        )


def create_project(file_path: str, project_guid: str = None) -> dict:
    if project_guid is None:
        project_guid = str(uuid.uuid4())

    config = RefitConfig()
    file_repository = FileRepository(config)
    ingestion_repository = IngestionRepository(config.ingestion_host)

    path = f"schemas/{project_guid}/schema.yaml"

    if not file_repository.upload_file(config.minio_bucket_schema, path, file_path):
        raise Exception("Error Uploading file to bucket")

    return ingestion_repository.create_project(path)
