Parameters row, col, size, prog, var, norm, choosen, NoEnter
size=m.col+m.size-1
if Empty(m.var)
	Do (m.prog)
	ex=LastKey()#27
else
	@ row, col to row, m.size Color (iif(Empty(m.choosen), Scheme(1,2),m.choosen)) Fill
	k=InKey(0,'hm')
	k=m.k=32 or (!m.NoEnter and m.k=13)
	if k and !Empty(m.prog)
		DO (m.prog)
		ex=LastKey()#27
	endif
	@ row, col to row, m.size Color (iif(Empty(m.norm), Scheme(1,1),m.norm)) Fill
endif
Return .t.
