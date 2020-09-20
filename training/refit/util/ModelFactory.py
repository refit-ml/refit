import onnxmltools

from refit.enums.ModelFormat import ModelFormat


def get_onnx_model(model_format, model, initial_types: list = None, final_types: list = None):
    if model_format == ModelFormat.KERAS:
        return onnxmltools.convert_keras(model)
    if model_format == ModelFormat.SK_LEARN:
        return onnxmltools.convert_sklearn(model, initial_types=initial_types)
    if model_format == ModelFormat.TENSORFLOW:
        return onnxmltools.convert_tensorflow(model)

