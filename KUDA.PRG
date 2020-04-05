Parameters yy, cycle
Do Case
Case inList(LastKey(),1,18)
	yy=1
Case inList(LastKey(),6,3)
	yy=1000
Case inList(LastKey(),5,15,18,19)
	yy=m.yy-1
Otherwise
	yy=m.yy+1
EndCase
if !Empty(m.cycle)
	IF m.yy>m.cycle
		yy=1
	else
		IF m.yy=0
			yy=m.cycle
		endif
	endif
endif
