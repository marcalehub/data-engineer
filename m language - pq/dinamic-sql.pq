////////////////////////////////////////////////////////////////////////////////////////////////////
//Dinamic Query using M language, passing variable define through the stament to avoid reworks    //
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