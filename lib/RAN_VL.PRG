Private col
col=iif(Type('m.years')="N", 10, 0)
@ m.ran_row, m.col+14 fill to m.ran_row+2, m.col+35
if !Between(m.m, 1, 12)
	m=Month(Date())
endif
do case
case m.d=1
	show get m.m
case m.d=2
	if !Between(m.k, 1, 4)
		k=Ceil(m.m/3)
	endif
	show get m.k
case m.d=3
	if !Between(m.p, 1, 2)
		p=Ceil(m.m/6)
	endif
	show get m.p
case m.d=5
	@ m.ran_row+1, m.col+24 say '-'
	show get m.bg
	show get m.en
case m.d=6
	rgbg=Repl(chr(0),3)
	rgen=Repl(chr(255),3)
	*bg=CtoD('')
	*en=date83(Ctod('1.1.0001')+2958000)
case m.d=7
	show get m.bg
endcase
if Type('m.years')="N"
	if m.d<5
		Show Get m.years
		@ m.ran_row+1, 6 Say 'год'
	else
		Show Get m.years Disable
		@ m.ran_row+1, 6 Say '   '
	endif
endif
=okk(.t.)
Return .t.
