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

get_ipython().run_line_magic('matplotlib', 'inline')


def flatten_row(row, columnNames):
    row[4] = dict(row[4])
    row[5] = dict(row[5])
    return row

def pandas_factory(colnames, rows):
    lst = [list(i) for i in rows]
    return pd.DataFrame(map(lambda item: flatten_row(item, colnames), lst), columns=colnames)


auth_provider = PlainTextAuthProvider(
    username='cassandra', password='cassandra')
cluster = Cluster(contact_points=['127.0.0.1'], port=9042, auth_provider=auth_provider)
session = cluster.connect('cdl_refit')
session.row_factory = pandas_factory

query = "SELECT * FROM sensor_data"

res = session.execute(query, timeout=None)
df = res._current_rows
df

key_list = list(df['data'][1].keys())

df['target'] = df['prediction'].apply(lambda x: x.get('target'))

for key in key_list:
    df[key] = df['data'].apply(lambda x: x.get(key))

df = df.sort_values('timestamp')

# read from csv for now until fix database connection
df2 = pd.read_csv("baxter_2.csv")
df2 = df2.sort_values('timestamp')

df2 = df2.drop(['Session-ID', 'timestamp'], axis=1)

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
