Parameter table, structure, area, select
Private sele
sele=Select()
if Used(m.table)
	Select (m.table)
	Use
endif
Create Table (m.PathUser+m.table) (&structure)
Use
Do Case
Case Empty(m.area)
	Select 0
	area=Select()
Case m.select
	Select (m.area)
Otherwise
	Select (m.sele)
EndCase
Use (m.PathUser+m.table) in (m.area) Excl
