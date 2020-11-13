import os

import requests

base_dir = "./"
flink_host = os.environ['FLINK_HOST']
base_url = f"http://{flink_host}:8081"
scala_job_name = "CDL IoT - Inference"


def clear_jobs():
    try:
        response = requests.get(url=base_url + "/jobs")
        body = response.json()

        running_status = ['RUNNING', 'CREATED', 'RECONCILING', 'RESTARTING', 'RUNNING', 'SUSPENDED']

        jobs = list(map(lambda j: j['jid'],
                        filter(lambda j: j['status'] in running_status and j['name'] != scala_job_name, body['jobs'])))

        for jobId in jobs:
            print("Stopping job: " + jobId)
            os.system(f"flink stop -m {flink_host}:8081  -p refit/savepoints/{jobId} {jobId}")
            print('Job: ' + jobId + ' Stopped')
    except:
        print(f"There was an error deploying the inference service")


def submit_python():
    try:
        print("Starting python job")
        os.system(f"flink run -m {flink_host}:8081 --python ./refit/entrypoint.py -pyfs ./refit/feature_extractors/")
    except:
        print(f"There was an error deploying the scala inference service")
