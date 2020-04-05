Para tx, rod, ukr
Private x
if m.tx='Украины'
	Return m.tx
endif
if m.ukr
	tx=Chrt(Rtri(m.tx),'op','ор')
	x=Righ(m.tx,3)
	y=m.x
	Do Case
	Case inList(m.x,'ира','ича','раб','ень','ого')
	Case m.x='ькi'
		y='ьких'
	Case m.x='рки' or m.x='рки'
		y='рок'
	Case m.x='нгi'
		y='нгiв'
	Case m.x='нги'
		y='нгив'
	Case m.x='йки'
		y='йок'
	Case m.x='внi' or m.x='вни'
		y='вень'
	Case m.x='ова'
		y='овой'
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
		Case m.x='ел'
			y='ла'
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
	x=Len(m.x)
	Retu Stuff(m.tx, Len(m.tx)-m.x+1,m.x,m.y)
else
	tx=Chrt(Rtri(m.tx),'op','ор')
	if Len(Allt(m.tx))<3
		Return m.tx
	endif
	x=Righ(m.tx,5)
	Do Case
	Case m.x='хмаль'
		y='хмаля'
	Case m.x='враль'
		y='враля'
	Case m.x='июнь'
		y='июня'
	Case m.x='июль'
		y='июля'
	Otherwise
		x=Righ(m.tx,3)
		y=m.x
		Do Case
		Case inList(m.x,'ира','ича','раб','ной','ого')
		Case m.x='грн'
		Case m.x='дой'
			y='дого'
		Case m.x='ова'
			y='овой'
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
		Case m.x='ина'
			y='иной'
		Case m.x='лья'
			y='льи'
		Case m.x='йки'
			y='ек'
		Case inList(m.x,'лов','ков','цов','нов','мов','сов','тет')
			y=m.x+'а'
		Otherwise
			Store Righ(m.tx,2) to x,y
			Do Case
			Case inList(m.x,'ко','як','зы','бл','ра','ке')
			Case m.x='ны'
				y='ень'
			Case m.x='ха'
				y='хи'
			Case m.x='ий'
				y='ого'
			Case m.x='рь'
				y='ря'
			Case m.x='ич'
				y='ича'
			Case m.x='ор'
				y='ора'
			Case m.x='ец'
				y='ца'
			Case m.x='ел'
				y='ла'
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
					y='ы'
				Case m.x='ы'
					y='ов'
				Case m.x='е'
					y='я'
				Case m.x='о'
					y='а'
				Case At(m.x, 'кнрт')>0
					y=m.x+'а'
				EndCase
			EndCase
		EndCase
	EndCase
	x=Len(m.x)
	Retu Stuff(m.tx, Len(m.tx)-m.x+1,m.x,m.y)
endif
