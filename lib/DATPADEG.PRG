Parameter s, gender
Private x,l
x=Right(m.s,2)
Do Case
Case m.x='�'
	l='���'
Otherwise
	x=Right(m.s,1)
	Do Case
	Case m.x='�'
		l='�'
	Case m.x='�'
		l='�'
	Case m.x='�'
		l='�'
	Case m.x='�'
		l='��'
	Case m.x='�'
		l='��'
	Otherwise
		l='�'
	EndCase
EndCase
Return Left(m.s, Len(m.s)-Len(m.x))+m.l
