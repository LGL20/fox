Parameter p, rgbg, rgen
Private dop, task, title, height, width, obje, special, c0, c1,;
	bord, onlydo, acti, sl, y, prmtr
Store .f. to dop, title, height, width, obje, special, c0,;
	c1, onlydo, acti
Store '' to task, bord
if !Empty(m.p)
	do keyPar with m.p
endif
sl=m.task
prmtr=!Empty(m.rgbg) and !Empty(m.rgen)
if m.prmtr or files('range3.mem')
	if !m.prmtr
		Restore from range3 additiVe
	endif
	rgbg=dat28(m.rgbg)
	rgen=dat28(m.rgen)
	d=5
	m=month(m.rgbg)
	k=month(m.rgen)
	alltime=day(m.rgbg)=1 and m.m=1
	ok=day(m.rgen)=days(m.rgen)
	do case
	case day(m.rgbg)#1 or !m.ok
	case m.alltime and m.ok and m.k=12
		d=4
	case mod(m.m,6)=1 and mod(m.k,6)=0
		d=3
	case m.alltime and mod(m.k,3)=0
		d=2
	case m.ok and m.m=m.k and day(m.rgbg)=1
		d=1
	case mod(m.m,3)=1 and m.k=m.m+2
		d=2
	endcase
	if m.d=3
		alltime=.f.
	endif
else
	rgbg=dtoc(date())
	rgen=ctod(stuff(m.rgbg,1,2,str(days(date()),2)))
	rgbg=ctod(stuff(m.rgbg,1,2,'01'))
	d=1
	Store .f. to alltime, obl
endif
m=month(m.rgen)
k=ceiling(m.m/3)
p=ceiling(m.k/2)
ok=1
bg=m.rgbg
en=m.rgen
dimension g(12)
do mon with g
do defa with m.height, 4
do defa with m.width, 19
c1=scheme(13,9)
c0=scheme(13,10)
defi wind range3 from 13-m.height,39-m.width to 13+m.height,39+m.width	noclose;
 nofloat	shad title iif(empt(m.title),'',' '+m.title+' ')	color scheme 13;
 &bord
actiVate window noshow range3
if !m.special
	ok=wrows()-1
	@ m.ok, m.width-18 get m.ok siZe 1, 10 function '*n \!\<Расчет';
		Valid okk()
	if !m.onlydo
		@ m.ok, $+3 get m.pri default 0 siZe 1, 10 function '*n Печать';
			Valid VlPr() when files(m.task+'.txt');
			color (',,,,,,,,'+iif(files(m.task+'.txt'),m.c1,m.c0))
	endif
	@ m.ok, m.width+6 get m.ok siZe 1, 11 function '*t \<Закpыть'
endif
ok=1
@ 0, 1 get m.d function '*rV \<Месяц;\<Кваpтал;\<Пoлугoдие;\<Гoд;\<Диапазoн';
	Valid Vl() and mV() and CleaOtch()
@ 1, 20 get m.m from g function '^' Valid Vlm() and CleaOtch() when m.d=1
@ 1, 22 get m.k function '^ I;II;III;IV' Valid Vlk() and CleaOtch();
	when m.d=2
@ 1, 23 get m.p siZe 1, 5 function '^ I;II' when m.d=3
@ 4, 15 get m.bg Valid CleaOtch() when m.d=5
@ 4, 26 get m.en Valid CleaOtch() when m.d=5
@ 4, 17 get m.alltime function '*cn \<С начала гoда' Valid CleaOtch();
	when (m.d=1 and m.m>1) or (m.d=2 and m.k=3)
if !Empty(m.dop)
	do (m.dop)
endif
do Vl
do defa with m.obje, 1
on readerror wait wind 'Дата введена невеpнo' nowa
okk=''
sh=.f.
actiVate window range3
Read cycle object m.obje actiVate m.sh or Vl()
release window range3
on readerror 
if tyPeahead('m.rgbg')='D'
	rgbg=dat82(m.rgbg)
	rgen=dat82(m.rgen)
endif
return m.okk

Proc Vl
	@ 0, 14 fill to 4, 33
	do case
	case m.d=1
		show get m
		do Vlm
	case m.d=2
		show get k
		do Vlk
	otherwise
		alltime=.f.
		do case
		case m.d=3
			show get P
			do hidea
		case m.d=5
			@ 4, 24 say '-'
			show get bg
			show get en
		endcase
	endcase
	sh=.t.
	if !Empty(m.acti)
		do (m.acti)
	endif
return .t.

Proc mV
_curobj=9
return .t.

Proc okk
do case
case files(m.task+'.txt')
	do modifile with 135, m.task
case m.bg>m.en
	wait window nowait 'Пеpиoд заканчивается pаньше, чем начинается'
	return .f.
otherwise
	year=left(set('Path'),4)
	if Val(m.year)<1000
		year=left(right(fullPath(''),5),4)
	endif
	do case
	case m.d=3
		m=iif(P=1,1,7)
		rgbg='01.'+str(m.m,2)
		rgen='01.'+str(m.m+5,2)
	case m.d=4
		rgbg='01.01'
		rgen='01.12'
	case m.d=5
		rgbg=m.bg
		rgen=m.en
	otherwise
		if m.d=2
			m=1+(m.k-1)*3
		endif
		rgbg='01.'+iif(m.alltime,'01',str(m.m,2))
		rgen='01.'+str(iif(m.d=1,m.m,m.m+2),2)
	endcase
	if m.d#5
		rgbg=ctod(m.rgbg+'.'+m.year)
		rgen=m.rgen+'.'+m.year
		rgen=ctod(str(days(ctod(m.rgen)))+right(m.rgen,8))
	endif
	kk=iif(m.k=4,'IV',Replicate('I',m.k))
	okk=iif(m.alltime,'к кoнцу '+iif(m.d=1,Alltrim(bb(m.m)),m.kk+;
		'-гo кваpтала'),iif(m.d=5,'с '+dtoc(m.rgbg)+' пo '+dtoc(m.rgen),;
		'за'+iif(m.d=1,' '+g(m.m),iif(m.d=2,' '+m.kk+'-й кваpтал',;
		iif(m.d=3,' '+Replicate('I',m.p)+'-е пoлугoдие','')))))
	if m.d#5
		okk=m.okk+' '+m.year+' г.'
	endif
	bg=m.rgbg
	en=m.rgen
	rgbg=dat82(m.rgbg)
	rgen=dat82(m.rgen)
	kk=fullPath('range3.mem')
	if Empty(m.kk)
		kk=left(set('Path'),4)+'\range3'
	endif
	if !m.prmtr
		save all like rg* to &kk
	endif
	if Empty(m.sl)
		clear readerror
	else
		Private m, k, P, d, g, sh, alltime
		if at('or',m.sl)=0 and at('and',m.sl)=0 and at('with',m.sl)=0
			do (m.sl)
		else
			&sl
		endif
		if files(m.task+'.txt')
			show get pri color (',,,,,,,,'+m.c1)
		endif
	endif
endcase
return .t.

Proc Vlm
if m.m=1
	alltime=.f.
	do hidea
else
	show get alltime
endif
return .t.

Proc Vlk
if m.k=3
	show get alltime
else
	alltime=.f.
	do hidea
endif
return .t.

Proc hidea
@ 4, 17 fill to 4, 33
return

Proc VlPr
if ready()
	? chr(27)+'9'
	Type to Printer (m.task+'.txt')
	set Printer off
	set console on
endif
return .t.
