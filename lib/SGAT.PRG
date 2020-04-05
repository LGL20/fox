Priv n,p,i,l,r
n=aLen(e)
l=Len(m.foot)
p=1
i=0
Do Whil fnd(m.foot,' ')
	p=m.p+m.i
	if Subs(m.titl,m.p,1)=' '
		titl=Stuf(m.titl,m.p,1,'')
		Do sga
	else
		if !fnd(m.titl,'')
			i=Len(m.titl)
		endi
		r=m.p+m.i-2
		if Subs(m.titl,m.r,1)=' '
			titl=Stuf(m.titl,m.r,1,'')
			Do sga
		endi
	endi
EndD

Proc sga
	foot=Stuf(m.foot,m.p,1,'')
	for i=1 to m.n
		e[m.i]=Stuf(e[m.i],m.p,1,'')
	endf
	p=m.p-1
Retu

Proc fnd
Para str, x
	i=At('³'+m.x,Subs(m.str,m.p,m.l))
	if m.i=0
		i=At('°'+m.x,Subs(m.str,m.p,m.l))
	endi
Retu m.i#0 and !Empt(Subs(m.str,m.p,m.i-1))
