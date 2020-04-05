Parameter line
Private old, s, v, min
if Type('m.rmar')#"N"
	rmar=Min(255, get_rmar())
endif
Declare a[1], s[3,2]
Store 0 to a[1], v, old
Store 1 to t, s
len=Len(line)
s[1,1]='³'
s[2,1]='Ý'
s[3,1]='°'
Do While v<len
	min=m.len
	for j=1 to 3
		v=At(s[j,1], m.line, s[j,2])
		if v>0
			min=Min(m.min, m.v)
		endif
	endfor
	for j=1 to 3
		if At(s[j,1], m.line, s[j,2])=m.min
			s[j,2]=s[j,2]+1
			Exit
		endif
	endfor
	v=m.min
	if a[t]+v-old>m.rmar
		t=t+1
		Declare a[t]
		a[t]=v-old
	else
		a[t]=a[t]+v-old
	endif
	old=m.v
EndDo
