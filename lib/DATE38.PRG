Parameter date
Return iif((m.win and isNull(m.date)) or ''=Trim(m.date) or m.date=chr(0)+chr(0)+chr(0),;
	CtoD(''),;
	firstDat()+asc(Left(m.date, 1))*65025;
	+asc(Subst(m.date, 2, 1))*255+asc(Righ(m.date, 1)))
*Ctod('1.1.1001')
*Return iif((m.win and isNull(m.date)) or m.date='   ', CtoD(''),;
	Ctod('1.1.1001')+asc(Left(m.date, 1))*65025;
	+asc(Subst(m.date, 2, 1))*255+asc(Righ(m.date, 1)))
