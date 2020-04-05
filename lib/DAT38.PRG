Parameter date
Return iif(m.date='   ', CtoD(''),;
	CtoD('1.1.1900')+asc(Left(m.date, 1))*65025;
	+asc(Subst(m.date, 2, 1))*255+asc(Righ(m.date, 1)))
