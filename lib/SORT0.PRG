Parameter field, key
Private base, temp
Set Filter to
if m.izm
	base=Dbf()
	base=Left(m.base, Len(m.base)-4)
	if !Empty(m.key)
		Index on &key to (m.base) Compact
	endif
endif
