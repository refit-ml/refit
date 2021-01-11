import pandas as pd
from pandas import DataFrame


def extract_flag(sensor_data: DataFrame, windows: DataFrame, flag_name: str) -> DataFrame:
    windows = windows.rename(columns={
        'sensorId': 'sensorid',
        'partitionKey': 'partitionkey'
    })

    df = sensor_data.merge(windows, how='left', on=['sensorid', 'partitionkey'])

    df[flag_name] = (df.timestamp <= df.start) | (df.timestamp >= df.end)
    df = df.drop(['projectGuid', 'start', 'end'], axis=1)
    return df


def extract_timestamps(df: DataFrame, columns: list) -> DataFrame:
    res = df
    for column in columns:
        res[column] = pd.to_datetime(res[column])
    return res
