Para max, dir
Priv i,n,r,dbf
n=aLen(base)
Decl base[n], ind[n]
Do defa with m.max,10
Do defa with m.dir,''
Sele 1
Use dels
Scan for del>max and ''#base[RecN()]
	Repl del with 0
	i=RecN()
	Sele 2
	Use (base[i])
	Pack
	r=ind[i]
	if !Empt(m.r)
		dbf=Dbf()
		dbf=Left(m.dbf, Len(m.dbf)-4)
		Inde on &r to (m.dbf) Comp
	endi
	Use
EndS
Use
