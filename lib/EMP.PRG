Parameter _table
if !ppbase(m._table)
	Store '' to (m._table), (m._table+'_name')
endif
Do say_ in (m.base)
=wOut()='F' and close_fl()
Do vld
Return .t.
