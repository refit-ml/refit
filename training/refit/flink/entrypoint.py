from pyflink.datastream import StreamExecutionEnvironment
from pyflink.table import StreamTableEnvironment, EnvironmentSettings


class RefitFeatureEnrichment():
    def __init__(self):
        # self.feature_extractor = DemoFeatureExtractor()
        self.settings = EnvironmentSettings.new_instance().in_streaming_mode().use_blink_planner().build()
        self.env = StreamExecutionEnvironment.get_execution_environment()
        self.env.set_parallelism(1)
        self.table_env = StreamTableEnvironment.create(self.env, environment_settings=self.settings)
        self.table_env.get_config().get_configuration().set_boolean("python.fn-execution.memory.managed", True)
        self.table_env.add_python_file('feature_extractors')

        source_table = open('feature_extractors/source.sql', 'r').read()
        sink_table = open('feature_extractors/sink.sql', 'r').read()

        self.table_env.execute_sql(source_table)
        self.table_env.execute_sql(sink_table)

    def run_udf(self):
        from flink.feature_extractors.functions import doubles, strings, integers, labels
        self.table_env.register_function("doubles", doubles)
        self.table_env.register_function("strings", strings)
        self.table_env.register_function("integers", integers)
        self.table_env.register_function("labels", labels)

        self.table_env.from_path('refit_raw_sensor_data') \
            .select("projectGuid, "
                    "sensorId, "
                    "timestamp, "
                    "doubles(projectGuid, sensorId, timestamp, doubles, strings, integers, labels) as doubles,"
                    "strings(projectGuid, sensorId, timestamp, doubles, strings, integers, labels) as strings,"
                    "integers(projectGuid, sensorId, timestamp, doubles, strings, integers, labels) as integers,"
                    "labels(projectGuid, sensorId, timestamp, doubles, strings, integers, labels) as labels") \
            .execute_insert('refit_sensor_data')

        self.env.execute("CDL IoT - Feature Extraction")

    # WIP, currently not working
    def run(self):
        from flink.feature_extractors import functions
        self.table_env.register_function("doubles", functions.doubles)

        df = self.table_env.from_path('refit_raw_sensor_data') \
            .select("projectGuid, "
                    "sensorId, "
                    "timestamp, "
                    "doubles,"
                    "strings, "
                    "integers, "
                    "labels") \
            .to_pandas()

        self.table_env \
            .from_pandas(df, ["projectGuid", "sensorId", "timestamp", "doubles", "strings", "integers", "labels"]) \
            .execute_insert("refit_sensor_data").get_job_client().get_job_execution_result().result()

        self.env.execute("CDL IoT - Feature Extraction")


RefitFeatureEnrichment().run_udf()