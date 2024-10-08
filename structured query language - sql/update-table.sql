
----------------------------------------------------------------------------------------------------
--Update data--
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

update table_name
set field1 = 'Hello World',
where field2 = 0;