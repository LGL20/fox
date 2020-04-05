Parameter path
Private error
Set Talk off
if Empty(m.path)
	path=''
endif
On Error error=.t.
=pck(m.path)
On Error
Quit

Func pck
Parameter path
Private file
	file = SYS(2000, m.path+"*.dbf")
	Do While .t.
		Use (m.path+m.file) Excl
		if Used()
			DELETE TAG ALL
			Pack
		endif
		file=SYS(2000, path+"*.dbf", 1)
		if ''=m.file
			Exit
		endif
	EndDo
Return .t.
