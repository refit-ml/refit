import string
from datetime import datetime

from enums.ModelFormat import ModelFormat


class TrainingScript:
    def time_window(self) -> (datetime, datetime):
        # Pass back the time window you want to import
        pass

    def project_guid(self) -> string:
        pass

    def pre_train(self, schema, model_guid):
        pass

    def train(self, schema, model_guid, df):
        pass

    def finalize(self, schema, model_guid):
        pass

    def model_format(self) -> ModelFormat:
        # Pass back the ModelFormat enum
        pass
