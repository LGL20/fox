Parameter mon
Private r
if m.mon=0
	Return ''
endif
r=Allt(b[m.mon])
Return iif(inLi(m.mon,3,8), m.r+win('a'), Left(m.r, Len(m.r)-1)+win('ï'))+' '
