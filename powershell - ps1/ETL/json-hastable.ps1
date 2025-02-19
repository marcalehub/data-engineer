"""
####################################################################################################
This script helps you to understand simply json or hastable structure.

Pre-requisites:
1. Powershell

Steps:
1. Run the script
2. The script will show you the json or hastable structure
3. You can use the structure for further processing

####################################################################################################
"""
$json = [PSCustomObject]@(
    @{
        Name = "NAME"
        Age = 24
        Month = 0.9
    }
)
$json | ForEach-Object{
    $_["Current Age"] = $_.Age + $_.Month
}
$json