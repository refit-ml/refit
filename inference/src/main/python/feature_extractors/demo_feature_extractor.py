from pandas import DataFrame

from feature_extractors.refit_feature_extractor import RefitFeatureExtractor


class DemoFeatureExtractor(RefitFeatureExtractor):
    def __init__(self):
        super().__init__()
        self.project_guid = 'my-project-guid'

    async def extract_features(self, df: DataFrame) -> DataFrame:
        print(f"Process DF: {len(df)}")
        return df