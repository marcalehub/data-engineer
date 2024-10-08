----------------------------------------------------------------------------------------------------
--Create Table--
----------------------------------------------------------------------------------------------------
create or replace table table_name(
field1 string,
field2 TIMESTAMP,
field3 int,
primary key (field3) --warning: primary key must be a single field or combination of fields which are unique
) STORED AS KUDU; --if you create the table without kudo you cannot make changes in the future, this applies to Apache Impala DB