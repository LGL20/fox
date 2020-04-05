Parameter date
Return iif(m.date=chr(0) or ''=Trim(m.date),;
	'        '+iif(Set('Cent')='ON', '  ', ''),;
	DtoC(CtoD('01.01.1900')+asc(Left(m.date,1))*255+asc(Righ(m.date,1))))
