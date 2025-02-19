"""
####################################################################################################
This script helps you to download all pbix files up to date, without manually perform this task.

Pre-requisites:
1. Powershell
2. Power BI Service Account
3. Power BI Workspace ID
4. Power BI Dataset ID

Steps:
1. Run the script
2. The script will download all pbix files from the power bi service
3. You can use the files for further processing

####################################################################################################
"""
Login-PowerBIServiceAccount #Log in to power bi service
$workspace = @(
    @{
        workspace = '' #provide the desire name
        workspace_id = '' #workspace id (can be found on your pbi url https://app.powerbi.com/groups/here your id)
    }
)
Get-PowerBIReport -WorkspaceId $workspace.workspace_id | Foreach-Object {
    $report_id = $_.Id
    $report_name = $_.Name
    Export-PowerBIReport -Id $report_id -OutFile "path/$report_name.pbix" #desire location to save your proyect
}