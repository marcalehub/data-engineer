"""
####################################################################################################
This script helps you to run query on oracle database

Pre-requisites:
1. Python
2. Pandas
3. cx_Oracle
4. Oracle Client

Steps:
1. Install pandas using pip
2. Install cx_Oracle using pip
3. Install Oracle Client
4. Run the script
5. Replace username, password, server, table with your values
6. Run the script
7. The query result will be stored in dataframe
8. Close the connection
9. Use the dataframe as required

####################################################################################################
"""
from cx_Oracle import database_engine
from pandas import read_sql, DataFrame
connection = database_engine.connect('username', 'password', 'server')
query = """
    select
        *
    from 
        table
"""
read = read_sql(query, connection)
df = DataFrame(read)
connection.Close()