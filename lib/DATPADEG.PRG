Parameter s, gender
Private x,l
x=Right(m.s,2)
Do Case
Case m.x='ый'
	l='ому'
Otherwise
	x=Right(m.s,1)
	Do Case
	Case m.x='ь'
		l='и'
	Case m.x='й'
		l='ю'
	Case m.x='а'
		l='е'
	Case m.x='ы'
		l='ам'
	Case m.x='р'
		l='ру'
	Otherwise
		l='у'
	EndCase
EndCase
Return Left(m.s, Len(m.s)-Len(m.x))+m.l
