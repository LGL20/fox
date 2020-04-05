Parameter title
Private cherk, lin, a, t, p, l, j, k, file, files, lin0, rmar, small,;
	lines
Store .f. to cherk, small, lines
Do defa with m.title, ''
Do keypar with m.title
rmar=Min(255, get_rmar()*iif(m.small, 1.6, 1))
n=aLen(e)
Declare e[m.n]
lin=''
Do llll with e
Store 1 to t, p
Declare a[1]
=razbivka(e)
i=m.n-1
files=''
file=Left(Sys(2015), 8)+'.tmp'
Set Printer on
for j=1 to m.t
	l=a[j]
	k=Stuff(m.file, 7, 2, Str(m.j,2))
	files=m.files+'³'+m.k
	lin0=Subs(m.lin, m.p, m.l)
	Set Printer to (m.k)
	? ''+m.title;
		+iif(m.t=1, '', '       (‘âà ­¨æ  '+Ltrim(Str(m.j))+')')
	title=''
	? iif(m.small, chr(27)+'0', '')
	? Chrt(m.lin0, 'Å','Â')
	? Subs(e[1], m.p, m.l)
	if m.lines
		? Chrt(m.lin0, 'ÃÄÅ´', '³ ³³') 
	endif
	? Chrt(m.lin0, 'ÃÄÅ´', 'ÆÍØµ')
	?? iif(m.cherk, chr(27)+chr(45)+chr(1), '')+''
	for k=2 to i
		if e[k]=chr(255)
			?? '  '+chr(27)+'E'+chr(27)+'G'
			? Subs(e[k], m.p, m.l)+'  '+chr(27)+'F'+chr(27)+'H'
		else
			? Subs(e[k], m.p, m.l)
		endif
		if m.lines and m.k<m.i and e[k+1]#'  '
			? m.lin0
		endif
	endfor
	?? ''
	if m.cherk
		?? chr(27)+chr(45)+chr(0)
		?
	endif
	? Chrt(m.lin0, 'ÃÄÅ´', 'ÆÍØµ')
	if m.lines
		? Chrt(m.lin0, 'ÃÄÅ´', '³ ³³') 
	endif
	? Subs(e[n], m.p, m.l)
	? Chrt(m.lin0, 'Å','Á')
	?? ''+iif(m.small, chr(27)+'2', '')
	?
	Set Printer to
	p=m.p+m.l
endfor
Set Printer off
=ModiFile(Max(Min(a, m.rmar)+15, 79), Stuff(m.files, 1, 1, ''))
