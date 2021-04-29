import json
from datetime import datetime
from typing import List

import requests
import time
from refit.util.schema import Schema


from refit.util.refit_config import RefitConfig

class NotebookRepository:
    def __init__(self,
                 host=None,
                 port=None,
                 config: RefitConfig = None,
                 file_repository=None):
        self._import_bucket = config.minio_bucket_import
        self.file_repository = file_repository
        self.host = host or "localhost"
        self.port = port or 3000

    def url(self, path) -> str:
        return f"http://{self.host}:{self.port}/notebook/{path}"

    def get_schema(self, project_guid: str) -> Schema:
        path = f"project/{project_guid}"
        response = requests.get(self.url(path))
        project_dict = response.json()
        schema = Schema(project_dict)
        return schema

    def sensor_data(self,
                    project_guid: str,
                    start: datetime,
                    end: datetime,
                    sensors: List[str]) -> List[dict]:

        start = start.strftime("%Y-%m-%d %H:%M:%S")
        end = end.strftime("%Y-%m-%d %H:%M:%S")
        headers = dict()

        if len(sensors) > 0:
            headers['sensors'] = ",".join(sensors)

        path = f"project/{project_guid}/sensor-data?from={start}&to={end}"
        transaction_id = requests.get(self.url(path), headers=headers)

        data_available = self.__check_data_upload(project_guid, transaction_id)

        if data_available:
            response = self.__download_data(transaction_id)
        else:
            response = 'Error' #Change error output

        return response

    def __check_data_upload(self,
                            project_guid: str,
                            transactionID: str):

        path = f"project/{project_guid}/transactionID/{transactionID}"
        available = False

        for i in range(0, 1000):
            available = requests.get(self.url(path))
            if available:
                return available
            time.sleep(3)

        return available

    def __download_data(self,
                        transaction_id : str):

        bucket_name = self._import_bucket
        object_name = f"{transaction_id}.json"

        file = self.file_repository.download_file(bucket_name, object_name)
        return file


    def training_window(self,
                        project_guid: str,
                        start: datetime,
                        end: datetime,
                        sensors: List[str]) -> List[dict]:
        start = start.strftime("%Y-%m-%d %H:%M:%S")
        end = end.strftime("%Y-%m-%d %H:%M:%S")
        headers = dict()

        if len(sensors) > 0:
            headers['sensors'] = ",".join(sensors)

        path = f"project/{project_guid}/training-window?from={start}&to={end}"
        response = requests.get(self.url(path), headers=headers)
        return response.json()

    def create_project(self, path: str) -> dict:
        url = self.url("project")
        payload = json.dumps({
            "path": path
        })
        response = requests.post(url, payload)
        return response.json()

    def publish_model(self,
                      project_guid: str,
                      model_guid: str,
                      path: str,
                      input_fields: List[str]):
        url = self.url(f"project/{project_guid}/model")
        payload = json.dumps({
            "modelGuid": model_guid,
            "path": path,
            "inputFields": input_fields
        })
        response = requests.put(url, payload)
        status_code = response.status_code

        if status_code == 200:
            return "Model Published"
        else:
            return response.text

    def import_sensor_data(self,
                           project_guid: str,
                           path: str,
                           delete_when_complete: bool):
        url = self.url(f"project/{project_guid}/import")
        payload = json.dumps({
            "filePath": path,
            "deleteWhenComplete": delete_when_complete
        })
        response = requests.put(url, payload)
        return response.text

    def import_training_window(self,
                               project_guid: str,
                               path: str,
                               delete_when_complete: bool):
        url = self.url(f"project/{project_guid}/import/training-window")
        payload = json.dumps({
            "filePath": path,
            "deleteWhenComplete": delete_when_complete
        })
        response = requests.put(url, payload)
        return response.text

    def import_static_data(self,
                           project_guid: str,
                           name: str,
                           path: str,
                           delete_when_complete: bool):
        url = self.url(f"project/{project_guid}/import/{name}")
        payload = json.dumps({
            "filePath": path,
            "deleteWhenComplete": delete_when_complete
        })
        response = requests.put(url, payload)
        return response.text
