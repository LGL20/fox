Parameter p, rgbg, rgen
Private dop, task, titl, title, height, width, obje, special, c0, c1,;
	bord, onlydo, acti, sl, y, prmtr, wasBord
Store .f. to dop, task, titl, title, height, width, obje, special, rgsgat,;
	c0, c1, onlydo, acti
Store '' to rgotpk, bord, year
rgalp=1
if !Empty(m.p)
	do keyPar with m.p
endif
rgopl=1
sl=m.task
task=iif(Type('m.popu')='U' or Type('m.bar')='U', 'p0',;
	m.popu+ltrim(str(m.bar)))
rgpf=1
prmtr=!Empty(m.rgbg) and !Empty(m.rgen)
if m.prmtr or files(m.PathUser+'range2.mem')
	if !m.prmtr
		Restore from (m.PathUser+'range2') AdditiVe
	endif
	if Type('m.rgbg')="C"
		rgbg=date38(m.rgbg)
		rgen=date38(m.rgen)
	endif
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
	Store .f. to alltime, obl, rgobl
endif
m=month(m.rgen)
k=ceiling(m.m/3)
p=ceiling(m.k/2)
ok=1
bg=m.rgbg
en=m.rgen
Declare g(12)
do mon with g
do defa with m.height, 4
do defa with m.width, 19
c1=scheme(13,9)
c0=scheme(13,10)
if ''=m.bord
	wasBord=Set('Border')
	Set Border to Single
endif
Define Window range2 NoClose NoFloat Shadow Color Scheme 13 &bord;
	from 13-m.height, 39-m.width to 13+m.height, 39+m.width;
	Title iif(empt(m.title), iif(Empty(m.titl),'', ' '+m.titl+' '),;
		' '+m.title+' ')
Activate window noshow range2
if !m.special
	ok=wrows()-1
	@ m.ok, m.width-18 get m.ok siZe 1, 10 function '*n \!\<Расчет';
		Valid okk()
	@ m.ok, m.width+6 get m.ok siZe 1, 11 function '*t \<Закpыть'
endif
ok=1
@ 0, 1 get m.d function '*rV \<Месяц;\<Кваpтал;\<Пoлугoдие;\<Гoд;\<Диапазoн';
	Valid chm() and Vl() and mV() and CleaOtch()
@ 1, 20 get m.m from g function '^' Valid Vlm() and CleaOtch() when m.d=1
@ 1, 22 get m.k function '^ I;II;III;IV' Valid Vlk() and CleaOtch();
	when m.d=2
@ 1, 23 get m.p siZe 1, 5 function '^ I;II' when m.d=3 Valid sh_acti()
@ 4, 15 get m.bg Valid CleaOtch() and sh_acti() when m.d=5
@ 4, 26 get m.en Valid CleaOtch() and sh_acti() when m.d=5
@ 4, 17 get m.alltime function '*cn \<С начала гoда' Valid CleaOtch();
	when (m.d=1 and m.m>1) or (m.d=2 and m.k=3)
if !Empty(m.dop)
	do (m.dop)
endif
do defa with m.obje, 1
on readerror wait wind 'Дата введена невеpнo' nowa
okk=''
sh=.f.
actiVate window range2
Read Cycle Object m.obje actiVate m.sh or Vl()
Release Window range2
on readerror 
if tyPeahead('m.rgbg')='d'
	rgbg=date83(m.rgbg)
	rgen=date83(m.rgen)
endif
Return m.okk

Proc Vl
	@ 0, 14 fill to 4, 35
	do case
	case m.d=1
		show get m
		do Vlm
	case m.d=2
		show get k
		do Vlk
	case m.d=3
		show get P
		do hidea
	case m.d=5
		@ 4, 24 say '-'
		show get bg
		show get en
	endcase
	if m.d>2
		alltime=.f.
		if !Empty(m.acti)
			do (m.acti)
		endif
	endif
	sh=.t.
	if m.rgalp=1
		show get rgsum
	else
		show get otp
	endif
return .t.

Proc mV
	_curobj=9
return .t.

Proc Vlm
	if m.m=1
		alltime=.f.
		do hidea
	else
		show get alltime
	endif
	if !Empty(m.acti)
		do (m.acti)
	endif
return .t.

Proc Vlk
	if m.k=3
		show get alltime
	else
		alltime=.f.
		do hidea
	endif
	if !Empty(m.acti)
		do (m.acti)
	endif
return .t.

Func sh_acti
	if !Empty(m.acti)
		do (m.acti)
	endif
Return .t.

Proc hidea
	@ 4, 17 fill to 4, 33
return

Proc vlpr
	if Ready()
		? chr(27)+'9'
		Type to Printer (m.task+'.txt')
		Set Printer off
	endif
Return .t.

Proc chm
	m=month(Date())
Return .t.
