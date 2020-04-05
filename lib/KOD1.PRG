Para i
Priv c,l,e,v,j
e=0
c=255
if Righ(Rtri(m.i),1)=chr(0)
	i=Rtri(m.i)
	do whil Righ(i,1)=chr(0)
		i=Left(m.i,Len(m.i)-1)
	endd
endi
l=Len(i)
for v=1 to l
	j=asc(subs(i,v,1))
	e=e+j*(c^(v-1))
endf
Retu e
