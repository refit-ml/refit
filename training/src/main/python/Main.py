import asyncio
import uuid
from datetime import datetime

import onnxmltools

from training.keras.RNN import RNN
from util import ModelFactory, DataFrameHelpers
from util.Schema import SchemaFactory
from dao.TrainingDao import TrainingDao

training_script = RNN()

sensors = ['5163', '5164', '5165', '5166', '5167', '5168', '5169', '5170']

trainingDao = TrainingDao()
schemaFactory = SchemaFactory(trainingDao)
schema = schemaFactory.getSchema(training_script.project_guid())
(start, end) = training_script.time_window()
model_guid = str(uuid.uuid4())
timestamp = datetime.now()
model_format = "ONNX"


async def train():
    # Pre-Train script

    partitions = schema.get_partitions_in_range(start, end)

    training_script.pre_train(schema, model_guid)

    training_df = trainingDao.get_training_data(schema.project_guid, partitions)

    df = trainingDao.get_sensor_data(schema.project_guid, partitions)

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


async def main():
    await train()


asyncio.run(main())
