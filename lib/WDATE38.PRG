Parameter date
Return iif((m.win and isNull(m.date)) or ''=Trim(m.date) or m.date=chr(0)+chr(0)+chr(0),;
	CtoD(''),;
	CtoD('30.12.1899') + (asc(Left(m.date, 1))-1)*65025;
	+(asc(Subst(m.date, 2, 1))-1)*255+asc(Righ(m.date, 1)) - 693593-1)
