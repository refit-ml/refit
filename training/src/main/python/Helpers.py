import pandas as pd
from cassandra.auth import PlainTextAuthProvider
from cassandra.cluster import Cluster

from EncryptionHelper import EncryptionHelper, EncryptionMode

encryption_key = "keyboard_cat"


def get_keys(row, index):
    return [] if row[index] is None else list(row[index].keys())


def get_values(row, index):
    return [] if row[index] is None else list(dict(row[index]).values())


def extend_row(row, data_index, prediction_index, encryption_helper):
    result = list(row)
    data_values = list(map(lambda x: encryption_helper.transform(x), get_values(row, data_index)))
    prediction_values = list(map(lambda x: encryption_helper.transform(x), get_values(row, prediction_index)))
    result.extend(data_values)
    result.extend(prediction_values)
    result.pop(max(data_index, prediction_index))
    result.pop(min(data_index, prediction_index))
    return result


def create_column_definition(rows, column_names, data_index, prediction_index, encryption_helper):
    result = column_names
    if len(rows) > 0:
        data_cols = list(map(lambda x: encryption_helper.transform(x), get_keys(rows[0], data_index)))
        prediction_columns = list(map(lambda x: encryption_helper.transform(x), get_keys(rows[0], prediction_index)))
        result.extend(data_cols)
        result.extend(prediction_columns)
        result.pop(max(data_index, prediction_index))
        result.pop(min(data_index, prediction_index))
    return result


def extract_project_guid(rows, column_names):
    guid_index = column_names.index('project_guid')
    return rows[0][guid_index] if len(rows) > 0 else ""


def pandas_factory(columns, rows):
    project_guid = extract_project_guid(rows, columns)
    encryption_helper = EncryptionHelper(encryption_key, project_guid, EncryptionMode.DECRYPT)
    data_index = columns.index('data')
    prediction_index = columns.index('prediction')
    column_names = create_column_definition(rows, columns, data_index, prediction_index, encryption_helper)
    results = map(lambda row: extend_row(row, data_index, prediction_index, encryption_helper), rows)
    return pd.DataFrame(results, columns=column_names)


def get_data(query):
    auth_provider = PlainTextAuthProvider(
        username='cassandra', password='cassandra')
    cluster = Cluster(contact_points=['127.0.0.1'], port=9042, auth_provider=auth_provider)
    session = cluster.connect('cdl_refit')
    session.row_factory = pandas_factory
    return session.execute(query, timeout=None)._current_rows


def get_sensor_data(project_guid):
    return get_data('SELECT project_guid, sensor_id, partition_key, timestamp, data, prediction FROM sensor_data')
