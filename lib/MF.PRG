Parameter file, ch
Private p
	p=Rat('\', m.file)
Return Stuff(m.file, iif(m.p=0, 1, m.p+1), Len(m.ch), m.ch)
