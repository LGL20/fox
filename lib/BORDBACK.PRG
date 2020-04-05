*if ''#m.bord
* or m.bord="SINGLE"
*	p=at(',', m.bord)
*	if m.p=0
*		Set Border to &bord
*	else
*		r=Left(m.bord, m.p-1)
*		bord=Allt(Stuff(m.bord, 1, m.p, ''))
*		Set Border to &r, &bord
*	endif
*endif
