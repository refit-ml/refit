from datetime import datetime, timedelta



class ImportOptions:
    def __init__(self, yaml: dict):
        self.includes_header = yaml['includesHeader']


class Field:
    def __init__(self, yaml: dict):
        self.name = yaml['name']
        self.type = yaml['type']
        self.classification = yaml['classification']


class Schema:
    def __init__(self, project: dict):
        schema: dict = project['schema']
        self.name = project['name']
        self.project_guid = project['projectGuid']
        self.org_guid = project['orgGuid']

        self.partition_scheme = schema['partitionScheme']
        self.import_options = ImportOptions(schema['importOptions'])
        self.feature_type = schema['featureType']
        self.fields = [Field(x) for x in schema['fields']]

    def __repr__(self) -> str:
        return "name:%s guid:%s" % (self.name, self.project_guid)

    def prediction_label(self) -> str:
        results = list(filter(lambda x: x.classification == "Label", self.fields))
        return results[0].name.lower()

    def get_partition_key(self, date: datetime) -> str:
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

    def get_doubles(self):
        return [x.name.lower() for x in self.fields if x.type == 'Double']

    def get_strings(self):
        return [x.name.lower() for x in self.fields if x.type == 'String']

    def get_integers(self):
        return [x.name.lower() for x in self.fields if x.type == 'Integer']

