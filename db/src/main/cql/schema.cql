CREATE KEYSPACE IF NOT EXISTS cdl_refit WITH replication = {'class':'SimpleStrategy', 'replication_factor':3};

CREATE TABLE IF NOT EXISTS cdl_refit.org
(
    org_guid  text,
    name      text,
    timestamp timestamp,
    PRIMARY KEY (org_guid)
);

CREATE TABLE IF NOT EXISTS cdl_refit.project
(
    org_guid     text,
    project_guid text,
    name         text,
    "schema"     text,
    description  text,
    tags         map<text, text>,
    model_guid   text,
    timestamp    timestamp,
    primary key (org_guid, project_guid)
);


CREATE TABLE IF NOT EXISTS cdl_refit.sensor_data
(
    project_guid  text,
    sensor_id     text,
    partition_key text,
    timestamp     timestamp,
    data          map<text, text>,
    prediction    map<text, text>,
    labels        map<text, text>,
    PRIMARY KEY ((project_guid, sensor_id, partition_key), timestamp)
);

CREATE TABLE IF NOT EXISTS cdl_refit.sensor
(
    project_guid text,
    sensor_id    text,
    created_at   timestamp,
    PRIMARY KEY (project_guid, sensor_id)
);


CREATE TABLE IF NOT EXISTS cdl_refit.training_window
(
    project_guid  text,
    sensor_id     text,
    partition_key text,
    start         timestamp,
    end           timestamp,
    PRIMARY KEY ((project_guid, sensor_id, partition_key), start, end)
);


CREATE TABLE IF NOT EXISTS cdl_refit.models
(
    project_guid text,
    model_guid   text,
    format       text,
    model        blob,
    timestamp    timestamp,
    PRIMARY KEY (project_guid, model_guid)
);

