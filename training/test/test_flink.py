import os
import unittest

from refit.flink import submit
from refit.flink.refit_feature_extractor import RefitFeatureExtractor


class ExampleFeatureExtractor(RefitFeatureExtractor):
    def __init__(self):
        super().__init__()
        self.foo = "bar"


def test_create_artifact():
    directory = submit.__create_job_artifact(ExampleFeatureExtractor())

    contents = open(f'{directory}/flink/submit/feature_extractor.py', 'r').read()

    expected = """from .refit_feature_extractor import RefitFeatureExtractor
from pandas import DataFrame
import pandas as pd
class FeatureExtractor(RefitFeatureExtractor):
    def __init__(self):
        super().__init__()
        self.foo = \"bar\""""
    os.system(f'rm -rf {directory}')

    assert expected.rstrip() == contents.rstrip()



