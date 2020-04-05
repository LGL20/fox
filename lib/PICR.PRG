Parameters len, deci
Private l, r, i
Do defa with m.deci, 0
deci=Max(m.deci,0)
l=m.len-iif(Empty(m.deci), 0, m.deci+1)
r=Repl('9', m.l)
for i=m.l-2 to 2 Step -3
	r=Stuff(r,i,0,',')
endfor
Return '@z '+r+iif(Empty(m.deci),'','.'+Repl('9',m.deci))
