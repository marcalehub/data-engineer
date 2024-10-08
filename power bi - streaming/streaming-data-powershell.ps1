"""
####################################################################################################
Streaming data using python to Power BI Streaming Dataset
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