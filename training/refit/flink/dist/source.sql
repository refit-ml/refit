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
      'properties.bootstrap.servers' = 'refit-kafka:9092',
      'properties.group.id' = 'feature-extractor-producer',
      'format' = 'json',
      'scan.startup.mode' = 'earliest-offset')