import string
from datetime import datetime, timedelta

import yaml

from dao.TrainingDao import TrainingDao


class ImportOptions:
    def __init__(self, yaml: dict):
        self.includes_header = yaml['includesHeader']


class Field:
    def __init__(self, yaml: dict):
        self.name = yaml['name']
        self.type = yaml['type']
        self.classification = yaml['classification']


class Schema:
    def __init__(self, schema_yaml: string):
        dict = yaml.load(schema_yaml)
        self.name = dict['name']
        self.project_guid = dict['projectGuid']
        self.partition_scheme = dict['partitionScheme']
        self.import_options = ImportOptions(dict['importOptions'])
        self.feature_type = dict['featureType']
        self.fields = list(map(lambda x: Field(x), dict['fields']))
        self.org_guid = dict['orgGuid']

    def __repr__(self) -> string:
        return "name:%s guid:%s" % (self.name, self.project_guid)

    def prediction_label(self) -> string:
        results = list(filter(lambda x: x.classification == "Label", self.fields))
        return results[0].name.lower()

    def get_partition_key(self, date: datetime) -> string:
        if self.partition_scheme == "DAY":
            return date.strftime("%Y-%m-%d")
        elif self.partition_scheme == "HOUR":
            return date.strftime("%Y-%m-%d %H")
        elif self.partition_scheme == "MINUTE":
            return date.strftime("%Y-%m-%d %H:%M")
        else:
            return date.strftime("%Y-%m-%d")

    def get_next_partition(self, date: datetime) -> datetime:
        if self.partition_scheme == "DAY":
            return date + timedelta(days=1)
        elif self.partition_scheme == "HOUR":
            return date + timedelta(hours=1)
        elif self.partition_scheme == "MINUTE":
            return date + timedelta(minutes=1)
        else:
            return date + timedelta(days=1)

    def get_partitions_in_range(self, start: datetime, end: datetime) -> list:
        cursor = start
        partitions = []
        while cursor <= end:
            partitions.append(self.get_partition_key(cursor))
            cursor = self.get_next_partition(cursor)
        return partitions


class SchemaFactory:
    def __init__(self, dao: TrainingDao):
        self.dao = dao

    def getSchema(self, project_guid: string) -> Schema:
        (schema_yaml, org_guid) = self.dao.get_schema(project_guid)
        return Schema(schema_yaml)
