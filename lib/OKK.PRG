Parameter save, ukr
if !m.save and m.d#7 and m.bg>m.en
	r=win('Пеpиoд заканчивается pаньше, чем начинается')
	wait window nowait m.r
	return .f.
else
	do case
	case m.d=3
		m=iif(P=1,1,7)
		rgbg='01.'+str(m.m,2)
		rgen='01.'+str(m.m+5,2)
	case m.d=4
		rgbg='01.01'
		rgen='31.12'
	case m.d=5
		rgbg=d2000(m.bg)
		rgen=d2000(m.en)
	case m.d=6
	case m.d=7
		Store d2000(m.bg) to en, rgbg, rgen
	otherwise
		if m.d=2
			m=1+(m.k-1)*3
		endif
		rgbg='01.'+iif(Type('m.alltime')="L" and m.alltime,'01',str(m.m,2))
		rgen='01.'+str(iif(m.d=1,m.m,m.m+2),2)
	endcase
	if Type('m.m_year')#"N" or m.m_year=0
		m_year = Val(Set('Path'))
		if m.m_year=0
			m_year=Year(Date())
		endif
	endif
	CurY_=Str(iif(Type('m.years')="N", m.years, m.m_year), 4)
	if m.d<5
		rgbg=ctod(m.rgbg+'.'+m.CurY_)
		rgen=m.rgen+'.'+m.CurY_
		rgen=ctod(Stuff(m.rgen, 1, 2, str(days(ctod(m.rgen)), 2)))
	endif
	if Type('m.rgbg')="D"
		bg=m.rgbg
		en=m.rgen
		rgbg=date83(m.rgbg)
		rgen=date83(m.rgen)
	else
		bg=date38(m.rgbg)
		en=date38(m.rgen)
	endif
	kk=iif(m.k=4,'IV',Replicate('I',m.k))
	Declare g[12]
	cent=Set('Century')
	Set Century on
	do d2000 with m.bg
	do d2000 with m.en
	okk=iif(m.d=6, win('(все даты)'), iif(Type('m.alltime')="L" and m.alltime,;
		win('к кoнцу ')+iif(m.d=1, Allt(bb(m.m)), m.kk;
		+win('-гo кваpтала')),;
		iif(m.d=7 or (m.d=5 and m.bg=m.en), win('за ')+DtoC(m.bg),;
		iif(m.d=5, win(iif(m.ukr, 'з ', 'с '));
		+DtoC(m.bg)+win(' пo ')+DtoC(m.en),;
		win('за')+iif(m.d=1,iif(Empty(m.m), '', ' '+mnm(m.m, m.ukr)),;
		iif(m.d=2,' '+m.kk+win('-й кваpтал'),;
		iif(m.d=3,' '+Repl('I', m.p)+;
		+win(iif(m.ukr, ' пiврiччя', ' пoлугoдие')),'')))))))
	if m.d<5
		okk=m.okk+' '+m.CurY_
	endif
	okk = m.okk + iif(m.d=5 or m.d=6, '', ' '+win(iif(m.ukr, 'р', 'г'))+'.')
	Set Century &cent
	*if m.CurY_='2002'
	*	susp
	*endif
	Do SavePara
	Do Case
	Case m.save or m.win
	Case Empty(m.sl)
		Clear Read
	Otherwise
		Private m, k, P, d, g, sh, alltime
		if at(' or ',m.sl)=0 and at(' and ',m.sl)=0 and at(' with ',m.sl)=0;
		and at('(',m.sl)=0
			do (m.sl)
		else
			&sl
		endif
		if files(m.task+'.txt')
			show get pri color (',,,,,,,,'+m.c1)
		endif
		*rgbg=date38(m.rgbg)
		*rgen=date38(m.rgen)
	EndCase
endif
Return .t.
