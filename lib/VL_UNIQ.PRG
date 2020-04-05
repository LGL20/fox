Private mem, field
field=Varr()
if !'.'$m.field
	mem='m.'+m.field
endif
if Type(m.mem)="C"
	mem=Trim(&mem)
	field='Strt(Trim('+m.field+'), chr(255))'
else
	mem=&mem
endif
if Empty(m.mem)
	Return .t.
endif
Do us_back
Locate For &field=m.mem and (m.add or RecNo()#m.rec)
mem=Found() and (ok(m.uniq_txt+' уже существует') or .t.)
=m.add or GoRec(m.rec)
Return iif(m.mem, 0, .t.)
