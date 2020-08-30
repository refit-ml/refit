import yaml

from Helpers import get_schema


class ImportOptions:
    def __init__(self, dict):
        self.includes_header = dict['includesHeader']


class Field:
    def __init__(self, dict):
        self.name = dict['name']
        self.type = dict['type']
        self.classification = dict['classification']


class Schema:
    def __init__(self, projectGuid):
        schemaYaml = get_schema(projectGuid)
        dict = yaml.load(schemaYaml)
        self.name = dict['name']
        self.project_guid = dict['projectGuid']
        self.partition_scheme = dict['partitionScheme']
        self.import_options = ImportOptions(dict['importOptions'])
        self.feature_type = dict['featureType']
        self.fields = list(map(lambda x: Field(x), dict['fields']))

    def __repr__(self):
        return "name:%s guid:%s" % (self.name, self.project_guid)

    def prediction_label(self):
        results = list(filter(lambda x: x.classification == "Label", self.fields))
        return results[0].name.lower()
