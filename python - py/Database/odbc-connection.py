"""
####################################################################################################
This script helps you to run query on odbc
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