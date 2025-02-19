"""
####################################################################################################
This script helps you to schedule dataset update from powershell.

Pre-requisites:
1. Powershell
2. Power BI Service Account
3. Power BI Workspace ID
4. Power BI Dataset ID

Steps:
1. Run the script
2. The script will update the dataset
3. You can use the dataset for further processing

####################################################################################################
"""
Login-PowerBIServiceAccount #Log in to power bi service
$token = Get-PowerBIAccessToken
$workspace_id = '' #workspace id (can be found on your pbi url https://app.powerbi.com/groups/here your id)
$dataset_id = '' #dataset id (can be found on your pbi url https://app.powerbi.com/groups/workspace id/datasets/here your id)
$url = "https://api.powerbi.com/v1.0/myorg/groups/$workspace_id/datasets/$dataset_id/refreshes"
Invoke-RestMethod -Headers $token -Uri $url -Method Post