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
        self.table_env.get_config().get_configuration().set_string("python.fn-execution.buffer.memory.size", "1024mb")
        self.table_env.get_config().get_configuration().set_string("parallelism.default", "3")
        self.table_env.get_config().get_configuration().set_string("python.fn-execution.bundle.size", "5000")
        self.table_env.get_config().get_configuration().set_string("restart-strategy", "fixed-delay")
        self.table_env.get_config().get_configuration().set_string("restart-strategy.fixed-delay.attempts", "3")
        self.table_env.get_config().get_configuration().set_string("restart-strategy.fixed-delay.delay", "30s")

        source_table = open('source.sql', 'r').read()
        sink_table = open('sink.sql', 'r').read()

        self.table_env.execute_sql(source_table)
        self.table_env.execute_sql(sink_table)

    def run_udf(self):
        from .functions import doubles, strings, integers, labels, datasources
        self.table_env.register_function("doubles", doubles)
        self.table_env.register_function("strings", strings)
        self.table_env.register_function("integers", integers)
        self.table_env.register_function("labels", labels)
        self.table_env.register_function("datasources", datasources)

        self.table_env.from_path('refit_raw_sensor_data') \
            .select("projectGuid, "
                    "sensorId, "
                    "timestamp, "
                    "doubles(projectGuid, sensorId, timestamp, doubles, strings, integers, labels) as doubles,"
                    "strings(projectGuid, sensorId, timestamp, doubles, strings, integers, labels) as strings,"
                    "integers(projectGuid, sensorId, timestamp, doubles, strings, integers, labels) as integers,"
                    "labels(projectGuid, sensorId, timestamp, doubles, strings, integers, labels) as labels"
                    "datasources(projectGuid, sensorId, timestamp, doubles, strings, integers, labels) as dataSources"
                    ) \
            .execute_insert('refit_sensor_data')

        self.env.execute("CDL IoT - Feature Extraction")

    # WIP, currently not working
    def run(self):
        from .functions import doubles
        self.table_env.register_function("doubles", doubles)

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


if __name__ == '__main__':
    RefitFeatureEnrichment().run_udf()
