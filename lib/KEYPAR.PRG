*	ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
*	º   à¥¢à é¥­¨¥ ª«îç¥© ¢ ¯ à ¬¥âàë  º
*	ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

Parameter str
*	ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
*	º    str - câàoª , áo¤¥à¦ é ï ª«îç¨         º
*	ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½
Private p, k, n, i, s
*	ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
*	º    p   - ¯o§¨æ¨ï "\" ¢ str          º
*	º    k   - ­ §¢ ­¨¥ ¨ §­ ç¥­¨¥ ª«îç   º
*	º    n   - á«¥¤ãîé ï ¯o§¨æ¨ï "\" ¢ k  º
*	º    i   - ­o¬¥à ª«îç                 º
*	ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½
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
			*	ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
			*	º  p   - ¯¥à¢ ï ¯o§¨æ¨ï "\" ¢ k                      º
			*	º  str - á¢o¡o¤­ë© â¥ªáâ ¢ ­ ç «¥ áâàoª¨ ¯ à ¬¥âào¢  º
			*	ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½
			Return
		endi
		k=Subs(m.str, m.p+1, Len(m.str))
		n=At(m.sepa, m.k)
		if m.n#0
			k=Left(m.k, m.n-1)
		endi
		*	ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
		*	º   p - ¯o§¨æ¨ï ":" ¢ k     º
		*	ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½
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
			*	ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
			*	º   n - §­ ç¥­¨¥ ª«îç    º
			*	º   k - ­ §¢ ­¨¥ ª«îç    º
			*	ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½
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
