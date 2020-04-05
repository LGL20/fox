Parameter tx, female
Private x, y, z
x=Right(m.tx, 3)
y=Subs(m.x, 2, 1)
z=Right(m.x, 1)
x=Left(m.x, 1)
if m.female
	if Glasn(m.y)
		z='i'
	else
		Do Case
		Case m.z='я'
			z='ii'
			if m.y='ь'
				y=''
			endif
		Case m.z='а'
			z=iif(m.y='в' and Glasn(m.x), 'ой', 'i')
		EndCase
	endif
endif
Return Left(m.tx, Len(m.tx)-3)+m.x+m.y+m.z
