Parameter tx
fnd=iif(Found(), m.tx+':�', '')
Do While Found()
	fnd=m.fnd+'�'+StayInf()
	if Occurs('�', m.fnd)>8
		fnd=m.fnd+'�...'
		Exit
	endif
	Continue
EndDo
Use
Return m.fnd
