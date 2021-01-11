import inspect
import os
import uuid

import requests


base_dir = "./"
scala_job_name = "CDL IoT - Inference"

__flink_host = lambda: os.environ['FLINK_HOST']
__base_url = lambda: f"http://{__flink_host()}:8081"


def clear_jobs():
    try:
        response = requests.get(url=__base_url() + "/jobs/overview")
        body = response.json()

        running_status = ['RUNNING', 'CREATED', 'RECONCILING', 'RESTARTING', 'RUNNING', 'SUSPENDED']

        jobs = list(map(lambda j: j['jid'],
                        filter(lambda j: j['state'] in running_status and j['name'] != scala_job_name, body['jobs'])))

        for jobId in jobs:
            print("Stopping job: " + jobId)
            os.system(f"flink stop -m {__flink_host()}:8081  -p refit/savepoints/{jobId} {jobId}")
            print('Job: ' + jobId + ' Stopped')
    except:
        print(f"There was an error deploying the inference service")


def add_imports(source):
    imports = [
        'import pandas as pd',
        'from pandas import DataFrame',
        'from .refit_feature_extractor import RefitFeatureExtractor'
    ]
    for i in imports:
        source = i + '\n' + source
    return source


def __create_job_artifact(feature_extractor) -> str:
    submit_directory = f".{str(uuid.uuid4())}"
    os.system(f'[[ -d {submit_directory} ]] && rm -rf {submit_directory}')
    os.mkdir(submit_directory)
    os.mkdir(f'{submit_directory}/flink')
    os.mkdir(f'{submit_directory}/flink/submit')
    os.system(f'cp -r ./refit/flink/dist/*.py {submit_directory}/flink/submit')
    os.system(f'cp -r ./refit/flink/dist/*.sql {submit_directory}')

    if feature_extractor is not None:
        source = inspect.getsource(type(feature_extractor))
        class_name = type(feature_extractor).__name__
        mutated_source = source.replace(class_name, 'FeatureExtractor')
        mutated_source = add_imports(mutated_source)
        with open(f'./{submit_directory}/flink/submit/feature_extractor.py', "w") as f:
            f.write(mutated_source)

    return submit_directory


def submit_python(feature_extractor = None):
    submit_directory: str = __create_job_artifact(feature_extractor)
    os.chdir(submit_directory)
    try:
        print("Starting python job")
        os.system(f"flink run -m {__flink_host()}:8081 --pyModule submit.entrypoint --pyFiles flink")
    except:
        print(f"There was an error deploying the scala inference service")
    finally:
        os.chdir('../')
        os.system(f'rm -rf {submit_directory}')

