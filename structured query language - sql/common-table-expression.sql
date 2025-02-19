----------------------------------------------------------------------------------------------------
--CTE/Common Table Expression--

--CTE is a temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement.
--CTE is defined using the WITH keyword.
--CTE is defined within the execution scope of a single SELECT, INSERT, UPDATE, DELETE, or CREATE VIEW statement.
--CTE can be self-referencing or can reference other CTEs.
--CTE can be referenced multiple times in the same query.
--CTE can be used to create a recursive query.
--CTE is not stored as an object in the database.
--CTE is only valid for the execution scope of a single query.
----------------------------------------------------------------------------------------------------
with CTE(
    select
        order_number,
        amount
    from   
        table
)
select * from CTE