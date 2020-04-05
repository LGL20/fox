prmtr=!Empty(m.rgbg) and !Empty(m.rgen)
if m.prmtr or file(m.PathUser+'range2.mem')
	if !m.prmtr
		Store '' to rgbg, rgen
		Restore from (m.PathUser+'range2.mem') Additive
	endif
else
	Store '' to rgbg, rgen
endif
if ''=m.rgbg and ''=m.rgen
	d=6
	Store CtoD('') to bg, en
else
	if Type('m.rgbg')="C"
		bg=date38(m.rgbg)
		en=date38(m.rgen)
	else
		bg=m.rgbg
		en=m.rgen
		rgbg=date83(m.rgbg)
		rgen=date83(m.rgen)
	endif
	m=month(m.bg)
	k=ceiling(m.m/3)
	p=ceiling(m.k/2)
	w=month(m.en)
	d=5
	alltime=day(m.bg)=1 and m.m=1
	ok=day(m.en)=days(m.en)
	do case
	case m.bg=m.en
		d=7
	case m.rgbg=Repl(chr(0),3) and m.rgen=Repl(chr(255),3)
	*case m.rgbg=chr(0) and m.rgen=date83(Ctod('1.1.0001')+2958000)
		d=6
	case day(m.bg)#1 or !m.ok
	case m.alltime and m.ok and m.w=12
		d=4
	case mod(m.m,6)=1 and mod(m.w,6)=0
		d=3
	case m.alltime and mod(m.w,3)=0
		d=2
	case m.ok and m.m=m.w and day(m.bg)=1
		d=1
	case mod(m.m,3)=1 and m.w=m.m+2
		d=2
	endcase
	if m.d=3
		alltime=.f.
	endif
endif
ok=0
Declare g[12]
do mon with g
years=Year(m.bg)
