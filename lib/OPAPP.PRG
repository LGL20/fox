Parameter DocName, param
Private unVisible, app, docApp
if Empty(m.DocName)
	MessageBox('�� ������ ��� �����', 16, '�������� �����')
else
	Store '' to app, docApp
	Do GetApp with m.DocName, m.app, m.docApp, .t.
	if m.app='.'
		MessageBox('����������� ��� ���������� ��� ����� '+m.DocName, 16,;
			'������� ������� ���� ����������')
	else
		unVisible = .f.
		=keypar(m.param)
		With m.docApp
			.Visible = .Visible or !m.unVisible
			if File(m.DocName)
				if m.app="w"
					docApp = .Documents.Open(m.DocName, .f., .f., .f., '', '', .t.)
					With m.docApp
						Store .f. to .ShowGrammaticalErrors, .ShowSpellingErrors
					EndWith
				else
					*.Workbooks.Open(m.DocName,.t.,.t.,.t.,.t.,.t.,.t.,.t.,.t.,.t.,.t.,.t.,.t.).RefreshAll
					.Workbooks.Open(m.DocName).RefreshAll
					*rr=JustFName(m.DocName)
					*.Workbooks(m.rr).Save
					.Workbooks(JustFName(m.DocName)).Save
					*qq= .Workbooks(m.rr)
					*qq.Save
				endif
			endif
			Return m.docApp
		EndWith
	endif
endif
Return null