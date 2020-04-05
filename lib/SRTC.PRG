Private base
Set Filt to
if m.izm
	Sort on name to vrem
	base=Dbf()
	Use
	Copy File vrem.dbf to (m.base)
	Eras vrem.dbf
	Use (m.base)
	Inde on code to (Left(m.base, Len(m.base)-4)) Comp
endi
