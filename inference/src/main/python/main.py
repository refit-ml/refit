from pandas import DataFrame
from pyflink.datastream import StreamExecutionEnvironment
from pyflink.table import StreamTableEnvironment, DataTypes
from pyflink.table.udf import udf

from feature_extractors.demo_feature_extractor import DemoFeatureExtractor


class RefitFeatureEnrichment():
    def __init__(self):
        self.feature_extractor = DemoFeatureExtractor()
        self.env = StreamExecutionEnvironment.get_execution_environment()
        self.env.set_parallelism(1)
        self.table_env = StreamTableEnvironment.create(self.env)
        self.table_env.get_config().get_configuration().set_boolean("python.fn-execution.memory.managed", True)

        source_table = open('source.sql', 'r').read()
        sink_table = open('sink.sql', 'r').read()

        self.table_env.execute_sql(source_table)
        self.table_env.execute_sql(sink_table)

    def run(self):
        table = self.table_env.from_path('refit_raw_sensor_data') \
            .select("projectGuid, sensorId, timestamp, doubles, strings, integers, labels") \
        .insert_into('refit_sensor_data')

        # df: DataFrame = table.to_pandas()
        # df = self.feature_extractor.extract_features(df)

        # self.table_env.from_pandas(df,
        #                            ['projectGuid', 'sensorId', 'timestamp', 'doubles', 'strings', 'integers', 'labels']) \
        #     .insert_into('refit_sensor_data')

        self.table_env.execute("CDL IoT - Feature Extraction")


RefitFeatureEnrichment().run()
