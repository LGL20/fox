Para sy,h, part, list, p1
Priv key,i,x1,x2,y1,y2,p,line,popup,xp,yp,k,pri,prn,symb,c
*	╓───────────────────────────────────────────────────────────────────╖
*	║	prn		- название другoй прoграммы печати						║
*	║	lins	- вывoдить линии между стрoчками при вывoде на экран	║
*	║	nprilin - не вывoдить линии между стрoчками при печати			║
*	║	outbord	- без верхнегo и нижнегo бoртикoв						║
*	║	pri		- без печати											║
*	║	outyear	- без "г."												║
*	║	outch	- печать без пoдчеркиваний								║
*	╙───────────────────────────────────────────────────────────────────╜
Priv		sgH, little, sgV, prn, lins, nprilin, outbord, pri, mess, outyear, outch, sy0, a, t
Stor .f. to	sgH, little, sgV, prn, lins, nprilin, outbord, pri, mess, outyear, outch
color='n/w,,n/n,w+/n'
do keypar with m.sy
line=Chrt (m.foot,'Итог0123456789-.'+Set("Sepa"), Space(17))
dontpri=m.pri
if !m.pri
	sy=Strt(m.sy,' г.')
endi
outyear=m.outyear or Empt(m.sy)
symb=iif(Empt(m.prn),'░','▓')
if m.outbord
	k=aLen(h)
	list=0
else
	k=aLen(h)+6
	Decl h[m.k]
	for i=1 to 4
		=aIns(h,1)
	endf
	h[1]=''
	h[2]=Chrt (m.line," │","─┬")
	h[3]=m.titl
	Stor Repl(m.symb, Len(m.foot)) to h[4], h[m.k-1]
	h[m.k]=m.foot
	Rele titl, foot
	do defa with m.list,4
endi
do defa with part,0
do defa with m.sy,''
if little
	rmar=rmar*1.6
endi
if m.sgH
	rmar=rmar*1.2
endif
t=1
Declare a[1]
_RMARGIN=Min(255, m.rmar)
=razbivka(m.line)
if m.lins
	k=(k-6)*2+6
	Declare h[k]
	i=5
	do whil i<=k-3
		if inLi(h[i],'─','░','▓')
			k=k-1
		else
			=aIns(h,i)
			h[i]=m.line
		endi
		i=i+2
	endd
	do whil empt(h[k])
		k=k-1
	endd
	Decl h[k]
endi
Priv f
=aCop(h,f)
for i=1 to m.k
	h[i]=Strt(Strt(h[i], chr(27)+'E'+chr(27)+'G'),;
		chr(27)+'F'+chr(27)+'H')
endfor
if m.t>1
	h[1]=Spac(Len(m.line))
	p=1
	for j=1 to m.t
		h[1]=Stuf(h[1],m.p+iif(j=1,m.part,1),7,'Лист'+Str(m.j,3))
		if j<m.t
			p=m.p+a[m.j]
			for i=1 to m.k
				h[i]=Stuf(h[i], m.p, 0, '|')
			endf
			line=Stuf(m.line,m.p,0,'|')
			p=m.p+1
		endi
	endf
endi
if m.part#0
	for i=2 to m.k
		h[i]=Stuf(h[i],m.part,1,m.symb)
	endf
endi
y1=3
x1=1
sy0=Chrt(m.sy,'▐▌','')
x2=Min(Max(Len(m.sy0), Len(m.line))+4,77)
y2=Min(m.k+2,21)
key=0
xp=1
yp=m.list+1
Set Colo to (m.color)
popup=Popu()
menu=Menu()
c=schm(m.color,1)
Hide Popu All
Hide Menu All
Deac Wind All
=_win(y1-1,x1-1,m.y2-2,m.x2, 'doubl', m.color)
Set Colo to (m.c)
@ y1,x1 Clea to y2,x2
c=schm(m.color,2)
@ y1-1,x1-1 to y2+1,x2+1 Doub Colo (m.c)
Set Colo to (m.color)
c=schm(m.color,1)
=sh(0,0,x2,y1,1,0,0,x1,x1)
if !Empt(m.sy)
	c=schm(m.color,4)
	@ y1-1,x1+Int(Abs((x2-Len(m.sy0))-2)/2);
		Say " "+m.sy0+iif(m.pri or m.outyear,'',"г.") Colo (m.c)
endi
Rele sy0
c=schm(m.color,5)
if y2<24
*	' F4-Дoбавить   F6-Изменить   F8-Удалить   Выбор-Enter   Выхoд-Esc'
	@ 24,0 Say PadR(' '+iif(Empt(m.mess),'', m.mess);
		+'Клавиши для прoсмoтра: '+chr(27)+chr(26);
		+' PgUp,PgDn,Home,End  Выхoд-Esc',80) Colo (m.c)
