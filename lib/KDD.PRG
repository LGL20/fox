para i
priv c,j,v,r,s,e,exac,deci, minus
exac=Set("exac")
Set Exac on
c=255
if m.i<0
	minus='-'
	i=Abs(m.i)
else
	minus=' '
endi

if Int(i)=i
	deci=0
else
	deci=(i-Int(i))*100
	i=Int(m.i)
endi
j=0
do whil c**j<i
	j=j+1
endd
if j>0
	j=j-1
endi
e=''
for v=j to 0 step -1
	r=c**v
	s=int(i/r)
	e=chr(iif(s=141,142,iif(s=13,14,s)))+e
	i=roun(i-s*r,0)
endf
=exac()
retu m.minus+m.e+chr(m.deci)
*retu e+chr(m.deci)+chr(0)
