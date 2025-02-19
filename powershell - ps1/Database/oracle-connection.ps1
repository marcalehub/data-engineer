"""
####################################################################################################
This script helps you to run query on oracle database

Pre-requisites:
1. Powershell
2. OracleClient

Steps:
1. Run the script
2. Provide the server, user_id, password and the query
3. The script will run the query and return the result
4. You can use the result for further processing
####################################################################################################
"""
Add-Type -AssemblyName System.Data.OracleClient
$oracle = new-object system.data.OracleClient.oracleconnection
$oracle.ConnectionString = "Data Source=Server; User=UID; Pwd=PWD"
$oracle.open()
$query ='
    select
        *
    from 
        table
'
$command = $oracle.CreateCommand()
$command.CommandText = $query
$dataframe = New-Object System.Data.OracleClient.OracleDataAdapter($command)
$table = New-Object System.Data.DataTable
$dataframe.Fill($table)
$oracle.close()