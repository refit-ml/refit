class FeatureExtractor():
    from pandas import DataFrame
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

    def extract_features(self, df: DataFrame):
        import pandas as pd
        df = pd.merge(df, self.extract_doubles(df))
        df = pd.merge(df, self.extract_strings(df))
        df = pd.merge(df, self.extract_integers(df))
        df = pd.merge(df, self.extract_labels(df))
        return df

    def extract_datasources(self, df: DataFrame) -> DataFrame:
        return df
