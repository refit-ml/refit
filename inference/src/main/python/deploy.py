import requests
import os
import sys

base_dir = "/app"
flink_host = os.environ['FLINK_HOST']
base_url = f"http://{flink_host}:8081"

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

    print("Starting job without savepoint")
    os.system(f"flink run -m {flink_host}:8081 -d {base_dir}/inference.jar")
except:
    print(f"There was an error deploying the inference service")
finally:
    sys.exit()
