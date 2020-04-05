Parameter equal, rpl
Private temp
temp=TempName()
Index on &equal to (m.temp) Compact
equal=m.equal+'=m.'+Strt(m.equal, '+', '+m.')
Do While !Eof()
	Scatter Memvar
	Skip
	if &equal
		Skip -1
		Delete
		Skip
		Replace &rpl
	endif
EndDo
Set Index to
Delete File (m.temp)
