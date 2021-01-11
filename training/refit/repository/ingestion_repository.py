import json
from typing import List

import requests


class IngestionRepository:
    def __init__(self, host=None, port=None):
        self.host = host or "localhost"
        self.port = port or 3030

    def url(self, path) -> str:
        return f"http://{self.host}:{self.port}/{path}"

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
        payload = json.dumps({
            "projectGuid": project_guid,
            "modelGuid": model_guid,
            "path": path,
            "inputFields": input_fields
        })
        url = self.url("models")
        requests.post(url, payload)

    def import_file(self,
                    project_guid: str,
                    path: str,
                    delete_when_complete: bool,
                    import_type: str = 'sensor_data'):
        url = self.url("import")
        payload = json.dumps({
            "projectGuid": project_guid,
            "filePath": path,
            "deleteWhenComplete": delete_when_complete,
            "importType": import_type
        })
        response = requests.post(url, payload)
        return response.text
