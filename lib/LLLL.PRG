Parameter e
Private n, i, b, p, m, o, x, q, SepNow, PosSep, sep, s, v
n=aLen(e)
v=3
Declare e[n], b[n], s[m.v,2]
Store 1 to o, m, s
s[1,1]='³'
s[2,1]='Ý'
s[3,1]='°'
do while m<Len(e)
	Store 0 to m, PosSep
	sep=1
	for i=1 to m.v
		p=At(s[i,1], e, s[i,2])
		if m.p>0 and (m.PosSep=0 or m.p<m.PosSep)
			PosSep=m.p
			sep=m.i
		endif
	endfor
	SepNow=s[m.sep, 1]
	j=s[m.sep, 2]
	for i=1 to n
		p=At(m.SepNow, e[i], m.j)
		if m.p=0
			p=Len(e[i])+1
		endif
		m=Max(m.m, m.p)
		b[i]=m.p
	endfor
	for i=1 to n
		x=Subst(e[i], m.o, b[i]-m.o)
		q=m.m-m.o
		e[i]=Stuff(e[i], m.o, b[i]-m.o, iif(m.i=1, PadC(m.x, m.q),;
			iif(''=Chrt(m.x, "1234567890-.,'", ''), PadL(m.x, m.q),;
			PadR(m.x, m.q))))
	endfor
	s[m.sep, 2]=m.j+1
	o=m.m+1
enddo
n=Len(e)
lin=''
for i=1 to n
	x=Subst(e, m.i, 1)
	lin=m.lin+iif(m.x='³', 'Å', iif(At(m.x, 'Ý°')=0, 'Ä', m.x))
endfor
if m.lin='Å'
	lin=Stuff(m.lin, 1, 1, 'Ã')
endif
if Right(m.lin, 1)='Å'
	lin=Left(m.lin, Len(m.lin)-1)+'´'
endif
