
create table refit_sensor_data
(
    projectGuid STRING,
    sensorId    STRING,
    `timestamp` STRING,
    doubles     STRING,
    strings     STRING,
    integers    STRING,
    labels      STRING
) with ( 'connector' = 'kafka',
      'topic' = 'refit.inference.sensor.data',
      'properties.bootstrap.servers' = 'kafka:19092',
      'properties.group.id' = 'testGroup',
      'format' = 'json',
      'scan.startup.mode' = 'earliest-offset')