#!/usr/bin/env python
# coding: utf-8


import numpy as np
import pandas as pd
import datetime


df = pd.read_csv("data.csv")
df = df.head(500)

# convert string to timestamp
for ind in df.index: 
    df['timestamp'][ind] = pd.to_datetime(df['timestamp'][ind],format='%Y-%m-%d %H:%M:%S')

df1 = df.set_index('timestamp')
df1 = df1.sort_index()


# create new col name for mean
col = 'temperature'
stats_function = 'mean'
MINUTES = 60
new_col = col+"_"+stats_function+"_"+str(MINUTES)
df1[new_col] = np.nan

#compute mean
df_start = df1.index[0]
for ind in df.index: 
    end = df1.index[ind]
    start = (end-datetime.timedelta(minutes=MINUTES)).strftime("%Y-%m-%d %H:%M:%S")
    if start<str(df_start):
        continue
    else:
        df1[new_col][ind] = df1[start:end][col].mean()


# create new col name
col = 'temperature'
stats_function = 'std'
MINUTES = 60
new_col = col+"_"+stats_function+"_"+str(MINUTES)
df1[new_col] = np.nan

#compute std
df_start = df1.index[0]
for ind in df.index: 
    end = df1.index[ind]
    start = (end-datetime.timedelta(minutes=MINUTES)).strftime("%Y-%m-%d %H:%M:%S")
    if start<str(df_start):
        continue
    else:
        df1[new_col][ind] = df1[start:end][col].std()


# correlation
stats_function = 'correlation'
col1_name = 'pressure'
col2_name = 'wind'
MINUTES = 60
new_col = col1_name+"_"+col2_name+"_"+stats_function+"_"+str(MINUTES)
df1[new_col] = np.nan

#compute correlation
df_start = df1.index[0]
for ind in df.index: 
    end = df1.index[ind]
    start = (end-datetime.timedelta(minutes=MINUTES)).strftime("%Y-%m-%d %H:%M:%S")
    if start<str(df_start):
        continue
    else:
        temp1 = df1[col1_name]
        temp2 = df1[col2_name]
        corr_df = pd.concat([temp1,temp2],axis = 1)
        corr_df = corr_df.apply(lambda x:x.astype(float))
        corr_df = corr_df[start:end]
        df1[new_col][ind] = corr_df.corr().values[0][1]

#union two time windows
# create new col name
col = 'temperature'
stats_function = 'mean'
# smaller window goes first
MINUTES_1 = 60
MINUTES_2 = 1400
new_col = col+"_"+stats_function+"_"+str(MINUTES_1)+"_"+str(MINUTES_2)
df1[new_col] = np.nan

#compute mean
df_start = df1.index[0]
for ind in df.index: 
    end = df1.index[ind]
    start_1 = (end-datetime.timedelta(minutes=MINUTES_1)).strftime("%Y-%m-%d %H:%M:%S")
    start_2 = (end-datetime.timedelta(minutes=MINUTES_2)).strftime("%Y-%m-%d %H:%M:%S")
    if start_1<str(df_start):
        continue
    else:
        temp1 = df1[start_1:end]
        temp2 = df1[start_2:end]
        union_df = pd.concat([temp1,temp2])
        union_df = union_df.apply(lambda x:x.astype(float))
        df1[new_col][ind] = union_df[col].mean()


df1

