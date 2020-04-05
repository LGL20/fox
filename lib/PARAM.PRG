Para m.word
begin=one_(Righ(m.word,1))%2
sdvig1=asc(Subs(m.word,2-m.begin,1))
sdvig2=iif(Len(m.word)<4-m.begin, 0, asc(Subs(m.word,4-m.begin,1)))
sdvig3=asc(Subs(m.word,3+m.begin*2,1))
zamena1=one_(Subs(m.word,1+m.begin,1))
*zamena1=one_(chr(one_(Subs(m.word,1+m.begin,1))*14+sdvig1*one_(chr(sdvig1))))
zamena2=one_(Subs(m.word,3+m.begin,1))
if sdvig1=0
	sdvig1=sdvig2+2
endi
if sdvig2=0
	sdvig2=sdvig1+17
endi
if sdvig3=0
	sdvig3=sdvig1+8
endi
if zamena1=0
	zamena1=one_(chr(sdvig2%255))
endi
if zamena2=0
	zamena2=one_(chr(sdvig3%255))
endi
if zamena1=zamena2
	if zamena1<len
		zamena2=zamena1+1
	else
		if zamena1>1
			zamena2=zamena1-1
		endi
	endi
endi
