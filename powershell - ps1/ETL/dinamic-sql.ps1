"""
####################################################################################################
Dinamic Query using Powershell, passing variable define through the stament to avoid reworks

Pre-requisites:
1. Powershell

Steps:
1. Run the script
2. The script will return the query with the date range
3. You can use the query for further processing
####################################################################################################
"""
$start_date = get-date -Year (get-date).Year -Month 1 -Day 1 -format "MM-dd-yy"
$end_date = get-date -Year (get-date).Year -Month 12 -Day 31 -format "MM-dd-yy"
$Dinamic_Query = "
Select
    *
From 
    table
where
    date_fiel >= to_date('$start_date', 'MM-dd-yy') and date_fiel <= to_date('$end_date', 'MM-dd-yy')
"
write-host $Dinamic_Query