Parameter mon, ukr, nowin
if Between(m.mon, 1, 12)
	Private b
	Declare b[12]
	Do mon with b, m.ukr
	b=b[m.mon]
	Return iif(m.nowin, m.b, win(m.b))
else
	Return ''
endif
