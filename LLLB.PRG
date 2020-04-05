Parameter l, lin, LenAll, done, deci
Private n,i,t,r
do defa with m.deci, 2
n=FCount()
Declare l[m.n], t[m.n], done[m.n]
LenAll=0
lin=''
for i=1 to m.n
	t[m.i]=Type(Field(m.i))="N"
	if Type('l[i]')#"N"
		l[i]=0
	endif
endfor
Scan
	Scatter to r
	for i=1 to m.n
		if !Empty(r[m.i])
			l[m.i]=Max(l[m.i], Len(AllT(iif(t[m.i], Str(r[m.i], 40, m.deci), r[m.i]))))
			done[m.i]=.t.
		endif
	endfor
EndScan
*for i=1 to m.n
*	if done[m.i]
*		lin=m.lin+'Å'+Repl('Ä', l[m.i])
*		if t[i]
*			l[i]='@z '+Repl('9', Max(0, l[i])-1-m.deci)+'.'+Repl('9', m.deci)
*		endif
*	endif
*endfor
lin=Stuff(m.lin, 1, 1, 'Ã')+'´'
LenAll=Len(m.lin)
