"""
####################################################################################################
This script helps you to setting up odbc dsn to run query against database.
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