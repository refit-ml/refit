CREATE KEYSPACE IF NOT EXISTS iot_prototype_training WITH replication = {'class':'SimpleStrategy', 'replication_factor':1};

USE iot_prototype_training;

CREATE TABLE IF NOT EXISTS sensor_data (
    key text,
    value text, 
    PRIMARY KEY(key)
);