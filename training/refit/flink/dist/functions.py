import itertools
import json
from typing import List

import pandas as pd
from pandas import Series, DataFrame
from pyflink.table import DataTypes
from pyflink.table.udf import udf

from .feature_extractor import FeatureExtractor

_expand_columns = ['doubles', 'strings', 'integers', 'labels']
_feature_extractor = FeatureExtractor()


def _append_columns(row, key: str, columns: List[str]):
    dictionary: dict = row[key]

    for column in itertools.chain(dictionary.keys(), columns):
        dictionary[column] = row[column]

    row[key] = dictionary
    return row


def _parse_row(row, columns: List[str]) -> DataFrame:
    for column in columns:
        row[column] = json.loads(row[column])
    return row


def _parse_df(df: DataFrame, columns: List[str]) -> DataFrame:
    return df.apply(lambda row: _parse_row(row, columns), axis=1)


def _expand_row(row, columns: List[str]):
    for column in columns:
        dictionary: dict = row[column]
        for key in dictionary.keys():
            row[key] = dictionary[key]
    return row


def _expand(df: DataFrame, columns: List[str]) -> DataFrame:
    expanded_df: DataFrame = df.apply(lambda row: _expand_row(row, columns), axis=1)
    expanded_df.drop(_expand_columns, axis=1)
    return expanded_df


@udf(input_types=[DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING()],
     result_type=DataTypes.STRING(), udf_type='pandas')
def doubles(project_guid: Series,
            sensor_id: Series,
            timestamp: Series,
            doubles: Series,
            strings: Series,
            integers: Series,
            labels: Series) -> DataFrame:
    return _doubles(project_guid, sensor_id, timestamp, doubles, strings, integers, labels)


@udf(input_types=[DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING()],
     result_type=DataTypes.STRING(), udf_type='pandas')
def strings(project_guid: Series,
            sensor_id: Series,
            timestamp: Series,
            doubles: Series,
            strings: Series,
            integers: Series,
            labels: Series) -> DataFrame:
    return _strings(project_guid, sensor_id, timestamp, doubles, strings, integers, labels)


@udf(input_types=[DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING()],
     result_type=DataTypes.STRING(), udf_type='pandas')
def integers(project_guid: Series,
             sensor_id: Series,
             timestamp: Series,
             doubles: Series,
             strings: Series,
             integers: Series,
             labels: Series) -> DataFrame:
    return _integers(project_guid, sensor_id, timestamp, doubles, strings, integers, labels)


@udf(input_types=[DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING()],
     result_type=DataTypes.STRING(), udf_type='pandas')
def labels(project_guid: Series,
           sensor_id: Series,
           timestamp: Series,
           doubles: Series,
           strings: Series,
           integers: Series,
           labels: Series) -> DataFrame:
    return _labels(project_guid, sensor_id, timestamp, doubles, strings, integers, labels)


@udf(input_types=[DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING()],
     result_type=DataTypes.STRING(), udf_type='pandas')
def datasources(project_guid: Series,
                sensor_id: Series,
                timestamp: Series,
                doubles: Series,
                strings: Series,
                integers: Series,
                labels: Series) -> DataFrame:
    return _datasources(project_guid, sensor_id, timestamp, doubles, strings, integers, labels)


def _doubles(project_guid: Series,
             sensor_id: Series,
             timestamp: Series,
             doubles: Series,
             strings: Series,
             integers: Series,
             labels: Series,
             feature_extractor: FeatureExtractor = _feature_extractor) -> DataFrame:
    key = 'doubles'
    df = pd.DataFrame({'project_guid': project_guid,
                       'sensor_id': sensor_id,
                       'timestamp': timestamp,
                       'doubles': doubles,
                       'strings': strings,
                       'integers': integers,
                       'labels': labels})
    return _extract_features(df, key, feature_extractor.extract_doubles)


def _integers(project_guid: Series,
              sensor_id: Series,
              timestamp: Series,
              doubles: Series,
              strings: Series,
              integers: Series,
              labels: Series,
              feature_extractor: FeatureExtractor = _feature_extractor) -> DataFrame:
    key = 'integers'
    df = pd.DataFrame({'project_guid': project_guid,
                       'sensor_id': sensor_id,
                       'timestamp': timestamp,
                       'doubles': doubles,
                       'strings': strings,
                       'integers': integers,
                       'labels': labels})
    return _extract_features(df, key, feature_extractor.extract_integers)


def _strings(project_guid: Series,
             sensor_id: Series,
             timestamp: Series,
             doubles: Series,
             strings: Series,
             integers: Series,
             labels: Series,
             feature_extractor: FeatureExtractor = _feature_extractor) -> DataFrame:
    key = 'strings'
    df = pd.DataFrame({'project_guid': project_guid,
                       'sensor_id': sensor_id,
                       'timestamp': timestamp,
                       'doubles': doubles,
                       'strings': strings,
                       'integers': integers,
                       'labels': labels})
    return _extract_features(df, key, feature_extractor.extract_strings)


def _labels(project_guid: Series,
            sensor_id: Series,
            timestamp: Series,
            doubles: Series,
            strings: Series,
            integers: Series,
            labels: Series,
            feature_extractor: FeatureExtractor = _feature_extractor) -> DataFrame:
    key = 'labels'
    df = pd.DataFrame({'project_guid': project_guid,
                       'sensor_id': sensor_id,
                       'timestamp': timestamp,
                       'doubles': doubles,
                       'strings': strings,
                       'integers': integers,
                       'labels': labels})
    return _extract_features(df, key, feature_extractor.extract_labels)


def _datasources(project_guid: Series,
                 sensor_id: Series,
                 timestamp: Series,
                 doubles: Series,
                 strings: Series,
                 integers: Series,
                 labels: Series,
                 feature_extractor: FeatureExtractor = _feature_extractor) -> DataFrame:
    key = 'datasources'
    df = pd.DataFrame({'project_guid': project_guid,
                       'sensor_id': sensor_id,
                       'timestamp': timestamp,
                       'doubles': doubles,
                       'strings': strings,
                       'integers': integers,
                       'labels': labels})
    return _extract_features(df, key, feature_extractor.extract_datasources)


def _extract_features(df: DataFrame, key: str, extract_func):
    parsed_df = _parse_df(df, _expand_columns)
    expanded_df = _expand(parsed_df, _expand_columns)
    enriched_df = extract_func(expanded_df.copy(deep=False))
    columns = [column for column in enriched_df.columns if column not in expanded_df.columns]

    for column in columns:
        expanded_df[column] = enriched_df[column]
    enriched_df = enriched_df.apply(lambda row: _append_columns(row, key, columns), axis=1)
    enriched_df[key] = enriched_df[key].apply(lambda dictionary: json.dumps(dictionary))
    return enriched_df[key]
