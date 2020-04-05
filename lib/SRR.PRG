Parameter ar, field
Private base
Set Filter to
if Type('ar')='N'
	base=Dbf()
	Use (m.base) Exclusive
	nar=aLen(ar)
	Decl ar[nar]
	for i=1 to nar
		Go ar[i]
		if !Deleted()
			Scatter Memvar
			Delete
			Locate for m.name<name
			if Found()
				Insert Blank Before
			else
				Append Blank
			endif
			Gather Memvar
		endif
	endfor
	Use (m.base)
	Inde on &field to (Left(m.base, Len(m.base)-4)) Compact
endif
