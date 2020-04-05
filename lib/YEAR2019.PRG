Parameter year
if m.year=chr(0)+chr(0) or m.year='  '
	Return 0
endif
year=asc(m.year)
Return iif(m.year<80, 2000, 1900)+m.year
