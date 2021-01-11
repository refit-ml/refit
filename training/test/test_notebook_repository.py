from datetime import datetime

import pytest
from refit.repository.notebook_repository import NotebookRepository

notebook_repository = NotebookRepository("localhost", 3000)


@pytest.mark.skipif(True, reason="Requires integrations API running")
def test_get_project():
    project_guid = "b6ee5bab-08dd-49b0-98b6-45cd0a28b12f"
    project = notebook_repository.get_schema(project_guid)
    assert project is not None
    assert project['projectGuid'] == project_guid


@pytest.mark.skipif(True, reason="Requires integrations API running")
def test_get_sensor_data():
    project_guid = "b6ee5bab-08dd-49b0-98b6-45cd0a28b12f"
    start = datetime(2020, 6, 27)
    end = datetime(2020, 7, 28)
    sensors = ['8623']
    sensor_data = notebook_repository.sensor_data(project_guid, start, end, sensors)
    assert sensor_data is not None
    assert len(sensor_data) > 0


@pytest.mark.skipif(True, reason="Requires integrations API running")
def test_get_schema():
    project_guid = "b6ee5bab-08dd-49b0-98b6-45cd0a28b12f"
    schema = notebook_repository.get_schema(project_guid)
    assert schema is not None
    assert schema.name == "Demo"
    assert schema.project_guid == project_guid
    assert schema.partition_scheme == "HOUR"
