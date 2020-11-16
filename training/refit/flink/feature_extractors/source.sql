create table refit_raw_sensor_data
(
    projectGuid STRING,
    sensorId    STRING,
    `timestamp` STRING,
    doubles     STRING,
    strings     STRING,
    integers    STRING,
    labels      STRING
) with ( 'connector' = 'kafka',
      'topic' = 'refit.inference.raw.data',
      'properties.bootstrap.servers' = 'kafka:19092',
      'properties.group.id' = 'testGroup-source',
      'format' = 'json',
      'scan.startup.mode' = 'earliest-offset')