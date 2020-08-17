#! /bin/sh

# NOTE: Please please please only run this in a docker container or in a virtual environment

pip install -r requirements.txt

python -m tf2onnx.convert --saved-model ./baseline_model --output model.onnx