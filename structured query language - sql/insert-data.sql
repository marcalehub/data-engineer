
----------------------------------------------------------------------------------------------------
--Insert Data--
----------------------------------------------------------------------------------------------------
create or replace table table_name(
field1 string,
field2 int
primary key (field1)
) STORED AS KUDU; 

insert into table_name (
field1,
field2
)
values ("Hola Mundo", 0);