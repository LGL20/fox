Parameter year
Private y
y=iif(Type('m.year')="D", Year(m.year), m.year)%100
Return chr(m.y+iif(m.y<50, 100, 0))
