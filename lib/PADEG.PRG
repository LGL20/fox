Parameter str, padeg, nowin, female, ukr
Private p, str0, quotes
str=Chrt(m.str, 'po','à®')
str=Trim(m.str)
quotes=Right(m.str, 1)
if inList(m.quotes, '"', "'")
	str=Left(m.str, Len(m.str)-1)
else
	quotes=''
endif
str0=''
Do while ''#m.str
	p=At(' ',m.str)
	p=iif(m.p=0, Len(m.str), m.p-1)
	str0=m.str0+' '+&padeg(Left(m.str, m.p), m.female, m.ukr)
	str=Stuff(m.str, 1, m.p+1, '')
EndDo
str0=Stuff(m.str0,1,1,'')+m.quotes
Return iif(m.win and !m.nowin, win(m.str0), m.str0)

Func Glasn
Parameter x
Return At(m.x, ' ¥¨®ãíîïùõi')#0
