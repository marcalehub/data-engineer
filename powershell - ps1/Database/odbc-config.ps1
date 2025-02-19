"""
####################################################################################################
This script helps you to setting up odbc dsn to run query against database.

Pre-requisites:
1. Powershell
2. ODBC driver:
    - Install the ODBC driver

Steps:
1. Provide the name of the DSN:
    - set-odbc -name "DSN_NAME"
2. The script will create the DSN with the provided name
3. You can use the DSN to run queries against the database
4. Run the script
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