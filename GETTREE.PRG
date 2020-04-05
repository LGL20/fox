Parameter table, parent
Private temp, sele
if Type('m.table')='C' and File(m.table+'.dbf')
	sele=Select()
	temp=Left('t_'+m.table, 8)
	Select (iif(Used(m.temp), m.temp, 0))
	Use (m.table) Again
	temp=SYS(2023)+'\t_'+m.table+'.tmp'
	Copy to (m.temp)
	* CDX
	Use (m.temp)
	* Order id
	Index on id Tag id
	if Type('m.parent')='C' and ''#m.parent
		Seek m.parent
		Replace parent with m.parent
		Delete For parent#m.parent
	endif
	Select (m.sele)
endif
