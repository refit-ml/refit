import pandas as pd
from pandas import Series, DataFrame
from pyflink.table import DataTypes
from pyflink.table.udf import udf


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


@udf(input_types=[DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING()],
     result_type=DataTypes.STRING(), udf_type='pandas')
def strings(project_guid: Series,
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

    return df['strings']


@udf(input_types=[DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING()],
     result_type=DataTypes.STRING(), udf_type='pandas')
def integers(project_guid: Series,
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
    df['integers'] = df['integers'].apply(lambda i: "{\"test-int\": 1}")
    return df['integers']


@udf(input_types=[DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING(), DataTypes.STRING(),
                  DataTypes.STRING()],
     result_type=DataTypes.STRING(), udf_type='pandas')
def labels(project_guid: Series,
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

    return df['labels']
