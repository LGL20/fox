Para i, deci
Priv c,l,e,v,j,x, minus
	minus=iif(Left(m.i,1)='-', -1,1)
	i=Stuf(Rtri(m.i),1,1,'')
	*do whil righ(m.i,1)=chr(0)
	*	i=Left(m.i,Len(m.i)-1)
	*endd
	if Empt(m.deci) or m.deci<=0
		Stor 0 to x, deci
	else
		x=asc(Righ(m.i,m.deci))
		i=Left(m.i,Len(m.i)-m.deci)
	endi
	****
	do whil righ(m.i,1)=chr(0)
		i=Left(m.i,Len(m.i)-1)
	endd
	****
	e=0
	c=255
	l=len(i)
	for v=1 to l
		j=asc(subs(i,v,1))
		if j=0
			exit
		endi
		e=e+j*(c**(v-1))
	endf
Retu m.minus*(m.e+(0.01**deci)*x)
