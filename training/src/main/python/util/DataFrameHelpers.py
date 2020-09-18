import string

from pandas import DataFrame
import pandas as pd


def extract_flag(sensor_data: DataFrame, windows: DataFrame, flag_name: string) -> DataFrame:
    df = sensor_data.merge(windows, how='left', on=['sensor_id', 'partition_key'])
    df[flag_name] = (df.timestamp <= df.start) | (df.timestamp >= df.end)
    df = df.drop(['project_guid_y', 'start', 'end'], axis=1)
    return df


def extract_timestamps(df: DataFrame, columns: list) -> DataFrame:
    res = df
    for column in columns:
        res[column] = pd.to_datetime(res[column])
    return res
