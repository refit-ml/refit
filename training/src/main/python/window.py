import numpy as np
import pandas as pd
from datetime import datetime as dt, timedelta

time_window = pd.read_csv("time.csv")
for ind in time_window.index: 
    time_window['from'][ind] = pd.to_datetime(time_window['from'][ind],format='%m/%d/%y %H:%M')
    time_window['to'][ind] = pd.to_datetime(time_window['to'][ind],format='%m/%d/%y %H:%M')


df = pd.read_csv("operable.csv")

# convert string to timestamp
for ind in df.index: 
    df['timestamp'][ind] = pd.to_datetime(df['timestamp'][ind],format='%Y-%m-%d %H:%M:%S')

# construct time range
add_seconds = 10*60
df['end_hour'] = df['timestamp'] + timedelta(seconds=add_seconds)

# filter out time
mask = pd.DataFrame() 
for ind in time_window.index: 
    start = time_window['from'][ind]
    end = time_window['to'][ind]
    temp = df.loc[(df['end_hour'] > start) & (df['end_hour'] < end)]
    mask = pd.concat([mask, temp], axis=0)

df['operable'] = 1
for ind in mask.index: 
    df['operable'][ind] = 0

df.to_csv("operable_flag.csv")
