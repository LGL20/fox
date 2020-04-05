para i
priv c,j,v,r,s,e,exac
if Type('m.i')#'N'
	Return ''
endif
exac=Set("exac")
Set Exac on
c=255
j=0
do whil c^j<i
	j=j+1
endd
if c^j>i
	j=j-1
endi
e=''
for v=j to 0 step -1
	r=c^v
	s=int(i/r)
	**e=chr(iif(m.s=141,142,iif(m.s=13,14,m.s)))+e
	e=chr(m.s)+e
	i=roun(i-m.s*r,0)
endf
Do exac
retu e+chr(0)
