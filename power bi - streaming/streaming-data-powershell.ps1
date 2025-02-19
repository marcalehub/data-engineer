"""
####################################################################################################
Streaming data using Powershell to Power BI Streaming Dataset

This script is used to stream data to Power BI Streaming Dataset using Python.

Pre-requisites:
1. Power BI account
2. Power BI Streaming Dataset
3. Power BI Streaming Dataset API link
4. Powershell

Steps:
1. Get the API link of the Power BI Streaming Dataset
2. Run the script

####################################################################################################
"""
foreach ($x in 0..500){
    $schedule = (get-date -format "yyyy-MM-ffTHH:mm:ss.000Z")
    $endpoint = "api link here"
    $payload = @{
        "date"=$schedule
        "value"=425000*$x
    }
    Invoke-RestMethod -Method Post -Uri "$endpoint" -Body (ConvertTo-Json @($payload))
    write-host "Run - {$x} {$method} {$payload}"
    start-sleep 10
}