Parameter name, UnVisible, SaveAs
Private error, TemplateName
TemplateName='Шаблон '+m.name+'.xls'
FileName=m.PathUser+m.name+'.xls'
if File(m.TemplateName)
	if m.SaveAs
		error=Full('')
		Set Default to ('C:\Мои документы')
		FileName = PutFile('Имя файла:', m.name, 'xls')
		Set Default to (m.error)
	endif
	if ''#m.FileName
		error=.f.
		On Error error=.t.
		Copy File (m.TemplateName) to (m.FileName)
		On Error
		if m.error
			MessageBox('Файл "'+m.FileName+'" уже открыт', 16, 'Ошибка создания файла')
		else
			OleApp = CREATEOBJECT("Excel.Application")
			With OleApp
				.Visible=!m.UnVisible
				.Workbooks.Open(m.FileName)
			EndWith
			Return .t.
		endif
	endif
else
	MessageBox('Не найден файл "'+m.TemplateName+'"', 16, 'Не найден файл')
endif
Return .f.