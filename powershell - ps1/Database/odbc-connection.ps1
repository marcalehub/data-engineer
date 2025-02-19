"""
####################################################################################################
This script helps you to run query on odbc 

Pre-requisites:
1. Powershell
2. ODBC driver

Steps:
1. Run the script
2. Provide the DSN, USER_ID, PASSWORD and the query
3. The script will run the query and return the result 
4. You can use the result for further processing
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