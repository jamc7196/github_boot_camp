Sub stockperyear()

For Each ws In Worksheets
ws.Activate

Dim Ticker As String
Dim Yearly_Open As Double
Dim Yearly_close As Double
Dim Total_Stock_Volume As Double
Dim Max_Ticker As String
Dim Min_Ticker As String
Dim Max_percentch As Double
Dim Min_Percentch As Double
Dim Max_VT As String
Dim Max_Volume As Double
'Dim GreatestIncrease As Double
'Dim GreatestDecrease As Double
'Dim GreatestTotalVolume As Double



Ticker = " "
Yearly_Open = 0
Yearly_close = 0
Total_Stock_Volume = 0
'GreatestIncrease = 0
'GreatestDecrease = 0
'GreatestTotalVolume = 0
Max_Ticker = " "
Min_Ticker = " "
MAX_percenth = 0
Min_Percentch = 0
Max_VT = " "
Max_Volume = 0

Dim Summary_Table_Row As Long
Summary_Table_Row = 2

Cells(1, 9).Value = "Ticker"
Cells(1, 10).Value = "Yearly Change"
Cells(1, 11).Value = "Porcentage Change"
Cells(1, 12).Value = "Total Stock Volume"
Cells(2, 15).Value = "Greatest % Increase"
Cells(3, 15).Value = "Greatest % Decrease"
Cells(4, 15).Value = "Greatest Total Volume"
Cells(1, 16).Value = "Ticker"
Cells(1, 17).Value = "Value"

lastrow = Cells(Rows.Count, 2).End(xlUp).Row
Yearly_Open = Cells(2, 3).Value

For i = 2 To lastrow
If Cells(i + 1, 1).Value <> Cells(i, 1).Value Then
Yearly_close = Cells(i, 6).Value
Yearly_change = Yearly_close - Yearly_Open
If Yearly_Open <> 0 Then
Percentage_Change = (Yearly_change / Yearly_Open) * 100
End If
Total_Stock_Volume = Total_Stock_Volume + Cells(i, 7).Value
Ticker = Cells(i, 1).Value

Range("I" & Summary_Table_Row).Value = Ticker
Range("J" & Summary_Table_Row).Value = Yearly_change
Range("K" & Summary_Table_Row).Value = (CStr(Percentage_Change) & "%")
Range("L" & Summary_Table_Row).Value = Total_Stock_Volume
If (Yearly_change > 0) Then
Range("J" & Summary_Table_Row).Interior.ColorIndex = 4
ElseIf (Yearly_change <= 0) Then
Range("J" & Summary_Table_Row).Interior.ColorIndex = 3
End If
Total_Stock_Volume = 0
Summary_Table_Row = Summary_Table_Row + 1
Yearly_change = 0
Yearly_close = 0
Yearly_Open = Cells(i + 1, 3).Value

lastrow1 = Cells(Rows.Count, 11).End(xlUp).Row
For x = 2 To lastrow1
If (Percentage_Change > Max_percentch) Then
Max_percentch = Percentage_Change
Max_Ticker = Ticker
ElseIf (Percentage_Change < Min_Percentch) Then
Min_Percentch = Percentage_Change
Min_Ticker = Ticker
End If
If (Total_Stock_Volume > Max_Volume) Then
Max_Volume = Total_Stock_Volume
Max_VT = Ticker
End If
Next x
Percentage_Change = 0
Total_Stock_Volume = 0
Else
Total_Stock_Volume = Total_Stock_Volume + Cells(i, 7).Value
End If

Next i

'lastrow1 = Cells(Rows.Count, 11).End(xlUp).Row
'For x = 2 To lastrow1
'If ws.Range("K" & i).Value > ws.Range("Q2").Value Then
'ws.Range("K" & i).Value = (CStr(ws.Range("Q2").Value) & "%")
'ws.Range("P2").Value = ws.Range("I" & i).Value
'ElseIf ws.Range("K" & i).Value < ws.Range("Q3").Value Then
'ws.Range("K" & i).Value = (CStr(ws.Range("Q3").Value) & "%")
'ws.Range("P3").Value = ws.Range("I" & i).Value
'End If
'If ws.Range("L" & i).Value > ws.Range("Q4").Value Then
'ws.Range("Q4").Value = ws.Range("L" & i).Value
'ws.Range("P4").Value = ws.Range("I" & i).Value
'End If
'If Not Command_Spreadsheet Then
'Cells(2, 17).Value = (CStr(Max_percentch) & "%")
'Cells(3, 17).Value = (CStr(Min_Percentch) & "%")
'Cells(2, 16).Value = Max_Ticker
'Cells(3, 16).Value = Min_Ticker
'Cells(4, 17).Value = Max_Volume
'Cells(4, 16).Value = Max_VT
'Else
'Command_Spreadsheet = False
'End If
'Next x

If Not Command_Spreadsheet Then
Cells(2, 17).Value = (CStr(Max_percentch) & "%")
Cells(3, 17).Value = (CStr(Min_Percentch) & "%")
Cells(2, 16).Value = Max_Ticker
Cells(3, 16).Value = Min_Ticker
Cells(4, 17).Value = Max_Volume
Cells(4, 16).Value = Max_VT
Else
Command_Spreadsheet = False
End If
Next ws
End Sub
