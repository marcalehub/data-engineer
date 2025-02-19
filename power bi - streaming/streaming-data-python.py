"""
####################################################################################################
Streaming data using python to Power BI Streaming Dataset

This script is used to stream data to Power BI Streaming Dataset.
The data is sent to Power BI every 10 seconds.
The data is sent in JSON format.

Pre-requisites:
1. Power BI account
2. Power BI Streaming Dataset
3. Power BI Streaming Dataset API link
4. Python

Steps:
1. Get the API link of the Power BI Streaming Dataset
2. Install Requests library using pip
3. Run the script

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