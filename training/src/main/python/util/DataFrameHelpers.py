from pandas import DataFrame
from functools import reduce
import pandas as pd


def extract_timestamp(row, column):
    row[column] = pd.to_datetime(row[column], format='%m/%d/%y %H:%M')
    return row


def extract_timestamps(df: DataFrame, columns: list) -> DataFrame:
    df2 = reduce(lambda total, column: total.apply(extract_timestamp, axis=1), columns, df)
    return df2
