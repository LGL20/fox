para rr
	if Type('rr')='C'
		rr=CtoD(m.rr)
	endi
	r=year(rr)
Retu chr(r-int(r/100)*100)+chr(mont(rr))+chr(day(rr))
