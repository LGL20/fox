Parameter name, UnVisible, SaveAs
Private error, TemplateName
TemplateName='������ '+m.name+'.xls'
FileName=m.PathUser+m.name+'.xls'
if File(m.TemplateName)
	if m.SaveAs
		error=Full('')
		Set Default to ('C:\��� ���������')
		FileName = PutFile('��� �����:', m.name, 'xls')
		Set Default to (m.error)
	endif
	if ''#m.FileName
		error=.f.
		On Error error=.t.
		Copy File (m.TemplateName) to (m.FileName)
		On Error
		if m.error
			MessageBox('���� "'+m.FileName+'" ��� ������', 16, '������ �������� �����')
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
	MessageBox('�� ������ ���� "'+m.TemplateName+'"', 16, '�� ������ ����')
endif
Return .f.