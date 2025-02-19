----------------------------------------------------------------------------------------------------
--Create View--
--Create a new view in the database.
--The CREATE VIEW statement is used to create a view in a database.
--The view_name is the name of the view.
--The view is a virtual table that consists of columns from one or more tables.
--The view does not store data in the database.
--The view is a result set of a stored query.
----------------------------------------------------------------------------------------------------
create or replace view view_name as 

with table_1 as (

    select   
    item_number,
    item_desc, 
        ROW_NUMBER() OVER (  
        PARTITION BY item_number ORDER BY item_number DESC  
        )AS row_number  
        
    from
        library_name.table_name
)

    select
        *
        from table_1
            where row_number = 1  
;