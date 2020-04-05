Parameter table, structure, area
if Used(m.table)
	Select (m.table)
	Use
endif
Create Table (m.PathUser+m.table) (&structure)
Use
Use (m.PathUser+m.table) in (m.area) Excl
