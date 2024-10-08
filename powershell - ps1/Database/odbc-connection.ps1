"""
####################################################################################################
This script helps you to run query on odbc 
####################################################################################################
"""
$odbc = New-Object System.Data.Odbc.OdbcConnection
$odbc.ConnectionString = "UID=USER_ID; PWD=PASSWORD; DSN=DSN"
$odbc.open()
$query ='
    select
        *
    from 
        table
'
$command = $odbc.CreateCommand()
$command.CommandText = $query
$dataframe = New-Object System.Data.Odbc.OdbcDataAdapter($command)
$table = New-Object System.Data.DataTable
$dataframe.Fill($table)
$odbc.Close()