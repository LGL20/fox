Parameter mon, ukr
Private r
if m.mon=0
	Return ''
endif
r=mnm(m.mon, m.ukr, .t.)
r=iif(inLi(m.mon,3,8) or (m.ukr and m.mon=11), m.r+win('a'),;
	iif(m.ukr, iif(m.mon=2, Strt(m.r,'��','o�o'), Strt(m.r,'���','��')),;
	Left(m.r, Len(m.r)-1)+'�'))
Return win(m.r)