Private new
pad='year'
Store 0 to bar, exit
new=m.m_year
Define Window year from 10,13 to 12,23 Float Shadow;
	Title ' Год ' Color n/w*,n/w*,n/bg,gr+/gb
Activate Window year NoShow
@ 0,3 Get m.new Picture '@z 9999'
Activate Window year
Read
Release Window year
if Last()#27
	Set Path to (Strt(Set('Path'), Str(m.m_year,4), Str(m.new,4)))
	m_year=m.new
	Do pad_year
endif
Return .t.
