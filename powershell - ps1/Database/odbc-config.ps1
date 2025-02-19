"""
####################################################################################################
This script helps you to setting up odbc dsn to run query against database.

Pre-requisites:
1. Powershell
2. ODBC driver

Steps:
1. Run the script
2. Provide the name of the DSN
3. The script will create the DSN with the provided name
4. You can use the DSN to run queries against the database
####################################################################################################
"""
function global:set-odbc{
    param(
        [string]$name
    )
    $dsn = @{
            Name = "$name"
            DsnType = "" #Scope
            Platform = "" #32/64-bit
            DriverName = "" #driver to be use
            SetPropertyValue = @("System = Server", "DefaultLibraries = Default Library")
        }
    foreach ($attribute in $dsn) {
        Add-OdbcDsn -Name $attribute.Name -DriverName $attribute.DriverName -Platform $attribute.Platform -DsnType $attribute.DsnType -SetPropertyValue $attribute.SetPropertyValue
    }
}