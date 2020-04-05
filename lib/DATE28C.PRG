Para date
Return iif(m.date=chr(0),'        ',DtoC(CtoD('31.12')+asc(Left(m.date,1))*255+asc(Righ(m.date,1))))
