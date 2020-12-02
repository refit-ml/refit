from datetime import datetime

import pandas as pd
from pandas import DataFrame

from refit.api.refit import Refit
from refit.flink.refit_feature_extractor import RefitFeatureExtractor
from refit.util.Schema import Schema


class MockFeatureExtractor(RefitFeatureExtractor):
    def __init__(self):
        self.project_guid = '__NONE__'

    def extract_doubles(self, df: DataFrame) -> DataFrame:
        return df

    def extract_strings(self, df: DataFrame) -> DataFrame:
        return df

    def extract_integers(self, df: DataFrame) -> DataFrame:
        df['over_50'] = df.temperature.apply(lambda t: t > 50)
        return df

    def extract_labels(self, df: DataFrame) -> DataFrame:
        return df

    def extract_features(self, df: DataFrame):
        df = pd.merge(df, self.extract_doubles(df))
        df = pd.merge(df, self.extract_strings(df))
        df = pd.merge(df, self.extract_integers(df))
        df = pd.merge(df, self.extract_labels(df))
        return df


class MockTrainingDao():
    def __init__(self):
        pass

    def get_sensor_data(self, project_guid: str, partitions: list, sensors: list = None) -> DataFrame:
        df = pd.read_csv('data/demo_df.csv')
        return df

    def get_schema(self, project_guid: str) -> Schema:
        schema_yaml = open(f'data/demo.yaml', 'r').read()
        return Schema(schema_yaml)


class MockSchemaFactory():
    def __init__(self):
        pass

    def get_schema(self, project_guid: str) -> Schema:
        schema_yaml = open(f'data/demo.yaml', 'r').read()
        return Schema(schema_yaml)


project_guid = 'b6ee5bab-08dd-49b0-98b6-45cd0a28b12f'
refit = Refit(project_guid,
              training_dao=MockTrainingDao(),
              schema_factory=MockSchemaFactory())


def test_extract_features():
    start = datetime(2020, 1, 1)
    end = datetime(2020, 1, 2)
    sensors = list(map(lambda x: str(x),
                       range(5160, 5170)))
    df: DataFrame = refit.fetch_sensor_data(start, end, sensors, MockFeatureExtractor())

    empty_df = df[df.temperature > 50]
    empty_df = empty_df[empty_df.over_50 == 0]

    assert df.columns.__contains__('over_50')

    assert len(df) > 0
    assert len(empty_df) == 0
