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

    def save_model(self,
                   project_guid: str,
                   model_guid: str):
        url = self.url(f"notebook/project/{project_guid}/model/{model_guid}")
        response = requests.put(url)
        return response.json()
