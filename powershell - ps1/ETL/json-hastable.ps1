"""
####################################################################################################
This script helps you to understand simply json or hastable structure.
####################################################################################################
"""
$json = [PSCustomObject]@(
    @{
        Name = "NAME"
        Age = 24
        Month = 0.9
    }
)
$json | ForEach-Object{
    $_["Current Age"] = $_.Age + $_.Month
}
$json