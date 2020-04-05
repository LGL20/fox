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
		Case m.z='ï'
			z='ii'
			if m.y='ì'
				y=''
			endif
		Case m.z=' '
			z=iif(m.y='¢' and Glasn(m.x), '®õ', '¨')
		EndCase
	endif
else
	z=iif(Glasn(m.z), ' ', m.z+' ')
	*Do Case
	*Case m.z='®' and m.y='«'
	*	z=' '
	*Case !Glasn(m.z)
	*	z=m.z+' '
	*EndCase
endif
Return Left(m.tx, Len(m.tx)-3)+m.x+m.y+m.z
