Parameter file
Local x, p, l
file = 'spinner'
file = m.file + '.bmp'
if File(m.file)
	x = FiletoStr(m.file)
	l = 'Ä'+chr(14)+chr(0)+chr(0)+'Ä'+chr(14)+Repl(chr(0), 10)
	p = At(m.l, m.x)
	if m.p>0
		x = Stuff(m.x, 1, m.p+Len(m.l), '')
		susp
	endif
endif
Return ''