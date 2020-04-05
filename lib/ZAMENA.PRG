if zamena1#0
	for p=zamena1+zamena2 to len step zamena1
		r=p-zamena2
		m.word=Stuf(Stuf(m.word, r,1,Subs(m.word,p,1)), p,1,Subs(m.word,r,1))
	endf
endi
