Parameter mon, ukr
Private r
if m.mon=0
	Return ''
endif
r=mnm(m.mon, m.ukr, .t.)
r=iif(inLi(m.mon,3,8) or (m.ukr and m.mon=11), m.r+win('a'),;
	iif(m.ukr, iif(m.mon=2, Strt(m.r,'ий','oгo'), Strt(m.r,'ень','ня')),;
	Left(m.r, Len(m.r)-1)+'я'))
Return win(m.r)