"""
####################################################################################################
This script helps you to work with dates using powershell.

Pre-requisites:
1. Powershell

Steps:
1. Run the script
2. The script will show you how to work with dates using powershell
3. You can use the script for further processing

####################################################################################################
"""
$today = get-date #retrieve your machine local date and time
############### example 1
#### this example will show you how to use workday with python
$days = [PSCustomObject]@(
    @{   
        "starts" = $today
        "days" = 50
    },
    @{   
        "starts" = $today
        "days" = 30
    },
    @{   
        "starts" = $today
        "days" = 7
    } #Dictionary/JSON format
)
$days | ForEach-Object {
    $workdays = 0
    $end = $_.days
    while ($workdays -le $end){
        if ($_.starts.DayOfWeek -ne 'Saturday' -and $_.starts.DayOfWeek -ne 'Sunday'){
            $workdays++
            $future = $_.starts.addDays(1)
        }
    }
    $_["days pass"] = $workdays
    $_["future date"] = $future
}
$days
############### example 2
#### this example will show you how to get a list of days
$year = get-date -format "yyyy"
$start = [datetime]"$year-01-01" ;  $end = [datetime]"$year-12-31"
$days_list = [PSCustomObject]@()
$workdays = 0
while($start -lt $end){
    if ($starts.DayOfWeek -ne 'Saturday' -and $starts.DayOfWeek -ne 'Sunday'){
        $start = $start.addDays(1)
        $workdays++
        $days_list += @{date = $start.addDays(1)}
    }
}
$days_list