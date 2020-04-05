Set Filt to
if m.izm
	Sort on name to vrem
	base=Dbf()
	Use
	Copy File vrem.dbf to (m.base)
	Eras vrem.dbf
	Use (m.base)
	base=Left(m.base, Len(m.base)-4)
	Inde on kod to (m.base) Comp
endi
