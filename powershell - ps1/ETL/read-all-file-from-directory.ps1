"""
####################################################################################################
This script helps you to read all files from a directory.
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