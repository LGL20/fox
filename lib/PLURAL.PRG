Parameter m.x, gender
x=Trim(m.x)
y=Right(m.x, 1)
if m.gender=2 and m.y='�'
	y='�'
endif
Return Left(m.x, Len(m.x)-Len(m.y))+m.y
