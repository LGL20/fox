Para deci, colo, notsave
Priv c
Do defa with m.deci,2
Do defa with m.colo,'w+/rb,w+/rb,w+/rb,,,n/rb'
c=','+schm(m.colo,2)+',,,,'+schm(m.colo,6)
if !notsave
	if File('rnd.mem')
		Rest from rnd Addi
	else
		rnd=0
	endi
endi
mnrnd=rnd+10
Defi Wind rnd from 10,30 to 12,42+m.deci Shad Colo (m.colo)
Acti Wind rnd NoShow
For i=0 to 8
	@ 0,i Prom '²' Colo (m.c)
EndF
@ 0,9  Say  '.'
for i=1 to m.deci
	@ 0,9+m.i Prom '²' Colo (m.c)
endf
@ 0,$ Prom 'Ü' Colo (m.c)
Acti Wind rnd
Menu to mnrnd
if mnrnd#0
	rnd=mnrnd-10
	if !notsave
		save=FULL('rnd.mem')
		Save to (m.save) all like rnd
	endi
endi
Rele Wind rnd
Return .t.