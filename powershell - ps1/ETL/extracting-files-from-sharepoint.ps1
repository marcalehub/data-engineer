"""
####################################################################################################
This script helps you to extract files from Sharepoint.

Pre-requisites:
1. Powershell
2. SharepointPnPPowershellOnline

Steps:
1. Run the script
2. The script will extract the files from Sharepoint and save it to the local directory
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
Get-PnPFolderItem -FolderSiteRelativeUrl $site_folder | ForEach-Object {
    $file = $_.Name
    $month = Get-Date -Format "MM"
    $regex = $file -match "$month-..-.."
    if($regex -eq $true){
        if(Test-Path -path "$path/$file"){
            ;
        }else{
            Get-PnPFile -Url "$site_folder/$file" -Path $path -AsFile
        }
    }
}