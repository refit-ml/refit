import pandas as pd
from pandas import DataFrame


class FeatureExtractor():
    def __init__(self):
        self.project_guid = '__NONE__'

    def extract_doubles(self, df: DataFrame) -> DataFrame:
        return df

    def extract_strings(self, df: DataFrame) -> DataFrame:
        return df

    def extract_integers(self, df: DataFrame) -> DataFrame:
        return df

    def extract_labels(self, df: DataFrame) -> DataFrame:
        return df

    def extract_datasources(self, df: DataFrame) -> DataFrame:
        return df
