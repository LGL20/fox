Parameter mute
rec=RecNo()
fou=!Bof()
if m.fou
	Skip -1
	fou=!Bof() and RecNo()#m.rec
endif
=rez('Первый')
