Para x,len
Priv r
	if Type('rnd')="U"
		Rest from rnd Addi
	endi
	rnd=Max(m.rnd,0)
	r=Tran(m.x, "@z "+iif(m.rnd=0, Repl('9',m.len), Repl('9',m.len-m.rnd-1)+'.'+Repl('9',m.rnd)))
	if "*"$m.r
		r=Str(m.x,m.len)
	endi
Retu m.r
