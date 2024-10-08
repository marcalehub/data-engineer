"""
####################################################################################################
Dinamic Query using Python, passing variable define through the stament to avoid reworks
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