"""
####################################################################################################
Dinamic Query using Python, passing variable define through the stament to avoid reworks

Pre-requisites:
1. Python

Steps:
1. The query will be stored in Dinamic_Query
2. Use the Dinamic_Query as required
3. Replace table with your table name
4. The query will be stored in Dinamic_Query
5. Use the Dinamic_Query as required
6. Replace date_field with your date field
7. Run the script
####################################################################################################
"""
from datetime import datetime as dt
start_date = dt((dt.now()).year, 1, 1).strftime("%m-%d-%y")
end_date = dt((dt.now()).year, 12, 31).strftime("%m-%d-%y")
Dinamic_Query = f"""
Select
    *
From 
    table
where
    date_fiel >= to_date('{start_date}', 'MM-dd-yy') and date_fiel <= to_date('{end_date}', 'MM-dd-yy')
"""
print(Dinamic_Query) 