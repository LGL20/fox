Private error
Set Talk off
Set Exac off
On Error error=.t.
=pck("") and pck("data\") and pck("system\") and pck("user\")
On Error
Quit

Func pck
Parameter path
Private file
	file = SYS(2000, m.path+"*.dbf")
	Do While .t.
		Use (m.path+m.file) Excl
		if Used()
			if Type('id')="C"
				Delete For id=' '
			else
				Delete For id=0
			endif
			Pack
			if _TALLY=0
				Reindex
			endif
		endif
		file=SYS(2000, path+"*.dbf", 1)
		if ''=m.file
			Exit
		endif
	EndDo
Return .t.
