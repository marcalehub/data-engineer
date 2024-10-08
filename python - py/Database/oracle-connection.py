"""
####################################################################################################
This script helps you to run query on oracle database
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