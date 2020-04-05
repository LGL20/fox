Parameter base, ind
Private area
area=1
On Error area=0
Do Case
Case Used(m.base)
	Select (m.base)
Case GetArea(m.base)
	Select 0
	Use (m.base)
EndCase
if m.ind
	Set Index to (m.base)
endif
On Error
Return errorif(m.area=0, 'Таблица '+m.base+' не открылась')
