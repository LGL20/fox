Parameter mute
rec=RecNo()
fou=!Eof()
if m.fou
	Skip
	fou=!Eof() and RecNo()#m.rec
endif
=rez('Последний')
