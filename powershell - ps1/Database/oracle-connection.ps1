"""
####################################################################################################
This script helps you to run query on oracle database
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