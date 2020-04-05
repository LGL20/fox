Parameter tx
fnd=iif(Found(), m.tx+':Ý', '')
Do While Found()
	fnd=m.fnd+'Ý'+StayInf()
	if Occurs('Ý', m.fnd)>8
		fnd=m.fnd+'Ý...'
		Exit
	endif
	Continue
EndDo
Use
Return m.fnd
