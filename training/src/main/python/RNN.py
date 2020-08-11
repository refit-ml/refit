#!/usr/bin/env python
# coding: utf-8

# In[1]:

# These imports are used
import pandas as pd
from keras.models import Sequential
from cassandra.cluster import Cluster
from cassandra.auth import PlainTextAuthProvider
import warnings
import seaborn as sns
from IPython import get_ipython
from keras.layers import Dense
from keras.layers import LSTM

# These imports are NOT used at all
import numpy as np
import matplotlib.pyplot as plt
from time import time
import matplotlib.ticker as tkr
from scipy import stats
from statsmodels.tsa.stattools import adfuller
from sklearn import preprocessing
from statsmodels.tsa.stattools import pacf
import math
import keras
from keras.layers import Dropout
from sklearn.preprocessing import MinMaxScaler
from sklearn.metrics import mean_squared_error
from sklearn.metrics import mean_absolute_error
from keras.callbacks import EarlyStopping
from cassandra.query import (
    dict_factory,
    SimpleStatement
)

pd.set_option('display.float_format', lambda x: '%.4f' % x)
sns.set_context("paper", font_scale=1.3)
sns.set_style('white')

warnings.filterwarnings('ignore')

# Every model training event will start with a given Project GUID
# This is the static project GUID for baxter
project_guid = "e41aa8e4-d79b-4bcc-b5d4-45eb457e6f93"


# This one is the dummy data project
# project_guid = "b6ee5bab-08dd-49b0-98b6-45cd0a28b12f"

# get_ipython().run_line_magic('matplotlib', 'inline')

def get_keys(row, index):
    return [] if row[index] is None else list(row[index].keys())


def get_values(row, index):
    return [] if row[index] is None else list(dict(row[index]).values())


def extend_row(row, data_index, prediction_index):
    result = list(row)
    result.extend(get_values(row, data_index))
    result.extend(get_values(row, prediction_index))
    result.pop(max(data_index, prediction_index))
    result.pop(min(data_index, prediction_index))
    return result


def create_column_definition(rows, column_names, data_index, prediction_index):
    result = column_names
    if len(rows) > 0:
        data_cols = get_keys(rows[0], data_index)
        prediction_columns = get_keys(rows[0], prediction_index)
        result.extend(data_cols)
        result.extend(prediction_columns)
        result.pop(max(data_index, prediction_index))
        result.pop(min(data_index, prediction_index))

    return result


def pandas_factory(columns, rows):
    data_index = columns.index('data')
    prediction_index = columns.index('prediction')
    column_names = create_column_definition(rows, columns, data_index, prediction_index)
    results = map(lambda row: extend_row(row, data_index, prediction_index), rows)
    return pd.DataFrame(results, columns=column_names)


def get_data(query):
    auth_provider = PlainTextAuthProvider(
        username='cassandra', password='cassandra')
    cluster = Cluster(contact_points=['127.0.0.1'], port=9042, auth_provider=auth_provider)
    session = cluster.connect('cdl_refit')
    session.row_factory = pandas_factory
    return session.execute(query, timeout=None)._current_rows


def get_sensor_data(project_guid):
    return get_data('SELECT project_guid, sensor_id, partition_key, timestamp, data, prediction FROM sensor_data')


df = get_sensor_data(project_guid)

print(df)

# read from csv for now until fix database connection
# df2 = pd.read_csv("baxter_2.csv")
# df2 = df2.sort_values('timestamp')

df2 = df.drop(['project_guid', 'sensor_id', 'partition_key', 'timestamp'], axis=1)

values = df2.values
train = values[:150, :]
test = values[150:, :]

# split into input and outputs
train_X, train_y = train[:, :-1], train[:, -1]
test_X, test_y = test[:, :-1], test[:, -1]
# reshape input to be 3D [samples, timesteps, features]
train_X = train_X.reshape((train_X.shape[0], 1, train_X.shape[1]))
test_X = test_X.reshape((test_X.shape[0], 1, test_X.shape[1]))
print(train_X.shape, train_y.shape, test_X.shape, test_y.shape)

# design network
model = Sequential()
model.add(LSTM(50, input_shape=(train_X.shape[1], train_X.shape[2])))
model.add(Dense(1))
model.compile(loss='mae', optimizer='adam')
# fit network
history = model.fit(train_X, train_y, epochs=50, batch_size=72, validation_data=(test_X, test_y), verbose=2,
                    shuffle=False)
print("We're done!")
