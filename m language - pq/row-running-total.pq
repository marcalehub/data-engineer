////////////////////////////////////////////////////////////////////////////////////////////////////
//Running Totals//
////////////////////////////////////////////////////////////////////////////////////////////////////
let
    Source = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("i45WMjQwMDIwVorVATKNjA3ADCBtYmACETQ1MYCKmhkAgalSbCwA", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [Value = _t]),
    #"Added Index" = Table.AddIndexColumn(Source, "Index", 1, 1, Int64.Type),
    #"Currency Values" = Table.TransformColumnTypes(#"Added Index",{{"Value", Currency.Type}}),
    #"Added Running Totals" = Table.AddColumn(#"Currency Values", "Running Totals", each List.Sum(
    List.FirstN( 
        #"Currency Values"[Value],
        [Index]
     ))),
    #"Changed Type" = Table.TransformColumnTypes(#"Added Running Totals",{{"Running Totals", Currency.Type}}),
    #"Reordered Columns" = Table.ReorderColumns(#"Changed Type",{"Value", "Running Totals", "Index"})
in
  #"Reordered Columns"