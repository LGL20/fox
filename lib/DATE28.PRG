Parameter date
Return iif(m.date=chr(0)+chr(0), CtoD(''), CtoD('31.12')+asc(Left(m.date,1))*255+asc(Righ(m.date,1)))
