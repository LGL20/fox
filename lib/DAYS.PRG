Parameter date
Retu iif(Mont(m.date)=2, iif((Year(m.date)-1996)%4=0, 29, 28),;
	iif(inLi(Mont(m.date),4,6,9,11), 30, 31))
