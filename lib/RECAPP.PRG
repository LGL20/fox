Parameter empty
Private a, i, x, flt
*, _key
*_key=_KeyExp()
flt=Filter()
Set Filter to
Set Delete off
Locate for Delete()
* and &_key=' '
if Found()
	Scatter to a Blank
	if Type('a')#"U"
		Gather from a
	endif
	Recall
else
	Append Blank
endif
Set Delete on
if !m.empty
	Gather Memvar
	for i=1 to FCount()
		x=Field(m.i)
		if Type(m.x)="M"
			Replace (m.x) with m.&x
		endif
	endfor
endif
Set Filter to &flt
Return .t.
