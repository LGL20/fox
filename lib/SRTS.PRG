Parameter field
if m.izm
	Sort on (m.field) to vrem
	base=Dbf()
	Use
	Copy File vrem.dbf to (m.base)
	Eras vrem.dbf
	if m.was
		Use (m.base)
	endif
else
	if !m.was
		Use
	endi
endi
