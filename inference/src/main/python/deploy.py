import os

import requests

base_dir = "./"
flink_host = os.environ['FLINK_HOST']
base_url = f"http://{flink_host}:8081"


def clear_jobs():
    try:
        response = requests.get(url=base_url + "/jobs")
        body = response.json()

        running_status = ['RUNNING', 'CREATED', 'RECONCILING', 'RESTARTING', 'RUNNING', 'SUSPENDED']

        jobs = list(map(lambda j: j['id'],
                        filter(lambda j: j['status'] in running_status, body['jobs'])))

        for jobId in jobs:
            print("Stopping job: " + jobId)
            os.system(f"flink stop -m {flink_host}:8081  -p refit/savepoints/{jobId} {jobId}")
            print('Job: ' + jobId + ' Stopped')
    except:
        print(f"There was an error deploying the inference service")


def submit_scala():
    try:
        print("Starting Scala job")
        os.system(f"flink run -m {flink_host}:8081 -d {base_dir}/inference.jar")
    except:
        print(f"There was an error deploying the scala inference service")


def submit_python():
    try:
        print("Starting python job")
        os.system(f"flink run --python main.py -pyfs ./feature_extractors/")
    except:
        print(f"There was an error deploying the scala inference service")


def main():
    clear_jobs()
    submit_scala()
    submit_python()


main()
# flink run --python main.py -pyfs ./feature_extractors/
