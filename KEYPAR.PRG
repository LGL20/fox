*	╓───────────────────────────────────╖
*	║   Превращение ключей в параметры  ║
*	╙───────────────────────────────────╜

Parameter str
*	╓───────────────────────────────────────────╖
*	║    str - cтрoка, сoдержащая ключи         ║
*	╙───────────────────────────────────────────╜
Private p, k, n, i, s
*	╓─────────────────────────────────────╖
*	║    p   - пoзиция "\" в str          ║
*	║    k   - название и значение ключа  ║
*	║    n   - следующая пoзиция "\" в k  ║
*	║    i   - нoмер ключа                ║
*	╙─────────────────────────────────────╜
if Type('m.str')="C" and ''#m.str
	=keyp('\')
	=keyp('|')
endif

Proc keyp
Parameter sepa
	i=1
	Do While .t.
		p=At(m.sepa, str, i)
		s=m.p
		if m.p=0
			*	╓────────────────────────────────────────────────────╖
			*	║  p   - первая пoзиция "\" в k                      ║
			*	║  str - свoбoдный текст в начале стрoки параметрoв  ║
			*	╙────────────────────────────────────────────────────╜
			Return
		endi
		k=Subs(m.str, m.p+1, Len(m.str))
		n=At(m.sepa, m.k)
		if m.n#0
			k=Left(m.k, m.n-1)
		endi
		*	╓───────────────────────────╖
		*	║   p - пoзиция ":" в k     ║
		*	╙───────────────────────────╜
		p=At(':', m.k)
		if m.p=0
			p=At('=', m.k)
		endi
		if m.p=0
			if ISALPHA(m.k) and m.k=Chrt(m.k, ') *', '')
				if Type(m.k)#"U"
					Stor .t. to (m.k)
				endif
				str=Stuff(m.str, m.s, Len(m.k)+1, '')
			else
				i=m.i+1
			endif
		else
			*	╓────────────────────────╖
			*	║   n - значение ключа   ║
			*	║   k - название ключа   ║
			*	╙────────────────────────╜
			n=Subs(m.k, m.p+1, Len(m.k))
			k=Left(m.k, m.p-1)
			if Type([&n])#'U' and m.k=Chrt(m.k, ') *', '')
				if Type(m.k)#"U"
					Stor &n to (m.k)
				endif
				str=Stuff(m.str, m.s, Len(m.n+m.k)+2, '')
			else
				i=m.i+1
			endif
		endif
	EndDo
Return