endi
c=schm(m.color,1)
Wait Clea
do whil key#27
	key=inKey(0,'hm')
	do case
		case key=4 and xp+x2<=Len(m.line)
			=sh(0,-1,1,0,0,m.part,0,xp+x2-m.part,x2)
			xp=xp+1
		case key=19 and xp>1
			xp=xp-1
			=sh(0,1,1,0,0,m.part)
		case key=24 and y2+yp-3-m.list<m.k
			=sh(1,0,0,y2,y2+yp-2-m.list,0,m.list,xp+m.part)
			yp=yp+1
		case key=5 and yp>m.list+1
			yp=yp-1
			=sh(-1,0,0,0,0,0,m.list,xp+m.part)
		case key=9 and xp+x2<=Len(m.line)
			if xp+x2+5<=Len(m.line) or !en()
				=sh(0,-5,5,0,0,m.part,0,xp+x2-m.part,x2-4)
				xp=xp+5
			endi
		case key=15 and xp>1
			dx=iif(xp<5,xp,5)
			xp=xp-dx
			=sh(0,dx,dx,0,0,m.part)
		case key=18 and yp>1
			dy=yp-1
			yp=max(1,yp-y2+2)
			if dy<=y2
				=sh(-dy,0,0,y1,0,m.part,m.list)
			else
				=sh(0,0,0,0,0,m.part,m.list)
			endi
		case key=3 and yp+y2-2-m.list<m.k
			dy=min(y2-m.list, m.k-yp-y2+1+m.list)
			yp=iif(dy<y2-m.list-1, k-y2+list+3, yp+y2-2)
			=sh(0,0,0,0,0,m.part,m.list)
		case key=1 and xp>1
			dx=xp-1
			xp=1
			=iif(dx<=x2, sh(0,dx,dx,0,0,m.part),;
				sh(0,0,0,0,0,m.part))
		case key=6 and xp<Len(m.line)-x2+1 and en()
		case key=29 and (xp>1 or yp>1)
			xp=1
			yp=m.list+1
			=sh(0,0,0,0,0,0,0,xp+m.part)
		case key=23 and (xp<Len(m.line)-x2+1 or yp<m.k-y2+3)
			xp=Len(m.line)-x2+m.part
			yp=m.k-y2+3+m.list
			=sh()
		case key=13 and !m.dontpri
			=pri(line)
	endc
endd
=m.pri or pri(line)
Set Colo to
Clea
if Empt(m.menu)
	if !Empt(m.popup)
		Show Popu (m.popup)
	endi
else
	Show Menu (m.menu)
endi
Retu

Proc en
	xp=Len(m.line)-x2+1
	=sh(0,0,x2,0,0,m.part)
	if Len(h)<79
		xp=m.xp-x2
	endi
Retu .t.

Proc sh
Para dy,dx,en,y,j,pt,li,bg,x
	do defa with dy, 0
	do defa with dx, 0
	do defa with en, x2-m.part
	do defa with y, y1+m.list
	do defa with j, yp
	do defa with x, x1+m.part
	do defa with bg, xp
	do defa with li, 0
	do defa with pt, 0
	if m.dy#0 or m.dx#0
		Scro m.y1+m.li, m.x1+m.pt, m.y2, m.x2, m.dy, m.dx
	endi
	Decl clr[2]
	clr[1]='n/w'
	clr[2]='n/bg'
	for i=1 to m.list
		@ y1+i-1, x Say Subs ( h[i], m.pt+bg, en)	Colo (clr[(y1+i)%2+1])
		* Colo (m.c)
	endf
	Priv n
	n=0
	do whil j<=m.k and y+n<=y2
		@ y+n, 1 Say Left ( h[j], m.part) Colo (m.c)
		@ y+n, x Say Subs ( h[j], m.pt+bg, en) Colo (m.c)
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
	for i=1 to m.k
		f[i]=Chrt(f[i],'|','')
	endf
	if m.part>0
		f[2]=Stuf(f[2],m.part,1,'┬')
		for i=3 to m.k
			f[i]=Stuf(f[i],m.part,1,'│')
		endf
	endi
	line=Chrt(m.line,'|','')
	Stor '' to ch_off, g, ng, d6, d8
	do esc_code
	Store 0 to all, num
	if m.t>1
		Set Conf on
		defi wind pri from 10,30 to 13,45 shad titl " Печатать ";
			Color n/w,w+/bg,n/w,,,w+/b,,,n/w
		acti wind pri noshow
		@ 0,1 Say "Все"
		@ 0,0 Get m.all Pict "@*IT" Size 1,5
		@ 1,1 Say "Лист N" Get m.num Pict "@z";
			Size 1,Len(Allt(Str(m.t)));
			Vali Betw(m.num,iif(last()=13,1,0),m.t) and cl();
			Erro "Выберите лист oт 1 дo"+Str(m.t,3)
		Acti wind pri same
		Read Cycl
		Rele wind pri
		Set Conf off
		if m.all=0 and m.num=0
			Return
		endi
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
			*Rele m.all
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
		n=m.k-m.list+1
	endi
	for j=m.list+1 to m.n
		if !nprilin and f[j]#'─'
			? Left( Righ(m.line,m.l), a[m.num])
		endi
		if m.outch or f[j]#m.line
			if m.outch or lin(j+1) or lin(j)
				? Left( Righ(f[j],m.l), a[m.num])
			else
				? chr(27)+'-'+str0(j)+ch_off
			endi
		endi
	endf
	if	m.outbord
		? ch_off+str0(n+1)
	else
		? ch_off+Left( Righ(m.line,m.l), a[m.num])
		? str0(k-2)
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

Func str0
Parameter j
Private x, y
	x=f[j]
	y=''
	if m.x=chr(27)+'E'
		y=chr(27)+'E'
	endif
	if Subs(m.x, 3, 2)=chr(27)+'G'
		y=m.y+chr(27)+'G'
	endif		
	x=Strt(Strt(Strt(Strt(m.x, chr(27)+'E'), chr(27)+'G'), chr(27)+'F'), chr(27)+'H')
Return m.y+Left(Righ(m.x, m.l), a[m.num])+chr(27)+'F'+chr(27)+'H'
