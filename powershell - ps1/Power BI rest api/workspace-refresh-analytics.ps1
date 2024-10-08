"""
####################################################################################################
This script helps you to import your workspace data to be easily track on a pbi project.
####################################################################################################
"""
$username = $env:USERNAME #computer id
Login-PowerBIServiceAccount #Log in to power bi service
$workspace = @(
    @{
        workspace = '' #workspace name
        workspace_id = '' #workspace id (can be found on your pbi url https://app.powerbi.com/groups/here your id)
        workspace_loc = '' #subfolder where you would like to place it
    }
) #hastable, you can add more workspace
function Get-pbiServiceData {
    param(
        [array]$workspaces
        )
    foreach ($workspace in $workspaces){
        $work_name = $workspace.workspace
        $work_id = $workspace.workspace_id
        $work_loc = $workspace.workspace_loc
        set-location "your path here"
        if(Test-Path -path $work_loc -PathType Container){
            set-location $work_loc
        }else{
            New-Item -path $work_loc -ItemType Directory
            set-location $work_loc
        }
        $today_date = get-date -format "M/dd/yyyy"
        Get-PowerBIReport -WorkspaceId $work_id | ConvertTo-Json | Out-File .\pbi_report_privilege_$work_name.json #getting all available reports

        $path_dataset = ".\reports_status_dataset_$work_name.json"
        $last_modified_dataset = [datetime](Get-Item -path $path_dataset).LastWriteTime.tostring("M/dd/yyyy")
        if($last_modified_dataset -eq $today_date){
            ;
        }
        else{
            $token_dataset = Get-PowerBIAccessToken
            $url_dataset = "https://api.powerbi.com/v1.0/myorg/groups/$work_id/datasets"
            $rest_api = Invoke-RestMethod -Headers $token_dataset -Uri $url_dataset -Method Get
            $workspace_datasets_id = $rest_api.value
            $history_datasets = @()
            foreach ($dataset in $workspace_datasets_id){
                $dataset_id = $dataset.id
                $datasets_url = 'https://api.powerbi.com/v1.0/myorg/groups/'+$work_id+'/datasets/'+$dataset_id+'/refreshes'
                $refresh_history_datasets = Invoke-RestMethod -Headers $token_dataset -Uri $datasets_url -Method Get
                $rfesh_dataset = $refresh_history_datasets.value
                $djson = @{
                    repot_id = $dataset.name
                    records = $rfesh_dataset
                }
                $history_datasets += $djson
            }
            $history_datasets | ConvertTo-Json | Out-File .\reports_status_dataset_$work_name.json
        }

        $path_dataflow = ".\reports_status_dataflow_$work_name.json"
        $last_modified_dataflow = [datetime](Get-Item -path $path_dataflow).LastWriteTime.tostring("M/dd/yyyy")
        if($last_modified_dataflow -eq $today_date){
            ;
        }
        else{
            $token_dataflow = Get-PowerBIAccessToken
            $url_dataflow = "https://api.powerbi.com/v1.0/myorg/groups/$work_id/dataflows"
            Invoke-RestMethod -Headers $token_dataflow -Uri $url_dataflow -Method Get | ConvertTo-Json | Out-File .\reports_status_dataflow_$work_name.json
        }

    }
}
Get-pbiServiceData -workspaces $workspace