para i, len
priv c,j,v,r,s,e,exac
exac=Set("exac")
Set Exac on
c=255
j=0
do whil c**j<i
	j=j+1
endd
e=''
for v=j to 0 step -1
	r=c**v
	s=int(i/r)
	e=chr(iif(s=141,142,iif(s=13,14,s)))+e
	i=roun(i-s*r,0)
endf
=exac()
Retu PadR(m.e,m.len,chr(0))
