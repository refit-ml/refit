import string

import pandas as pd
from cassandra.auth import PlainTextAuthProvider
from cassandra.cluster import Cluster
from pandas import DataFrame

from ..util.EncryptionHelper import EncryptionHelper, EncryptionMode

encryption_key = "keyboard_cat"


def __get_keys(row, index):
    return [] if row[index] is None else list(row[index].keys())


def __get_values(row, index):
    return [] if row[index] is None else list(dict(row[index]).values())


def __extend_row(row, data_index, prediction_index, encryption_helper):
    result = list(row)
    data_values = list(map(lambda x: encryption_helper.transform(x), __get_values(row, data_index)))
    prediction_values = list(map(lambda x: encryption_helper.transform(x), __get_values(row, prediction_index)))
    result.extend(data_values)
    result.extend(prediction_values)
    result.pop(max(data_index, prediction_index))
    result.pop(min(data_index, prediction_index))
    return result


def __create_column_definition(rows, column_names, data_index, prediction_index, encryption_helper):
    result = column_names
    if len(rows) > 0:
        data_cols = list(map(lambda x: encryption_helper.transform(x), __get_keys(rows[0], data_index)))
        prediction_columns = list(map(lambda x: encryption_helper.transform(x), __get_keys(rows[0], prediction_index)))
        result.extend(data_cols)
        result.extend(prediction_columns)
        result.pop(max(data_index, prediction_index))
        result.pop(min(data_index, prediction_index))
    return result


def __extract_project_guid(rows, column_names):
    guid_index = column_names.index('project_guid')
    return rows[0][guid_index] if len(rows) > 0 else ""


def sensor_data_factory(columns, rows) -> DataFrame:
    project_guid = __extract_project_guid(rows, columns)
    encryption_helper = EncryptionHelper(encryption_key, project_guid, EncryptionMode.DECRYPT)
    data_index = columns.index('data')
    prediction_index = columns.index('prediction')
    column_names = __create_column_definition(rows, columns, data_index, prediction_index, encryption_helper)
    results = filter(None,
                     map(lambda row: __extend_row(row, data_index, prediction_index, encryption_helper), rows))
    return pd.DataFrame(results, columns=column_names)


def training_data_factory(columns, rows) -> DataFrame:
    return pd.DataFrame(rows, columns=columns)


class TrainingDao:
    def __init__(self):
        self.host = '127.0.0.1'
        self.username = 'cassandra'
        self.password = 'cassandra'
        self.keyspace = 'cdl_refit'

    def __get_session(self, factory=None):
        auth_provider = PlainTextAuthProvider(
            username=self.username, password=self.password)
        cluster = Cluster(contact_points=[self.host], port=9042, auth_provider=auth_provider)
        session = cluster.connect(self.keyspace)
        if (factory is not None):
            session.row_factory = factory
        return session

    def query(self, query, factory=None, parameters=None):
        session = self.__get_session(factory)
        return session.execute(query, timeout=None, parameters=parameters)._current_rows

    def query_async(self, session, query, parameters=None):
        return session.execute(query, timeout=None, parameters=parameters)._current_rows

    def get_schema(self, project_guid):
        results = map(lambda item: (item.schema, item.org_guid),
                      filter(lambda item: item.project_guid == project_guid,
                             self.query('SELECT org_guid, project_guid, "schema" FROM project')))
        return list(results)[0]

    def get_sensors(self, project_guid: string):
        query = 'SELECT sensor_id ' \
                'FROM sensor ' \
                'WHERE project_guid = %s'
        return map(lambda x: x.sensor_id, self.query(query, parameters=[project_guid]))

    def get_training_partition(self, session, project_guid: string, sensor: string, partition: string):
        query = 'SELECT project_guid, sensor_id, partition_key, start, end ' \
                'FROM training_window ' \
                'WHERE project_guid = %s ' \
                'AND sensor_id = %s ' \
                'AND partition_key = %s '
        return self.query_async(session, query, parameters=[project_guid, sensor, partition])

    def get_sensor_partition(self, session, project_guid: string, sensor: string, partition: string):
        query = 'SELECT project_guid, sensor_id, partition_key, timestamp, data, prediction ' \
                'FROM sensor_data ' \
                'WHERE project_guid = %s ' \
                'AND sensor_id = %s ' \
                'AND partition_key = %s'
        return self.query_async(session, query, parameters=[project_guid, sensor, partition])

    def get_sensor_data(self, project_guid: string, partitions: list, sensors: list = None) -> DataFrame:
        session = self.__get_session(sensor_data_factory)
        if not sensors:
            sensors = self.get_sensors(project_guid)
        return pd.concat(
            map(lambda sensor: pd.concat(
                map(lambda partition: self.get_sensor_partition(session,
                                                                project_guid,
                                                                sensor,
                                                                partition),
                    partitions)), sensors))

    def get_training_data(self, project_guid: string, partitions: list, sensors: list = None) -> DataFrame:
        session = self.__get_session(training_data_factory)
        if not sensors:
            sensors = self.get_sensors(project_guid)
        return pd.concat(
            map(lambda sensor: pd.concat(
                map(lambda partition: self.get_training_partition(session,
                                                                  project_guid,
                                                                  sensor,
                                                                  partition),
                    partitions)), sensors))

    def save_model(self, schema, model_guid):
        query = 'UPDATE project set model_guid = %s where org_guid = %s and project_guid = %s'
        self.query(query, parameters=[model_guid, schema.org_guid, schema.project_guid])
