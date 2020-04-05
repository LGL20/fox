Para tx, female
Priv x, z
Store Righ(m.tx,2) to x, z
Do Case
Case m.x='за' or m.x='ва'
	z=Left(m.x,1)+'у'
Case m.x='ая'
	z='ую'
Case m.x='ия'
	z='ию'
Case m.x='ки'
	z='ок'
Case m.x='ка'
	z='ки'
Case inList(m.x,'ий','ый','ье','зы','нь','oк','дь')
	z=m.x
Otherwise
	Store Righ(m.x,1) to x, z
	Do case
	Case m.x='p'
		z='а'
	Case m.x='й'
		z='я'
	Case m.x='ь'
		z='я'
	Case m.x='а'
		z='ы'
	Case m.x='ы'
		z='oв'
	Case m.x='е'
		z='я'
	Case m.female
	Case m.x='к'
		z='ка'
	EndCase
EndCase
x=Len(m.x)
Return Stuff(m.tx, Len(m.tx)-m.x+1, m.x,m.z)
