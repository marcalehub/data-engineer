----------------------------------------------------------------------------------------------------
--Create Table--
--Create a new table in the database.
--The CREATE TABLE statement is used to create a new table in a database.
--The table_name is the name of the table.
--The field1, field2, field3, ... are the names of the columns in the table.
--The data type specifies what type of data the column can hold.
--The primary key is a field or combination of fields that uniquely identifies each row in the table.
--The primary key constraint uniquely identifies each record in a database table.
----------------------------------------------------------------------------------------------------
create or replace table table_name(
field1 string,
field2 TIMESTAMP,
field3 int,
primary key (field3) --warning: primary key must be a single field or combination of fields which are unique
) STORED AS KUDU; --if you create the table without kudo you cannot make changes in the future, this applies to Apache Impala DB