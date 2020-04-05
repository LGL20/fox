Parameter e
Private i, p, m, o, x, SepNow, sep, s, v
v=3
Declare s[m.v,2]
Store 1 to o, s
s[1,1]='³'
s[2,1]='Ý'
s[3,1]='°'
do while .t.
	Go Top
	m=0
	for i=1 to m.v
		p=At(s[i,1], tx, s[i,2])
		if m.p>0 and (m.m=0 or m.p<m.m)
			m=m.p
			sep=m.i
		endif
	endfor
	if m.m=0
		Exit
	endif
	SepNow=s[m.sep, 1]
	j=s[m.sep, 2]
	s[m.sep, 2]=m.j+1
	Scan
		p=At(m.SepNow, tx, m.j)
		if m.p=0
			p=Len(Trim(tx))+1
		endif
		m=Max(m.m, m.p)
	EndScan
	m=m.m-m.o
	Scan
		p=At(m.SepNow, tx, m.j)-m.o
		x=Subst(tx, m.o, m.p)
		Replace tx with Stuff(tx, m.o, m.p, iif(m.i=1, PadC(m.x, m.m),;
			iif(''=Chrt(m.x, "1234567890-.,'", ''), PadL(m.x, m.m),;
			PadR(m.x, m.m))))
	EndScan
	o=m.o+m.m+1
enddo
Go Bottom
lin=''
n=Len(tx)
for i=1 to n
	x=Subst(tx, m.i, 1)
	lin=m.lin+iif(m.x='³', 'Å', iif(At(m.x, 'Ý°')=0, 'Ä', m.x))
endfor
if m.lin='Å'
	lin=Stuff(m.lin, 1, 1, 'Ã')
endif
if Right(m.lin, 1)='Å'
	lin=Left(m.lin, Len(m.lin)-1)+'´'
endif
