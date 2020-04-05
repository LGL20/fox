Parameter error, tx
if m.error
	Private i, s
	i=0
	s=''
	Do While ''#Sys(16, m.i)
		s=m.s+chr(13)+Sys(16, m.i)
		i=m.i+1
	EndDo
	i=TTOC(DateTime(), 1)
	Save to (m.i)
	Create View (m.i)
	=MessageBox(m.tx, 16, 'Ошибка!')
endif
On Error
Return !m.error
