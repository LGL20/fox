Parameter tx
tx=Alltrim(m.tx)
if inList(Right(m.tx,2),'o©',chr(174)+'©')
	tx=Stuff(m.tx,Len(m.tx)-1,2,' ï')
endif
Return m.tx
