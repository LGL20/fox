Parameter date
Return iif(''=Trim(m.date) or m.date=chr(0)+chr(0)+chr(0), '        ', DtoC(wdate38(m.date)))