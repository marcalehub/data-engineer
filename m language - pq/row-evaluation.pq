////////////////////////////////////////////////////////////////////////////////////////////////////
//Evaluate a column base on previous value//
////////////////////////////////////////////////////////////////////////////////////////////////////
let
    Source = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("i45WMjQwMDIwVorVATKNjA3ADCBtYmACETQ1MYCKmhkAgalSbCwA", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [Value = _t]),
    #"Added Index" = Table.AddIndexColumn(Source, "Index", 0, 1, Int64.Type),
    #"Currency Values" = Table.TransformColumnTypes(#"Added Index",{{"Value", Currency.Type}}),
    #"Added Evaluation" = Table.AddColumn(#"Currency Values", "Increase/Decrease Value", each if [Index] = 0 then "-" else if [Value] > #"Currency Values"{[Index]-1}[Value] then "Increase" else "Decrease"),
    #"Changed Type" = Table.TransformColumnTypes(#"Added Evaluation",{"Increase/Decrease Value", type text}),
    #"Reordered Columns" = Table.ReorderColumns(#"Changed Type",{"Value", "Increase/Decrease Value", "Index"})
in
  #"Reordered Columns"