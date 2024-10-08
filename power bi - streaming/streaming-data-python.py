"""
####################################################################################################
Streaming data using python to Power BI Streaming Dataset
####################################################################################################
"""
import requests
from datetime import datetime
from time import sleep
from json import *
for x in range(0,500):
    schedule = datetime.now().strftime("%Y-%m-%dT%H:%M:%S.000Z")
    payload = [
                {
                    "date":schedule,
                    "value":425000*x
                }
            ]
    header = {
        "Content-Type": "application/json"
    }
    endpoint = "api link here"
    method = requests.post(endpoint, headers=header , json=payload)
    print(f"Run - {x} {method} {payload}")
    sleep(10)