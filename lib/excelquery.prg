Parameter name, okk, dop, close
Private done, OleApp, fname
fname = m.name+'.xls'
done = File(m.fname)
Wait Clear
if m.done
	OleApp = opApp(m.fname)
	With m.OleApp
		fname=JustFileName(m.fname)
		.Workbooks(fname).RefreshAll
		*.Workbooks(1).RefreshAll
		*.Worksheets(1).Borders.LineStyle = 0
		*Select
		*With .ActiveSheet.PivotTables(1)
		*	Store 1 to .DataBodyRange.Borders.LineStyle,;
		*		.ColumnRange.Borders.LineStyle,	.DataLabelRange.Borders.LineStyle
		*EndWith
		*.Worksheets(1).PivotTables(1).Range.Select
    	*.Worksheets(1).Visible = .f.
		*.QueryTables(1).Range.Select
		*.Worksheet(1).PivotTables(1).Range.Select
		*.Borders.LineStyle = 0
		*.Workbooks(1).PivotTables(1).Borders.LineStyle = 0
		.Cells(1,1) = JustFName(m.name)+' '+m.okk
		if !Empty(m.dop) and Type('m.dop')="C"
			Do (m.dop)
		endif
		.ActiveWorkbook.Saved=.t.
		if m.close
			.OleApp.Close
		endif
	EndWith
else
	MessageBox('Не найден файл "'+m.fname+'"', 16, 'Не найден файл')
endif
Return m.done
