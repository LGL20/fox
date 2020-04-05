Parameter x, len, digs, nul
if m.x=0
	x=iif(m.nul, iif(Empty(m.digs) or Empty(m.len), '',;
		Space(Max(0, m.len-m.digs-2)))+'0', '')
else
	x=Str(m.x, iif(Empty(m.len), 20, m.len), iif(Empty(m.digs), 5, m.digs))
	do while At('.', m.x)#0 and inList(Right(m.x,1),'0','.')
		x=Stuff(m.x, Len(m.x), 1, '')
	enddo
endif
Return iif(Empty(m.len), AllTrim(m.x), PadR(m.x, m.len))
