"""
####################################################################################################
This script helps you to peform simple etl.
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
$table | foreach-object {
    $_["Column_Name"] = $_.Column_Name_1 * $_.Column_Name_2
}
$odbc.Close()
$table | Export-Csv -path .\"table-name.csv" -NoTypeInformation