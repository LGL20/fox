Para tx, female
Priv x,z
Store Righ(m.tx,3) to x,z
Do Case
Case m.x='ова'
	z='овой'
Otherwise
	Store Righ(m.tx,2) to x,z
	Do Case
	Case m.x='ая'
		z='ой'
	Case m.x='за'
		z='зу'
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
		Store Righ(m.x,1) to x,z
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
		Case m.x='к'
			z='ка'
		Case m.x='я'
			z='и'
		EndCase
	EndCase
EndCase
x=Len(m.x)
Return Stuff(m.tx, Len(m.tx)-m.x+1, m.x,m.z)
