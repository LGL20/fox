Parameter x, deci, len, int
if m.x=0
	Return ''
endif
if Empty(m.deci)
	deci=Set('Deci')
endif
x=Ltrim(Str(m.x, 40, m.deci))
do while Right(m.x, 1)='0'
	x=Left(m.x, Len(m.x)-1)
enddo
if Right(m.x, 1)='.'
	x=Left(m.x, Len(m.x)-1)
endif
if Type('m.int')="N"
	x=iif(At('.', m.x)=0, PadL(m.x, m.int), Space(Max(0, m.int+1-At('.', m.x)))+m.x)
endif
Return iif(Type('m.len')="N", PadR(m.x, m.len), m.x)
