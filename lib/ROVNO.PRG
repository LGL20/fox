*	ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
*	º	 ‚ëà ¢­¨¢ ¥â £à äë â ¡«¨æë ¤«ï ¥¥ áâàoª			º
*	ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

*	ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
*	º	 a-â ¡«¨æ 										º
*	º	 titl, foot - § £o«o¢oª ¨ ¨âo£					º
*	º	 l-à §¤¥«¨â¥«¨									º
*	º	 p-¯àoè« ï ¯o§¨æ¨ï à §¤¥«¨â¥«ï					º
*	º	 r-á«¥¤ãîé ï ¯o§¨æ¨ï à §¤¥«¨â¥«ï (¬ ªá¨¬ «ì­ ï)	º
*	º	 i-oç¥à¥¤­o© à §¤¥«¨â¥«ì						º
*	º	 u-à¥ «ì­o¥ ¯o«o¦¥­¨¥ à §¤¥«¨â¥«ï				º
*	º	 k-­o¬¥à à §¤¥«¨â¥«ï							º
*	ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

Para a, titl, foot
Priv All
n=aLen(a)
Decl a[m.n], l[2], pos[2]
l[1]='³'
l[2]='°'
Stor 1 to p, pos
Do Whil .t.
	k=1
	i=pos[m.k]
	r=At(l[m.k], m.foot, m.i)
	if m.r=0
		for k=m.k+1 to 2
			i=pos[k]
			r=At(l[m.k], m.foot, m.i)
			if m.r#0
				Exit
			endi
		endf
		if m.r=0
			r=Max(Len(m.titl), Len(m.foot))
			for j=1 to m.n
				if !lin()
					r=Max(Len(a[j]), m.r)
				endi
			endf
			for j=1 to m.n
				if lin()
					u=Len(a[j])
					if r>u
						a[m.j]=Stuf(a[m.j], m.p, 0, Repl('Ä',m.r-m.u))
					endi
				else
					u=Len(a[j])
					a[m.j]=Stuf(a[m.j], m.p, 0, Spac(m.r-m.u))
				endi
			endf
			u=Len(m.foot)
			foot=Stuf(m.foot, m.p, 0, Spac(m.r-m.u))
			u=Len(m.titl)
			j=m.u-m.p+1
			titl=Stuf(m.titl, m.p, m.j, PadC(Subs(m.titl, m.p, m.j), m.r-m.p+1))
			
			Exit
		endi
	endi
	r=Max(At(l[m.k], m.titl, m.i), m.r)
	for j=1 to m.n
		if !lin()
			r=Max(At(l[m.k], a[m.j], m.i), m.r)
		endi
	endf
	for j=1 to m.n
		if lin()
			if i=1
				u=At('Ã',a[j])
				if u=0
					u=At('Å',a[j],i)
				endi
			else
				u=At('Å',a[j],iif(At('Ã',a[j])=0, i, i-1))
			endi
			if u=0
				u=At('´',a[j])
			endi
			a[m.j]=Stuf(a[m.j], m.p, 0, Repl('Ä',m.r-m.u))
		else
			if !Empt(a[j])
				u=At(l[m.k], a[m.j], m.i)
				a[m.j]=Stuf(a[m.j], m.p, 0, Spac(m.r-m.u))
			endi
		endi
	endf
	u=At(l[m.k], m.foot, m.i)
	foot=Stuf(m.foot, m.p, 0, Spac(m.r-m.u))
	u=At(l[m.k], m.titl, m.i)
	j=m.u-m.p
	titl=Stuf(m.titl, m.p, m.j, PadC(Subs(m.titl, m.p, m.j), m.r-m.p))
	i=m.i+1
	p=m.r+1
	pos[k]=m.i
EndD

Func lin
Retu At( Left(a[m.j],1), 'ÄÃ')#0
