----------------------------------------------------------------------------------------------------
--Running Totals--
----------------------------------------------------------------------------------------------------
with running_total(
    select
        order_number,
        sum(amount) over (PARTITION by order_number order by amount desc rows between unbounded preceding and current row) as "Running Total"

    from   
        table
)
select * from running_total order by
                                    "Running Total $" asc