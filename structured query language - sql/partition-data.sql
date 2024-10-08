----------------------------------------------------------------------------------------------------
--Partition By--
----------------------------------------------------------------------------------------------------
select
    * from (
    select 
        order_number,
        ROW_NUMBER() over (PARTITION by order_number ORDER BY order_number DESC) as "Partition"
        from   
            table
        )
where "Partition" = 1