Para titl,h
Rest from pri Addi
t=1
Decl a[1]
_RMARGIN=m.rmar
=razbivka(h)
k=aLen(h)
if m.t>1
	p=1
	for j=1 to m.t
		h[1]=Stuf(h[1],m.p+1,7,'Лист'+Str(m.j,3))
		if j<m.t
			p=m.p+a[m.j]
			for i=1 to m.k
				h[i]=Stuf(h[i],m.p,0,'|')
			endf
			p=m.p+1
		endi
	endf
endi
Defi Wind scr from 0,0 to 24,79 Titl ' '+Allt(m.titl)+' '
Acti Wind scr
Stor 0 to xp,yp
=sh()
c=schm(m.color,1)
Wait Clea
do whil key#27
	key=inKey(0,'hm')
	do case
		case key=4 and xp+79<=Len(m.line)
			=sh(0,-1,1,0,0,0,0,xp+79,79)
			xp=xp+1
		case key=19 and xp>1
			xp=xp-1
			=sh(0,1,1,0,0,0)
		case key=24 and 24+yp-3<m.k
			=sh(1,0,0,24,24+yp-2,0,0,xp)
			yp=yp+1
		case key=5 and yp>1
			yp=yp-1
			=sh(-1,0,0,0,0,0,0,xp)
		case key=9 and xp+79<=Len(m.line)
			if xp+79+5<=Len(m.line) or !en()
				=sh(0,-5,5,0,0,0,0,xp+79,79-4)
				xp=xp+5
			endi
		case key=15 and xp>1
			dx=iif(xp<5,xp,5)
			xp=xp-dx
			=sh(0,dx,dx,0,0,0)
		case key=18 and yp>1
			dy=yp-1
			yp=max(1,yp-24+2)
			if dy<=24
				=sh(-dy,0,0,0,0,0,0)
			else
				=sh(0,0,0,0,0,0,0)
			endi
		case key=3 and yp+24-2<m.k
			dy=min(24, m.k-yp-24+1)
			yp=iif(dy<24-1, k-24+3, yp+24-2)
			=sh(0,0,0,0,0,0,0)
		case key=1 and xp>1
			dx=xp-1
			xp=1
			=iif(dx<=79, sh(0,dx,dx,0,0,0),;
				sh(0,0,0,0,0,0))
		case key=6 and xp<Len(m.line)-79+1 and en()
		case key=29 and (xp>1 or yp>1)
			xp=1
			yp=1
			=sh(0,0,0,0,0,0,0,xp)
		case key=23 and (xp<Len(m.line)-79+1 or yp<m.k-24+3)
			xp=Len(m.line)-79
			yp=m.k-24+3
			=sh()
		case key=13 and !m.dontpri
			=pri(line)
	endc
endd
=m.pri or pri(line)
Rele Wind scr

Proc en
	xp=Len(m.line)-79+1
	=sh(0,0,79,0,0,0)
	if Len(h)<79
		xp=m.xp-79
	endi
Retu .t.

Proc sh
Para dy,dx,en,y,j,pt,li,bg,x
	do defa with dy, 0
	do defa with dx, 0
	do defa with en, 79
	do defa with y, 0
	do defa with j, yp
	do defa with x, 0
	do defa with bg, xp
	do defa with li, 0
	do defa with pt, 0
	if m.dy#0 or m.dx#0
		Scro m.li, m.pt, m.24, 79, m.dy, m.dx
	endi
	Decl clr[2]
	clr[1]='n/w'
	clr[2]='n/bg'
	Priv n
	n=0
	do whil j<=m.k and y+n<=24
		@ y+n, 1 Say Left ( h[j], 0)
		@ y+n, x Say Subs ( h[j], m.pt+bg, en)
		j=j+1
		n=n+1
	endd
Retu

Proc pri
Para line
	if !menu02("Печать?")
		Retu
	endi
	if !Empt(m.prn)
		Do (m.prn)
		Retu
	endi
	pri=.t.
	Priv f
	=aCop(h,f)
	for i=1 to m.k
		f[i]=Chrt(f[i],'|','')
	endf
	line=Chrt(m.line,'|','')
	Stor '' to ch_off, g, ng, d6, d8
	do esc_code
	if m.t>1
		Set Conf on
		defi wind pri from 10,30 to 13,45 shad titl " Печатать "
		acti wind pri noshow
		@ 0,1 Say "Все"
		@ 0,0 Get m.all Pict "@*IT" Size 1,5 Defa 0
		@ 1,1 Say "Лист N" Get m.num Defa 0 Pict "@z";
			Size 1,Len(Allt(Str(m.t)));
			Vali Betw(m.num,iif(last()=13,1,0),m.t) and cl();
			Erro "Выберите лист oт 1 дo"+Str(m.t,3)
		Acti wind pri same
		Read Cycl
		Rele wind pri
		Set Conf off
	endi
	if !ready()
		Retu
	endi
	Wait Wind "Печать ..." NoWa
	Set Head off
	Set Cons off
	Set Prin on
	if m.t>1 or !pri_list(1)
		if m.num=0 or !pri_list(m.num)
			for i=1 to m.t
				=pri_list(m.i)
			endf
		endi
	endi
	Set Prin off
	Set Cons on
	Wait Clea

	Proc cl
		if m.num#0
			Rele m.all
			Clea Read
		endi
	Retu
Retu

Proc pri_list
Para num
	if !Ready()
		Retu to scrbr
	endi
	Priv p,i,j,l,n
	p=1
	for i=1 to m.num-1
		p=m.p+a[m.i]+1
	endf
	l=Len(m.line)-m.p+2
	Decl ti[1]
	j=0
	do lines with iif(m.sgH, chr(27)+'M','')+m.g+Rtri(m.sy)+" ";
		+iif(m.outyear,'',"г.")+m.ng;
		+iif(m.t>1,"       Лист" + Str (m.num,2),''),;
		Int(rmar/2), ti, j, 3
	?chr(27)+'9'
	for i=1 to j
		if i=1
			??""+ti[1]
		else
			?""+ti[i]
		endi
	endf
	?? iif(little,d8+'',iif(sgV,d8,''))
	if m.outbord
		n=aLen(h)-1
	else
		if Empt(p1)
			? Left( Righ(f[2],m.l), a[m.num])
			? Left( Righ(f[3],m.l), a[m.num])
		else
			do (p1) with m.p, m.num
		endi
		? Left( Righ(f[4],m.l), a[m.num])
		n=m.k+1
	endi
	for j=1 to m.n
		if !nprilin and f[j]#'─'
			? Left( Righ(m.line,m.l), a[m.num])
		endi
		if m.outch or f[j]#m.line
			if m.outch or lin(j+1) or lin(j)
				? Left( Righ(f[j],m.l), a[m.num])
			else
				? chr(27)+'-'+Left( Righ(f[j],m.l), a[m.num])+ch_off
			endi
		endi
	endf
	if	m.outbord
		? ch_off+Left( Righ(f[n+1],m.l), a[m.num])
	else
		? ch_off+Left( Righ(m.line,m.l), a[m.num])
		? Left( Righ(f[k-2],m.l), a[m.num])
		? Left( Righ(f[4],m.l), a[m.num])
		? Left( Righ(line,m.l), a[m.num])
		? Left( Righ(f[k],m.l), a[m.num])
	endi
	?? iif(little,d6+'',iif(sgV,d6,''))
	?
	if Prin()
		Ejec
	endi
Retu .t.

Func lin
Para j
Retu At( Left(f[j],1), '─║╠╟├╞╓╔┌╒└╚╘╙')#0
