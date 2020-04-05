Parameter tx
tx=Alltrim(m.tx)
if inList(Right(m.tx,2),'oй',chr(174)+'й')
	tx=Stuff(m.tx,Len(m.tx)-1,2,'ая')
endif
Return m.tx
