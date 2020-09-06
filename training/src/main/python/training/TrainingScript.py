class TrainingScript:
    def pre_train(self, schema, model_guid):
        pass

    def train(self, schema, model_guid, df):
        pass

    def finalize(self, schema, model_guid):
        pass

    def model_format(self):
        # Pass back the ModelFormat enum
        pass
