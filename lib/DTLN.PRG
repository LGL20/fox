Parameter tx, female
Private x, y, z
x=Right(m.tx, 3)
y=Subs(m.x, 2, 1)
z=Right(m.x, 1)
x=Left(m.x, 1)
if m.female
	if m.x+m.y+m.z='ова' or m.y+m.z='ая'
		z='ой'
		y=iif(Glasn(m.y), '', m.y)
	else
		z=iif(Glasn(m.z), 'е', m.z+iif(Glasn(m.y), 'е', ''))
	endif
endif
Return Left(m.tx, Len(m.tx)-3)+m.x+m.y+m.z
