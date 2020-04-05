Para str
Priv low, was, sele, word, p, str0, s1, s2, k
sele=Sele()
Sele 17
was=Used()
if !m.was
	Use dict
endi
str0=''
s1=Len(m.str)
str=Ltrim(m.str)
s1=Max(0, m.s1-Len(m.str)-1)
s2=Len(m.str)
str=Rtrim(m.str)
s2=Max(0, m.s2-Len(m.str)-1)
str=Chrt(m.str, 'poXO', 'à®•Ž')
Do While ''#m.str
	p=At(' ', m.str)
	k=At(',', m.str)
	Do Case
	Case m.p>0 and m.k>0
		p=Min(m.p, m.k)
	Case m.p=0
		p=m.k
	EndCase
	if m.p=0
		word=m.str
		Store '' to str, x
	else
		word=Left(m.str, m.p-1)
		x=Subs(m.str, m.p, 1)
		str=Stuff(m.str, 1, m.p, '')
	endif
	Loca for Trim(russ)==m.word
	if Foun()
		if !Empt(ukr)
			word=Rtri(ukr)
		endi
	else
		low=RusLw(m.word)
		Loca for Trim(russ)==m.low
		if Foun()
			word=UkrProp(Rtri(ukr))
		endi
	endi
	str0=m.str0+m.word+m.x
EndDo
if !m.was
	Use
endi
Sele (m.sele)
str0=Strt(m.str0, 'ë', '¨')
Retu Space(m.s1)+iif(m.win, win(m.str0), m.str0)+Space(m.s2)
