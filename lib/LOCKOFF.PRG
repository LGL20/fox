Parameter table, recno
Private sele
if Type('m.recno')="N" and m.recno > 0
	sele=Select()
	Select 0
	Use m:\fox\common\lock.dbf
	Locate For table=m.table and recno=m.recno
	if Found()
		Delete
	endif
	Use
	Select (m.sele)
endif
