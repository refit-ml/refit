import json
from datetime import datetime
from typing import List

import requests

from refit.util.schema import Schema


class NotebookRepository:
    def __init__(self, host=None, port=None):
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
        response = requests.get(self.url(path), headers=headers)
        return response.json()

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

    #direct data import with no minio
    # the filepath in this case is the actual single line data
    def stream_sensor_data(self,
                           project_guid: str,
                           data: str):
        url = self.url(f"project/{project_guid}/data")
        payload = json.dumps({
            "filePath": data,
            "deleteWhenComplete": True
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
