"""
####################################################################################################
This script helps you to run query on odbc

Pre-requisites:
1. Python
2. Pandas
3. Pyodbc
4. ODBC Driver

Steps:
1. Install pandas using pip
2. Install pyodbc using pip
3. Install ODBC Driver
4. Run the script
5. Replace DSN, USER, PASSWORD, table with your values
6. Run the script
7. The query result will be stored in dataframe
8. Close the connection
9. Use the dataframe as required

####################################################################################################
"""
from pyodbc import database_engine
from pandas import read_sql, DataFrame
connection = database_engine.connect(f"DSN=DSN; UID=USER; PWD=PASSWORD")
query = """
    select
        *
    from 
        table
"""
read = read_sql(query, connection)
df = DataFrame(read)
connection.Close()