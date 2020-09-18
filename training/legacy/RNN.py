from datetime import datetime

import numpy as np
import pandas as pd
from matplotlib import pyplot

import seaborn as sns
import warnings

from pandas import DataFrame
from pandas import concat
from sklearn.preprocessing import MinMaxScaler
import config
from math import sqrt
from keras.models import Sequential
from keras.layers import *
from sklearn.metrics import mean_squared_error

from refit.api import Refit

pd.set_option('display.float_format', lambda x: '%.4f' % x)
warnings.filterwarnings('ignore')
sns.set_context("paper", font_scale=1.3)
sns.set_style('white')
# get_ipython().run_line_magic('matplotlib', 'inline')

project_guid = "b6ee5bab-08dd-49b0-98b6-45cd0a28b12f"

# This one is the dummy data project
# project_guid = "b6ee5bab-08dd-49b0-98b6-45cd0a28b12f"

refit = Refit(project_guid)

start = datetime(2020, 9, 18)
end = datetime(2020, 9, 19)
sensors = ['5163', '5164', '5165', '5166', '5167', '5168', '5169', '5170']

df = refit.get_sensor_data(start, end, sensors).sort_values('timestamp')
df2 = df.drop(['project_guid', 'sensor_id', 'partition_key', 'timestamp'], axis=1)
num_features = len(df2.columns)

df3 = pd.DataFrame()
for i in range(0, num_features):
    avg_str = 'avg_' + df2.columns.values[i]
    std_str = 'std_' + df2.columns.values[i]
    df3[avg_str] = df2.iloc[:, i].rolling(window=5).mean()
    df3[std_str] = df2.iloc[:, i].rolling(window=5).std()

df2 = pd.concat([df2, df3], axis=1)


# convert series to supervised learning
def series_to_supervised(data, n_in=1, n_out=1, dropnan=True):
    n_vars = 1 if type(data) is list else data.shape[1]
    df = DataFrame(data)
    cols, names = list(), list()
    # input sequence (t-n, ... t-1)
    for i in range(n_in, 0, -1):
        cols.append(df.shift(i))
        names += [('var%d(t-%d)' % (j + 1, i)) for j in range(n_vars)]
    # forecast sequence (t, t+1, ... t+n)
    for i in range(0, n_out):
        cols.append(df.shift(-i))
        if i == 0:
            names += [('var%d(t)' % (j + 1)) for j in range(n_vars)]
        else:
            names += [('var%d(t+%d)' % (j + 1, i)) for j in range(n_vars)]
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
reframed.drop(reframed.columns[num_features * 3:-1], axis=1, inplace=True)
print(reframed.head())

# split into train and test sets
values = reframed.values
n_train_hours = config.TrainingDays * 24
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
model.add(LSTM(config.epochs, input_shape=(train_X.shape[1], train_X.shape[2])))
model.add(Dense(1))
model.compile(loss='mae', optimizer='adam')
# fitting model
history = model.fit(train_X, train_y, epochs=50, batch_size=20, validation_data=(test_X, test_y), verbose=2,
                    shuffle=False)
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
inv_yhat = inv_yhat[:, 0]
# invert scaling for actual
test_y = test_y.reshape((len(test_y), 1))
inv_y = np.concatenate((test_y, test_X[:, 1:]), axis=1)
inv_y = scaler.inverse_transform(inv_y)
inv_y = inv_y[:, 0]
# calculate RMSE
rmse = sqrt(mean_squared_error(inv_y, inv_yhat))
print('Test RMSE: %.3f' % rmse)

# model.save('baseline_model')
