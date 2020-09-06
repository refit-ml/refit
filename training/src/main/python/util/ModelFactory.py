import onnxmltools

from enums.ModelFormat import ModelFormat


def get_onnx_model(model_format, model):
    if model_format == ModelFormat.KERAS:
        return onnxmltools.convert_keras(model)
    if model_format == ModelFormat.SK_LEARN:
        return onnxmltools.convert_sklearn(model)
    if model_format == ModelFormat.TENSORFLOW:
        return onnxmltools.convert_tensorflow(model)

