*	靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*	�	 귣�젪�Ð젰� ｀졽� �젩エ劣 ㄻ� ⅴ 飡�o�			�
*	聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

*	靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*	�	 a-�젩エ��										�
*	�	 titl, foot - 쭬즣쳍줼� � ⓥo�					�
*	�	 l-�젳ㄵエ收エ									�
*	�	 p-��o獄좑 칚㎤與� �젳ㄵエ收ワ					�
*	�	 r-笹ⅳ莘�좑 칚㎤與� �젳ㄵエ收ワ (쵟めº젷彛좑)	�
*	�	 i-o曄誓ㄽo� �젳ㄵエ收レ						�
*	�	 u-誓젷彛o� 칚쳍┘��� �젳ㄵエ收ワ				�
*	�	 k-춐Д� �젳ㄵエ收ワ							�
*	聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

Para a, titl, foot
Priv All
n=aLen(a)
Decl a[m.n], l[2], pos[2]
l[1]='�'
l[2]='�'
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
						a[m.j]=Stuf(a[m.j], m.p, 0, Repl('�',m.r-m.u))
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
				u=At('�',a[j])
				if u=0
					u=At('�',a[j],i)
				endi
			else
				u=At('�',a[j],iif(At('�',a[j])=0, i, i-1))
			endi
			if u=0
				u=At('�',a[j])
			endi
			a[m.j]=Stuf(a[m.j], m.p, 0, Repl('�',m.r-m.u))
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
Retu At( Left(a[m.j],1), '컬')#0
