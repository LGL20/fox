Private flt, i, temp
flt=Filter()
Set Filter to
Calculate Max(code) to i For code#' '
if m.i=Repl(chr(255), Len(code))
	i=Space(Len(code))
	Do While .t.
		i=kd(m.i)
		Locate For code=m.i
		if !Found()
			Exit
		endif
	EndDo
else
	i=kd(m.i)
endif
if ''#m.flt
	Set Filter to &flt
endif
Return m.i
