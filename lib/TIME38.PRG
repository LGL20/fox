Para m.time
Return iif(m.time='   ', '        ',;
	Tran(asc(Subs(m.time,1,1)),'@L 99')+':'+;
	Tran(asc(Subs(m.time,2,1)),'@L 99')+':'+;
	Tran(asc(Subs(m.time,3,1)),'@L 99'))
