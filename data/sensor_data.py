from faker import Faker
from datetime import timedelta
import simplejson as json
import csv
F = Faker()

def sensor(start_id, start_dt):
    start_id = start_id
    start_dt = start_dt
    temperature = F.random_int(min = 30, max = 100)
    pressure = F.random_int(min = 900, max = 1200)
    wind = F.random_int(min = 0, max = 70)
    json_dump = json.dumps({
        "sensor_id": start_id,
        "timestamp": start_dt.strftime("%Y-%m-%d %H:%M:%S"),
        "temperature": temperature,
        "pressure": pressure,
        "wind": wind
        }
    )
    message = json.loads(json_dump) 
    writer.writerow([message["sensor_id"], message["timestamp"], message["temperature"], message["pressure"], message["wind"]])

num_sensors = 10000
num_readings = 20
start_id = F.random_int(min = 1000)
with open(r"C:\Users\adity\Downloads\CDL Project\test.csv", "a", newline = '') as f:
    writer = csv.writer(f)
    writer.writerow(["sensor_id", "timestamp", "temperature", "pressure", "wind"])
    for i in range(start_id, start_id + num_sensors):
        start_dt = F.past_datetime(start_date = "-1d")
        for j in range(0, num_readings):
            sensor(i, start_dt + timedelta(seconds = j * 5))
    f.close()