"""
####################################################################################################
This script helps you to download all pbix files up to date, without manually perform this task.
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