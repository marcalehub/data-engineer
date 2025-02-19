////////////////////////////////////////////////////////////////////////////////////////////////////
//Dinamic Query using M language, passing variable define through the stament to avoid reworks    //
//This is a simple example of how to create a dinamic query using M language, passing variables to the query to avoid reworks.
//In this example, we are creating a query that filters a table by a date field, using the start and end of the year as the filter.
//The start and end dates are defined as variables in the query, and then used in the filter condition.
//This way, if the start or end date changes, we only need to update the variables in the query, and the filter will be applied correctly.
//This is a simple example, but the same principle can be applied to more complex queries with multiple filters and conditions.
////////////////////////////////////////////////////////////////////////////////////////////////////
let
    #"start_date" = DateTime.ToText(Date.StartOfYear(DateTime.LocalNow()), "MM-dd-yy"),
    #"end_date" = DateTime.ToText(Date.EndOfYear(DateTime.LocalNow()), "MM-dd-yy"),
    Dinamic_Query = "
    Select
        *
    From 
        table
    where
        date_fiel >= to_date('"&#"start_date"&"', 'MM-dd-yy') and date_fiel <= to_date('"&#"end_date"&"
    "
in
    Dinamic_Query