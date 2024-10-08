
"""
####################################################################################################
##Loading to datatabase data from files##
###################################################################################################
"""
from pandas import *
import pyodbc
from os import *
db_excel = read_excel(f"file_name.xlsx")
df = DataFrame(db_excel)
connection = pyodbc.connect("DSN=DSN; UID=USER_ID; PWD=USER_PASSWORD")
cursor = connection.cursor()
for index, row in df.iterrows():
    field1 = row['field1']
    field2 = row['field2']
    sql = f"""
    insert into library_name.table_name(
        field1,
        field2
        )
    values
    (
        "{field1}",
        "{field2}"
    )
    """
    cursor.execute(sql)