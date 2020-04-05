Parameter tx
Private p
tx=Alltrim(m.tx)
Do while .t.
	p=At('  ', m.tx)
	if m.p=0
		Exit
	endif
	tx=Strt(m.tx, '  ', ' ')
EndDo
Return m.tx
