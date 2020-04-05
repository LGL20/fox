Para tx, female
Priv x
tx=Chrt(Rtri(m.tx),'op','ор')
x=Righ(m.tx,4)
y=m.x
Do Case
Case m.x='цька'
	y='цької'
Otherwise
	x=Righ(m.tx,3)
	y=m.x
	Do Case
	Case inList(m.x,'ира','ича','раб')
	Case m.x='ова'
		y='ової'
	Case m.x='ель'
		y='еля'
	Case m.x='ний'
		y='ния'
	Case m.x='ный'
		y='ного'
	Case m.x='вая'
		y='вой'
	Case m.x='кая'
		y='кой'
	Case m.x='вец'
		y='вца'
	Case m.x='лья'
		y='льї'
	Case inList(m.x,'лов','ков','цов','нов','мов')
		y=m.x+'а'
	Otherwise
		Store Righ(m.tx,2) to x,y
		Do Case
		Case inList(m.x,'ко','як','зы','бл','ра')
		Case m.x='ий'
			y='ого'
		Case m.x='рь'
			y='ря'
		Case m.x='ич'
			y='ича'
		Case m.x='ор'
			y='ора'
		Otherwise
			Store Right(m.x,1) to x,y
			Do Case
			Case At(m.x,'.ЙЦУКЕHГШЩЗХЪЭЖДЛОРПАВЫФЯЧСМИТЬБЮ')#0
				y=m.x
			Case m.x='й'
				y='я'
			Case m.x='ь'
				y='и'
			Case m.x='а'
				y='и'
			Case m.x='ы'
				y='ов'
			Case m.x='е'
				y='я'
			Case inList(m.x,'к','н','р')
				y=m.x+'а'
			EndCase
		EndCase
	EndCase
EndCase
x=Len(m.x)
Retu Stuff(m.tx, Len(m.tx)-m.x+1,m.x,m.y)
