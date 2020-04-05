Para x,titl,el,ro,co,mess,color,VANCE,f2, needx, choosen, ondo, edit
Priv a,titl,n,m,len
titl=iif(Empt(m.titl),'',' '+Allt(m.titl)+' ')
do defa with color,'n/w,,n/w,n/w,,w+/b'
do defa with m.ro,0
do defa with m.co,0
Decl a[1]
Stor 0 to n,m,len
do razbiv with m.x,a,n,m,len
if m.VANCE
	w=0
	for i=1 to m.n
		for j=1 to m.m
			w=Max(m.w, Len(a[m.i,m.j]))
		endf
	endf
	len=m.m*(m.w+1)+2
else
	Decl pos[m.n,m.m]
	for i=1 to m.n
		r=1
		for j=1 to m.m
			pos[m.i,m.j]=m.r
			r=m.r+Len(a[m.i,m.j-1])+1
		endf
	endf
endi
i=Len(m.titl)+5
l=Min(Max(m.len, m.i),80)
Defi Wind qu from m.ro,m.co	to m.ro+m.n+1, m.co+m.l;
	Shad Colo (m.color) None
Acti Wind qu NoShow
r=schm(m.color,3)
@ 0,0 to m.n+1,m.l+2 Doub Colo (m.r)
r=schm(m.color,4)
@ 0,Int((m.l-m.i)/2+2.5)+1 Say m.titl Colo (m.r)
firstPos=iif(m.len<m.i, Int((m.i-m.len)/2)+1, 1)
for i=1 to m.n
	for j=1 to m.m
		=say_(m.color)
	endf
endf
*	' F4-Дoбавить   F6-Изменить   F8-Удалить   Выбор-Enter   Выхoд-Esc'
if !Empt(m.mess)
	i=schm(m.color,5)
	Defi Wind ms from 24,0 to 24,79 None Color (m.i)
	Acti Wind ms
	@ 0,1 Say mess+iif(m.edit,'       F6-Изменить','')
endi
Acti Wind qu
k=0
i=aSca(a,m.el)
if m.i=0
	Stor 1 to i,j
else
	j=aSub(a,m.i,2)
	i=aSub(a,m.i,1)
endi
bright=schm(m.color,6)
gets=schm(m.color,2)
do whil k#27
	=say_(m.bright)
	k=inKe(0,'hm')
	=say_(m.color)
	do case
	case inLi(k,6,3)
		i=m.n
		j=m.m
		Do lessj
	case inLi(k,1,18)
		Stor 1 to i,j
	case inLi(k,19,15)
		if j=1
			j=m.m
			i=iif(i=1, m.n, i-1)
			do lessj
		else
			j=j-1
		endi
	case inLi(k,4,9)
		if m.j=m.m
			j=1
			i=iif(i=m.n, 1, m.i+1)
		else
			j=j+1
		endif
		if Empty(a[i,j])
			Store 1 to i,j
		endif
	case k=24
		if m.i=m.n
			i=1
		else
			i=m.i+1
			Do lessi
		endif
	case k=5
		if m.i=1
			i=m.n
			Do lessi
		else
			i=m.i-1
		endi
	case k=-1 and !Empt(m.f2)
		do (m.f2)
	case k=-5 and m.edit
		@ m.i,m.firstPos+iif(m.VANCE, (m.j-1)*m.w+m.j, pos[m.i,m.j]);
			Get a[m.i,m.j]	Colo (','+m.gets)
		Read
	case m.k=13 or m.k=151
		if Empt(m.ondo)
			Exit
		else
			r=.f.
			choosen=(m.i-1)*3+m.j
			Do (m.ondo) with m.r
			Acti Wind qu Same
			if m.r
				Exit
			endi
		endi
	case m.k>0
		l=aSca(a,chr(m.k))
		if l#0
			i=aSub(a,m.l,1)
			j=aSub(a,m.l,2)
		endi
	endC
endd
Rele Wind ms,qu
if m.needx
	x=''
	for ii=1 to m.n
		y=''
		for jj=1 to m.m
			y=m.y+"│"+a[m.ii,m.jj]
		endf
		x=m.x+Stuff(m.y,1,1,'')+"▐"
	endf
endi
choosen=iif(k=13,a[m.i,m.j],m.el)
Return m.choosen

Proc lessj
	do whil Empt(a[m.i,m.j])
		j=m.j-1
	endd
Retu

Proc say_
Para m.c
	@ m.i, m.firstPos+iif(m.VANCE, (m.j-1)*m.w+m.j, pos[m.i,m.j]);
		Say a[m.i,m.j]	Colo (m.c)
Retu

Proc lessi
	if Empt(a[m.i,m.j])
		i=1
	endif
Return
