"""
####################################################################################################
This script helps you to load files to Sharepoint.

Pre-requisites:
1. Powershell
2. SharepointPnPPowershellOnline

Steps:
1. Run the script
2. The script will load the files to Sharepoint
3. You can use the files for further processing

####################################################################################################
"""
$user = $Env:USERNAME
$path = "C:\Users\$user\Documents"
if(Test-Path -path $path -PathType Container){
    ;
}else{
    New-Item -path $path -ItemType Directory
}
$site_folder = "Shared Documents"
get-childitem -Path $path -File | foreach-object{
    $file = $_.FullName
    $month = Get-Date -Format "MM"
    $regex = $file -match "$month-..-.."
    if($regex -eq $true){
        Add-PnPFile -Path "$path/$file" -Folder "$site_folder"
    }
}