Para date
Retu iif(m.date=chr(0) or m.date='  ', CtoD(''),;
	CtoD('01/01')+asc(Left(m.date,1))*255+asc(Righ(m.date,1)))
