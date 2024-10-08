"""
####################################################################################################
This script helps you to schedule dataset update from powershell.
####################################################################################################
"""
Login-PowerBIServiceAccount #Log in to power bi service
$token = Get-PowerBIAccessToken
$workspace_id = '' #workspace id (can be found on your pbi url https://app.powerbi.com/groups/here your id)
$dataset_id = '' #dataset id (can be found on your pbi url https://app.powerbi.com/groups/workspace id/datasets/here your id)
$url = "https://api.powerbi.com/v1.0/myorg/groups/$workspace_id/datasets/$dataset_id/refreshes"
Invoke-RestMethod -Headers $token -Uri $url -Method Post