from pandas import DataFrame


class RefitFeatureExtractor():
    def __init__(self):
        self.project_guid = '__NONE__'

    def extract_features(self, df: DataFrame) -> DataFrame:
        return df
