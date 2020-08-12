#!/usr/bin/env python
# coding: utf-8

# In[124]:


import numpy as np
import pandas as pd
from matplotlib import pyplot
pd.set_option('display.float_format', lambda x: '%.4f' % x)
import seaborn as sns
sns.set_context("paper", font_scale=1.3)
sns.set_style('white')
import warnings
warnings.filterwarnings('ignore')
from time import time
import matplotlib.ticker as tkr
from scipy import stats
from statsmodels.tsa.stattools import adfuller
from sklearn import preprocessing
from statsmodels.tsa.stattools import pacf
from pandas import DataFrame
from pandas import concat
from numpy import concatenate
from sklearn.preprocessing import MinMaxScaler
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import mean_squared_error
from sklearn import preprocessing
get_ipython().run_line_magic('matplotlib', 'inline')
import math
import keras
from math import sqrt
from keras.models import Sequential
from keras.layers import Dense
from keras.layers import LSTM
from keras.layers import Dropout
from keras.layers import *
from sklearn.metrics import mean_squared_error
from sklearn.metrics import mean_absolute_error
from keras.callbacks import EarlyStopping
from cassandra.cluster import Cluster
from cassandra.auth import PlainTextAuthProvider
from cassandra.query import (
    dict_factory,
    SimpleStatement
    )



project_guid = "e41aa8e4-d79b-4bcc-b5d4-45eb457e6f93"
# This one is the dummy data project
# project_guid = "b6ee5bab-08dd-49b0-98b6-45cd0a28b12f"



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



df = df.sort_values('timestamp')
df



df2 = df.drop(['project_guid', 'sensor_id', 'partition_key','timestamp'], axis=1)



# convert series to supervised learning
def series_to_supervised(data, n_in=1, n_out=1, dropnan=True):
    n_vars = 1 if type(data) is list else data.shape[1]
    df = DataFrame(data)
    cols, names = list(), list()
    # input sequence (t-n, ... t-1)
    for i in range(n_in, 0, -1):
        cols.append(df.shift(i))
        names += [('var%d(t-%d)' % (j+1, i)) for j in range(n_vars)]
    # forecast sequence (t, t+1, ... t+n)
    for i in range(0, n_out):
        cols.append(df.shift(-i))
        if i == 0:
            names += [('var%d(t)' % (j+1)) for j in range(n_vars)]
        else:
            names += [('var%d(t+%d)' % (j+1, i)) for j in range(n_vars)]
    # put it all together
    agg = concat(cols, axis=1)
    agg.columns = names
    # drop rows with NaN values
    if dropnan:
        agg.dropna(inplace=True)
    return agg



values = df2.values
# ensure all data is float
values = values.astype('float32')
# normalize features
scaler = MinMaxScaler(feature_range=(0, 1))
scaled = scaler.fit_transform(values)
# frame as supervised learning
reframed = series_to_supervised(scaled, 1, 1)
reframed.drop(reframed.columns[47:93], axis=1, inplace=True)
print(reframed.head())



# split into train and test sets
values = reframed.values
n_train_hours = 6 * 24
train = values[:n_train_hours, :]
test = values[n_train_hours:, :]
# split into input and outputs
train_X, train_y = train[:, :-1], train[:, -1]
test_X, test_y = test[:, :-1], test[:, -1]
# reshape input to be 3D [samples, timesteps, features]
train_X = train_X.reshape((train_X.shape[0], 1, train_X.shape[1]))
test_X = test_X.reshape((test_X.shape[0], 1, test_X.shape[1]))
print(train_X.shape, train_y.shape, test_X.shape, test_y.shape)



# baseline model
model = Sequential()
model.add(LSTM(50, input_shape=(train_X.shape[1], train_X.shape[2])))
model.add(Dense(1))
model.compile(loss='mae', optimizer='adam')
# fitting model
history = model.fit(train_X, train_y, epochs=50, batch_size=20, validation_data=(test_X, test_y), verbose=2, shuffle=False)
# plot training and test loss curve
pyplot.plot(history.history['loss'], label='train')
pyplot.plot(history.history['val_loss'], label='test')
pyplot.legend()
pyplot.show()


# make a prediction
yhat = model.predict(test_X)
test_X = test_X.reshape((test_X.shape[0], test_X.shape[2]))
# invert scaling for forecast
inv_yhat = np.concatenate((yhat, test_X[:, 1:]), axis=1)
inv_yhat = scaler.inverse_transform(inv_yhat)
inv_yhat = inv_yhat[:,0]
# invert scaling for actual
test_y = test_y.reshape((len(test_y), 1))
inv_y = np.concatenate((test_y, test_X[:, 1:]), axis=1)
inv_y = scaler.inverse_transform(inv_y)
inv_y = inv_y[:,0]
# calculate RMSE
rmse = sqrt(mean_squared_error(inv_y, inv_yhat))
print('Test RMSE: %.3f' % rmse)



model.save('baseline_model') 

