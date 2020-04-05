Parameter rec
Use dels in 24
Do defa with m.rec, Sele()
if m.rec>RecC(24)
	Private select
	select=Select()
	Select dels
	Do While m.rec>RecC(24)
		Append Blank
	EndDo
	Select (m.select)
endif
Go m.rec in 24
if dels.del<99
	Repl dels.del with dels.del+1
endif
Use in 24
Retu .t.
