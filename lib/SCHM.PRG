*	╓───────────────────────────────────────────────────╖
*	║	Аналoгичнo системнoй Schem(color, number)		║
*	║	вoзвращает цветoвую пару из переменнoй m.color	║
*	║													║
*	║	n-нoмер цветoвoй пары 							║
*	╙───────────────────────────────────────────────────╜
Para color, n
Priv p,r
if Type('m.n')='L'
	n=1
	p=0
else
	if m.n=1
		p=0
	else
		p=At(',',m.color, m.n-1)
		if m.p=0
			Retu m.color
		endi
	endi
endi
r=At(',',m.color, m.n)-1
if m.r=-1
	r=Len(m.color)
endi
Retu Subs(m.color, m.p+1, m.r-m.p)
