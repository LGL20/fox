Parameter rec, base
Do defa with m.base, Select()
if Between(m.rec, 1, RecC(m.base))
	Go m.rec in (m.base)
	Return .t.
endif
Return .f.
