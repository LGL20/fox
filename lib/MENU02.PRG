Parameters txt, yes, no
Private i, p, let, lt, ltext, titl, color, ro, co, second, lp, l, pv,;
	gentle
Push Key Clear
Do defa with yes, 'Да'
Do defa with no, 'Hет'
Do defa with m.txt, ''
Store '' to titl, Color
Store 0 to ro, co
Store .f. to second, gentle
Do keypar with m.txt
lp=Max(Len(yes),Len(no))
yes=PadC(yes,lp)
no=PadC(no,lp)
lt=Min(Len(txt),76)
let=1
Declare ltext[1]
Do lines with txt, m.lt, ltext, let
Declare ltext[let]
lt=0
for i=1 to let
	ltext[i]=ALltRiM(STRTRAN(ltext[i],CHR(0)))
	lt=Max(m.lt,Len(ltext[i]))
endfor
l=Int(Max(m.lt,lp+lp+5)/2)
if m.gentle
	color='n/w,,n/w,n/w,,w+/b'
else
	Do defa with m.color, 'gr+/gr+,w+/gr+,w+/gr+,w+/gr+,,n/g'
endif
pv=Int(let/2)
ro=iif(ro=0,Int(sRows()/2),ro+pv+2)
co=iif(co=0,Int(sCols()/2),co+L+2)
Define Window menu02 from ro-pv-2, co-l-2 to ro+pv+2, co+l+2 NoClose Shadow;
	Title iif(Empty(m.titl),'',' '+m.titl+' ') Color (m.color)
Activate Window NoShow menu02
for i=1 to let
	@ i-1, Int((wCols()-m.lt)/2) Say PadC(ltext[i],m.lt)
endfor
pv=Int(wCols()/2)
@ i, pv-1-Len(m.yes) Prompt yes Color (m.color)
@ i, pv+1 Prompt no Color (m.color)
p=iif(m.second,2,1)
Wait Clear
Activate Window Same menu02
Menu to P
Release Window menu02
done=m.p#0
fnd='no'		&& надо, чтобы ppbase и del_list не спрашивали дважды
Pop Key
Return m.p=1
