
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
      'properties.bootstrap.servers' = 'refit-kafka:9092',
      'properties.group.id' = 'feature-extractor-consumer',
      'format' = 'json',
      'scan.startup.mode' = 'latest-offset')