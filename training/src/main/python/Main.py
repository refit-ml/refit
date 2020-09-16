import uuid
from datetime import datetime

import onnxmltools

from training.keras.RNN import RNN
from util import ModelFactory
from util.Schema import Schema
from dao.TrainingDao import TrainingDao

# Script constants
trainingDao = TrainingDao()
schema = Schema(trainingDao, "e41aa8e4-d79b-4bcc-b5d4-45eb457e6f93")
model_guid = str(uuid.uuid4())
timestamp = datetime.now()
model_format = "ONNX"
training_script = RNN()

# Pre-Train script
training_script.pre_train(schema, model_guid)

df = trainingDao.get_sensor_data(schema.project_guid)

# Train Script
model = training_script.train(schema, model_guid, df)

onnx_model = ModelFactory.get_onnx_model(training_script.model_format(), model)
onnxmltools.utils.save_model(onnx_model, 'output/model.onnx')

# Final cleanup or custom notify
training_script.finalize(schema, model_guid)

in_file = open('output/model.onnx', "rb")
model_bytes = bytearray(in_file.read())
in_file.close()
# Save reference
trainingDao.save_model(schema, model_guid, model_bytes, model_format)

# TODO: need to send to pulsar
