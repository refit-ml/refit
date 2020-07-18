CREATE KEYSPACE IF NOT EXISTS iot_prototype_training WITH replication = {'class':'SimpleStrategy', 'replication_factor':1};

USE iot_prototype_training;

CREATE TABLE IF NOT EXISTS sensor_data (
    key text,
    sensor_id text,
    timestamp text,
    data map<text, text>,
    prediction map<text, text>, 
    PRIMARY KEY(key)
);


CREATE TABLE IF NOT EXISTS in_operable_entry (
    key text,
    sensor_id text,
    start text,
    end text,
    PRIMARY KEY(key)
);

