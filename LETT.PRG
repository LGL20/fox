Parameters rr, ed, param
Private gender, null, i, j, n, k, q, full, kop, s, ukr, nowin, meloch
Store .f. to null, full, ukr, nowin
Store 0 to w, gender
Do defa with m.param, ''
=keypar(m.param)
Do defa with m.ed, 0
x=m.rr
x=Int(m.x)
s=iif(m.x=0 and m.null, 'ноль', '')
if Empty(m.ed)
	ed=''
else
	i=Select()
	Select 0
	Use money Again
	Locate For code=chr(m.ed)
	j=Trim(name)
	ed  = Trim(iif(m.full, name, short))
	kop = Trim(iif(m.full, small, shsmall))
	Use dict Again
	Locate For russ=m.j
	gender = gender
	if !Found()
		Locate For ukr=m.j
		gender = gender
		if m.full and !m.ukr
			ed=iif(Empty(russ), m.ed, Trim(russ))
			Locate For ukr=m.kop
			kop=iif(Empty(russ), m.kop, Trim(russ))
		endif
	endif
	Use
	Select (m.i)
endif
Do While m.x>=1
	i=m.x%10
	x=Int(m.x/10)
	j=m.w%3
	n=iif(m.i=0, '', iif(m.i=1, 'один', iif(m.i=2, 'две',;
		iif(m.i=3, 'три', iif(m.i=4, 'четыр', iif(m.i=5, 'пят',;
		iif(m.i=6, 'шест', iif(m.i=7, 'сем',;
		iif(m.i=8, 'восем', 'девят')))))))))
	Do Case
	Case m.j=0
		q=m.n
		n=iif(m.w=3, 'тысяч'+iif(m.i=1, 'а', ''),;
			iif(m.w=6, 'миллион', iif(m.w=9, 'миллиард', '')))
	Case m.j=2
		n=iif(m.i=1, 'сто', m.n+iif(m.i=2, 'сти', iif(m.i<5, 'ста', 'ьсот')))
	Case m.i=1
		n=iif(''=m.q, 'десять', m.q+'надцать')
	Otherwise
		n=iif(m.i=0, '', iif(m.i=2, 'двадцать', iif(m.i=3, 'тридцать',;
			iif(m.i=4, 'сорок', iif(m.i=9, 'девяносто',	m.n+'ьдесят')))))
		n=m.n+' '+iif(m.k>2, m.q+iif(m.k=3, '', iif(m.k=4, 'е', 'ь')),;
			iif(m.k=2 and m.gender#2, 'два',;
			iif(m.k=1 and (m.w=3 or (m.w=1 and m.gender=2)),;
			'одна', m.q)))
	EndCase
	w=m.w+1
	k=m.i
	s=iif(''=m.n, '', m.n+' ')+m.s
EndDo
meloch=Int((m.rr-Int(m.rr))*100)
Do Case
Case ''#m.ed
	if m.full
		if Int(m.rr%10)=1
			ed=single(m.ed)
		else
			ed  = plural(m.ed, m.gender)
			if Int(m.rr%10)>4
				ed  = rod(m.ed, m.gender, m.ukr)
			endif
		endif
		if Int(m.meloch%10)=1
			kop=single(m.kop)
		else
			kop = plural(m.kop, m.gender)
			if Int(m.meloch%10)>4
				kop = rod(m.kop, m.gender, m.ukr)
			endif
		endif
	endif
	s = m.s+m.ed;
		+iif(m.meloch=0, '', ' '+Tran(m.meloch, '@l 99')+' '+m.kop)
Case m.meloch#0
	s=m.s+lett(m.meloch, 0, m.param+'\nowin')
EndCase
if m.ukr
	s=transl(m.s)
endif
Return Trim(iif(m.nowin, m.s, win(m.s)))
