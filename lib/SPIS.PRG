Para x,a,n
n=0
if !Empt(m.x)
	Priv p,y
	y=m.x
	do whil .t.
		n=m.n+1
		Decl a[m.n]
		p=At(',',m.y)
		if m.p=0
			a[m.n]=m.y
			exit
		else
			a[m.n]=Left(m.y, m.p-1)
			y=Subs(m.y,m.p+1,Len(m.y))
		endi
	endd
endi
