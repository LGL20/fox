Para tx
Priv x
tx=Rtri(m.tx)
x=Righ(m.tx,3)
y=m.x
Do Case
Case m.x='ель'
	y='елем'
Case m.x='чик'
	y=m.x+'oм'
Case m.x='вец'
	y='вцoм'
EndCase
x=Len(m.x)
Retu Stuff(m.tx, Len(m.tx)-m.x+1,m.x,m.y)
