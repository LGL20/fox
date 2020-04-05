Parameter files
Private t, path, error
path=Rat('\', m.files)
path=iif(m.path=0, '', Left(m.files, m.path))
t=SYS(2000, m.files)
On Error error=.t.
Do While ''#m.t
	Delete File (Full(m.t, m.path))
	t=SYS(2000, m.files, 1)
EndDo
On Error