Parameter i
Private l,s,u
if Type('m.i')="N"
	Return m.i+1
endif
l=Len(m.i)
if m.i=Spac(m.l)
	Return Repl(chr(1),m.l)
endif
Do While .t.
	s=asc(Subs(m.i, m.l, 1))+1
	if m.s=32
		s=m.s+1
	endi
	if m.s>=255
		if m.l=1
			=ok('‚ ¯o«¥ ªo¤  ¡ §ë ¤ ­­ëå '+Alias()+' ­¥¤oáâ âoç­o ¬¥áâ .ÝŽ¡p â¨â¥áì ª p §p ¡oâç¨ªã')
			Return ''
		endi
		l=m.l-1
	else
		Return Left(m.i,m.l-1)+chr(m.s)+Repl(chr(1),Len(m.i)-m.l)
	endif
enddo
