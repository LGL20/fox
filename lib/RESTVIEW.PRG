Parameter temp, rec
Private r
Set View to (m.temp)
Erase (m.temp)
for i=1 to 25
	r=rec[i]
	if Between(m.r, 1, Recc(i))
		Go m.r in m.i
	endif
endfor
