Parameter mute, notdf, menu, params
Private popup, bar
sy=Str(Year(Date()), 4)
sm=chr(Month(Date()))
=keypar(m.params)
if Type('m.save')#"C"
	save = 'Set'+Left(m.MainProgram, 5)
endif
r=m.PathUser+m.save+'.mem'
if File(m.r)
	Restore from &r Additive
endif
oldmon=asc(m.sm)
Store Int(Val(m.sy)) to oldy, year, CurYear
Store asc(m.sm) to mon, sm
if m.mute
	Do sele
else
	Do walk_mn with m.mon, m.year, "n/w,,n/w,b/w,,w+/b", 10, .f., 'sele'
	mon=chr(m.mon)
endif
if m.MainProgram='zarp'
	mon=moreyear(m.CurYear)+m.mon
endif
Return Last()#27

Proc sele
Parameter exit
	if m.mute
		year=Str(m.year,4)
	else
		mon=(m.I-1)*3+m.J
		sm=chr(m.mon)
		sy=m.year
		*if m.year#m.oldy or m.mon#m.oldmon
			r=m.PathUser+m.save
			SAVE to &r ALL LIKE s*
		*endif
		CurYear=Int(Val(m.year))
		exit=.t.
	endif
	mon=chr(m.mon)
	if !m.notdf
		=pad_mon('', m.menu)
		Do sets
	endif
Return
