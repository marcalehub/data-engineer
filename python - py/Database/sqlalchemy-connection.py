"""
####################################################################################################
This script helps you to run query from different databases

Pre-requisites:
1. Python
2. Pandas
3. SQLAlchemy
4. Database Engine

Steps:
1. Install pandas using pip
2. Install SQLAlchemy using pip
3. Install Database Engine
4. Run the script
5. Replace 'oracle://user:password@host:port/database' with your values
6. Run the script
7. The query result will be stored in dataframe
8. Close the connection
9. Use the dataframe as required

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