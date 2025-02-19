"""
####################################################################################################
This script helps you to setting up files script to be run on powershell.

Pre-requisites:
1. Powershell

Steps:
1. Run the script
2. The script will set up the task scheduler
3. You can use the task scheduler to run the script


####################################################################################################
"""
function set-task{
    param(
        [String]$name
    )

    if(Get-ScheduledTask $name -ErrorAction Ignore)
        {
            ;
        } else {
            $path =  '-ExecutionPolicy Bypass -File "your file path you would like to run with powershell here"'
            $action = New-ScheduledTaskAction -execute 'powershell' -argument $path -workingdirectory C:\Windows\System32\WindowsPowerShell\v1.0
            $trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Monday, Tuesday, Wednesday, Thursday, Friday -At 8:40am
            $settings = New-ScheduledTaskSettingsSet -allowstartifonbatteries -dontstopifgoingonbatteries
            Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $name -Description 'Description here' -Settings $settings
        }
}
set-task -name "Your task name here"