"""
####################################################################################################
This script helps you to read all files from a directory.

Pre-requisites:
1. Powershell

Steps:
1. Run the script
2. The script will read all files from the directory
3. You can use the files for further processing

####################################################################################################
"""
$user = $Env:USERNAME
$path = "C:\Users\$user\Documents"
$data = @()
get-childitem -Path $path -File | foreach-object{
    $files = $_.FullName
    $month = Get-Date -Format "MM"
    $regex = $files -match "$month-..-.."
    if($regex -eq $true){
        $files = get-content -Path $_.FullName -Raw | ConvertFrom-Json
        $data+=$files 
    }
}