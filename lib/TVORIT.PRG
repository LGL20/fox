Para tx
Priv x
tx=Rtri(m.tx)
x=Righ(m.tx,3)
y=m.x
Do Case
Case m.x='���'
	y='����'
Case m.x='稪'
	y=m.x+'o�'
Case m.x='���'
	y='��o�'
EndCase
x=Len(m.x)
Retu Stuff(m.tx, Len(m.tx)-m.x+1,m.x,m.y)
