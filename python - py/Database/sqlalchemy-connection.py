"""
####################################################################################################
This script helps you to run query from different databases
####################################################################################################
"""
from sqlalchemy import database_engine
from pandas import read_sql, DataFrame
connection = database_engine('oracle://user:password@host:port/database').connect()
query = """
    select
        *
    from 
        table
"""
read = read_sql(query, connection)
df = DataFrame(read)
connection.Close()