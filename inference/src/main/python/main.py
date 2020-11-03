from pandas import DataFrame, Series
from pyflink.datastream import StreamExecutionEnvironment
from pyflink.table import StreamTableEnvironment, DataTypes, EnvironmentSettings
from pyflink.table.udf import udf

from feature_extractors.demo_feature_extractor import DemoFeatureExtractor
import pandas as pd


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
    df = pd.DataFrame({'project_guid': project_guid,
                       'sensor_id': sensor_id,
                       'timestamp': timestamp,
                       'doubles': doubles,
                       'strings': strings,
                       'integers': integers,
                       'labels': labels})

    return df['doubles']


class RefitFeatureEnrichment():
    def __init__(self):
        self.feature_extractor = DemoFeatureExtractor()
        self.settings = EnvironmentSettings.new_instance().in_streaming_mode().use_blink_planner().build()
        self.env = StreamExecutionEnvironment.get_execution_environment()
        self.env.set_parallelism(1)
        self.table_env = StreamTableEnvironment.create(self.env, environment_settings=self.settings)
        self.table_env.get_config().get_configuration().set_boolean("python.fn-execution.memory.managed", True)

        source_table = open('source.sql', 'r').read()
        sink_table = open('sink.sql', 'r').read()

        self.table_env.execute_sql(source_table)
        self.table_env.execute_sql(sink_table)
        self.table_env.register_function("doubles", doubles)

    def run(self):
        self.table_env.from_path('refit_raw_sensor_data') \
            .select("projectGuid, "
                    "sensorId, "
                    "timestamp, "
                    "doubles(projectGuid, sensorId, timestamp, doubles, strings, integers, labels),"
                    "strings, "
                    "integers, "
                    "labels") \
            .execute_insert('refit_sensor_data')

        self.env.execute("CDL IoT - Feature Extraction")


RefitFeatureEnrichment().run()
