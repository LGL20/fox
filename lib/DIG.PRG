Para x
Priv i,l
i=0
x=Allt(m.x)
l=Len(m.x)
do whil m.i<m.l and inLi(Subs(m.x,m.l-m.i,1), '1','2','3','4','5','6','7','8',;
	'9','0','.')
	i=m.i+1
endd
Retu Subs(m.x,m.l-m.i+1,m.i)
