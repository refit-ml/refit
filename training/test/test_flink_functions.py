import json

import pandas as pd
from pandas import DataFrame

from refit.flink.dist import functions
from refit.flink.dist.feature_extractor import FeatureExtractor

df = pd.read_csv('data/demo_df.csv')
df['project_guid'] = df.sensor_id.apply(lambda _: 'keyboard_cat')
df['doubles'] = df.sensor_id.apply(lambda _: json.dumps({'test_double': 0.1}))
df['integers'] = df.sensor_id.apply(lambda _: json.dumps({'test_integer': 1}))
df['strings'] = df.sensor_id.apply(lambda _: json.dumps({'test_string': "asdf"}))
df['labels'] = df.sensor_id.apply(lambda _: json.dumps({'test_label': "some_label"}))
df['datasources'] = df.sensor_id.apply(lambda _: json.dumps({}))


class MockFeatureExtractor(FeatureExtractor):
    def __init__(self):
        self.project_guid = '__NONE__'

    def extract_doubles(self, df: DataFrame) -> DataFrame:
        df['mock_double'] = df.sensor_id.apply(lambda _: 0.5)
        return df

    def extract_strings(self, df: DataFrame) -> DataFrame:
        df['mock_string'] = df.sensor_id.apply(lambda _: 'keyboard_cat')
        return df

    def extract_integers(self, df: DataFrame) -> DataFrame:
        df['mock_integer'] = df.sensor_id.apply(lambda _: 11)
        return df

    def extract_labels(self, df: DataFrame) -> DataFrame:
        df['mock_label'] = df.sensor_id.apply(lambda _: 'mock_label')
        return df

    def extract_datasources(self, df: DataFrame) -> DataFrame:
        df['mock_ds'] = df.sensor_id.apply(lambda _: 'ds')
        return df


project_guid = df.project_guid
sensor_id = df.sensor_id
timestamp = df.timestamp
doubles = df.doubles
strings = df.strings
integers = df.integers
labels = df.labels
datasources = df.datasources


def test_fetch_labels():
    enriched = functions._labels(
        project_guid=project_guid,
        sensor_id=sensor_id,
        timestamp=timestamp,
        doubles=doubles,
        strings=strings,
        integers=integers,
        labels=labels,
        datasources=datasources,
        feature_extractor=MockFeatureExtractor()
    )
    enriched = [json.loads(item) for item in enriched]
    assert all(['mock_label' in item.keys() and item['mock_label'] == 'mock_label' for item in enriched])
    assert len(enriched) > 0


def test_fetch_integers():
    enriched = functions._integers(
        project_guid=project_guid,
        sensor_id=sensor_id,
        timestamp=timestamp,
        doubles=doubles,
        strings=strings,
        integers=integers,
        labels=labels,
        datasources=datasources,
        feature_extractor=MockFeatureExtractor()
    )
    enriched = [json.loads(item) for item in enriched]
    assert all(['mock_integer' in item.keys() and item['mock_integer'] == 11 for item in enriched])
    assert len(enriched) > 0


def test_fetch_strings():
    enriched = functions._strings(
        project_guid=project_guid,
        sensor_id=sensor_id,
        timestamp=timestamp,
        doubles=doubles,
        strings=strings,
        integers=integers,
        labels=labels,
        datasources=datasources,
        feature_extractor=MockFeatureExtractor()
    )
    enriched = [json.loads(item) for item in enriched]
    assert all(['mock_string' in item.keys() and item['mock_string'] == 'keyboard_cat' for item in enriched])
    assert len(enriched) > 0


def test_fetch_doubles():
    enriched = functions._doubles(
        project_guid=project_guid,
        sensor_id=sensor_id,
        timestamp=timestamp,
        doubles=doubles,
        strings=strings,
        integers=integers,
        labels=labels,
        datasources=datasources,
        feature_extractor=MockFeatureExtractor()
    )
    enriched = [json.loads(item) for item in enriched]
    assert all(['mock_double' in item.keys() and item['mock_double'] == 0.5 for item in enriched])
    assert len(enriched) > 0


def test_fetch_datasources():
    enriched = functions._datasources(
        project_guid=project_guid,
        sensor_id=sensor_id,
        timestamp=timestamp,
        doubles=doubles,
        strings=strings,
        integers=integers,
        labels=labels,
        datasources=datasources,
        feature_extractor=MockFeatureExtractor()
    )
    enriched = [json.loads(item) for item in enriched]
    assert all(['mock_ds' in item.keys() and item['mock_ds'] == 'ds' for item in enriched])
    assert len(enriched) > 0
