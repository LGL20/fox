Parameter str, j, sep
Private x, p, s, n, i, min, k, w
Do defa with m.sep, chr(0)
x=m.str+m.sep
n=iif(m.sep=chr(0), 5, 6)
Declare s[n,2]
Store 0 to s, k
s[1,1]=' '
s[2,1]=chr(13)
s[3,1]=chr(0)
s[4,1]='='
s[5,1]=','
if m.sep#chr(0)
	s[6,1]=m.sep
endif
w=''
Do While ''#m.x and m.k<m.j
	min=Len(m.x)+1
	for i=1 to m.n
		p=At(s[m.i,1], m.x)
		if m.p>0
			min=Min(m.min, m.p)
		endif
		s[m.i, 2]=m.p
	endfor
	k=m.k+1
	if m.k=m.j
		w=Left(m.x, m.min-1)
	endif
	x=Stuff(m.x, 1, m.min, '')
EndDo
Return m.w
