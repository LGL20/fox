Parameter path, open
Local default, template, last, rtf, docum, on_error, error
template = m.path + 'template.rtf'
if !File(m.template)
	default = m.template
	dir=Full('')
	Set Default to (m.path)
	template = GetFile('rtf','Шаблон')
	Set Default to &dir
	if ''#m.template
		Copy File (m.template) to (m.default)
	endif
endif
if ''=m.template
	MessageBox('Шаблон не найден', 16, 'Поиск шаблона документа')
else
	rtf = FILETOSTR(m.template)
	docum = 'просмотр.rtf'
	if File(m.docum)
		last = FiletoStr(m.docum)
		x = At('{\stylesheet', m.last)
		p = At('{\stylesheet', m.rtf)
		if m.x>0 and m.p>0
			rtf = Stuff(m.rtf, m.p, At('}}', Stuff(m.rtf, 1, m.p, '')),;
				Subst(m.last, m.x, At('}}', Stuff(m.last, 1, m.x, ''))))
		endif
	endif
	if m.open
		StrtoFile(m.rtf, m.template)
		on_error=On('Error')
		On Error error=.t.
		Delete File (Full(m.docum))
		On Error &on_error
	endif
endif
*Return iif(m.open, m.template, m.rtf)
Return m.template