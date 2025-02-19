// The function takes four parameters: 

// left  - the left table 
// right  - the right table 
// field  - New Col Name
// return  - the field to return 
// key_Field - the column you want to match on both tables

// The function then adds a new column to the left table that contains the value of the  return  field from the right table. 
// The function uses the  Table.SelectRows  function to filter the right table to only rows that contain the value of the  field  parameter. 
// The function then uses the  Table.RowCount  function to check if there are any rows in the filtered table. If there are, it returns the value of the  return  field from the first row. 
// If there are no rows in the filtered table, it returns  null.

(left as table, right as table, field as text, return as text)=>
let
    #"contains-join" = Table.AddColumn(left, field, each 
        let
            match = Table.SelectRows(right, (row) => if _[key_Field_Left] <> ""  then Text.Contains(row[key_Field_Right], _[key_Field_Left]) else null)
        in
            if Table.RowCount(match) > 0 then Record.Field(match{0}, return) else null
    )
in #"contains-join"