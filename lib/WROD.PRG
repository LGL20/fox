Para tx, rod
Priv x
tx=Chrt(Rtri(m.tx),'op','ор')
if Len(Allt(m.tx))<3
	Return m.tx
endif
x=Righ(m.tx,5)
Do Case
Case m.x='хмаль'
	y='хмал€'
Case m.x='враль'
	y='врал€'
Case m.x='июнь'
	y='июн€'
Case m.x='июль'
	y='июл€'
Otherwise
	x=Righ(m.tx,3)
	y=m.x
	Do Case
	Case inList(m.x,'ира','ича','раб','ной')
	Case m.x='грн'
	Case m.x='май'
		y='ма€'
	Case m.x='дой'
		y='дого'
	Case m.x='ова'
		y='овой'
	Case m.x='ель'
		y='ел€'
	Case m.x='ний'
		y='ни€'
	Case m.x='ный'
		y='ного'
	Case m.x='ва€'
		y='вой'
	Case m.x='ка€'
		y='кой'
	Case m.x='ина'
		y='иной'
	Case m.x='ль€'
		y='льи'
	Case inList(m.x,'лов','ков','цов','нов','мов','сов','тет')
		y=m.x+'а'
	Otherwise
		Store Righ(m.tx,2) to x,y
		Do Case
		Case inList(m.x,'ко','€к','зы','бл','ра','ке','ны')
		Case m.x='ха'
			y='хи'
		Case m.x='ий'
			y='ого'
		Case m.x='рь'
			y='р€'
		Case m.x='ич'
			y='ича'
		Case m.x='ор'
			y='ора'
		Case m.x='ец'
			y='ца'
		Otherwise
			Store Right(m.x,1) to x,y
			Do Case
			Case At(m.x,'.…÷” ≈H√Ўў«’ЏЁ∆ƒЋќ–ѕј¬џ‘я„—ћ»“№Ѕё')#0
				y=m.x
			Case m.x='й'
				y='€'
			Case m.x='ь'
				y='и'
			Case m.x='а'
				y='ы'
			Case m.x='ы'
				y='ов'
			Case m.x='е'
				y='€'
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
