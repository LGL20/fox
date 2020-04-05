Parameter file1, file2
Private s1, s2, f
f=FOpen(m.file1)
s1=''
Do While !Feof(m.f)
	s1=s1+'Þ'+FGets(m.f)
EndDo
=FClose(m.f)
f=FOpen(m.file2)
Do _prin
Do While !fEof(m.f)
	s2=FGets(m.f)+'Þ'
	if !m.s2$m.s1
		? m.s2
	endif
EndDo
=FClose(m.f)
Do ModiFile