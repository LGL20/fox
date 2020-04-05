para x, len, simb, nul
priv i, y
if Type('rnd')='U'
	Rest from rnd Additive
endif
x=Round(m.x, m.rnd)
if m.rnd<=0
	x=Ltri(Str(x, 100))
	y=""
else
	x=Ltri(Str(x, 100, m.rnd))
	y=Righ(m.x, m.rnd+1)
	x=Left(m.x, Len(m.x)-m.rnd-1)
endi
for i=len(x)-2 to 2 step -3
	x=Stuf(x,i,0,',')
endf
if m.x='0' and val(m.y)=0 and !nul
	x=''
else
	if Left(x,1)='-' AND Subs(x,2,1)=','
		x=Stuf(x,2,1,'')
	endi
	x=m.x+m.y
endi
if Empt(m.simb)
	m.simb	= ' '
endi
x=Strt(m.x,',',Set("Sepa"))
Retu iif(Empt(m.len), x, Padl(x, m.len, m.simb))
