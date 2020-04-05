Parameters max, dir
Private i,n,r,dbf
n=aLen(base)
Decl base[n], ind[n]
Do defa with m.max,10
Do defa with m.dir,''
Select 1
Use dels
Scan for del>max and ''#base[RecN()]
	Repl del with 0
	i=RecN()
	Select 2
	Use (base[i]) Exclusive
	Pack
	r=ind[i]
	if !Empt(m.r)
		dbf=Dbf()
		dbf=Left(m.dbf, Len(m.dbf)-4)
		Index on &r to (m.dbf) Compact
	endi
	Use
EndScan
Use
for i=1 to n
	if !Empty(base[i])
		Erase (m.dir+base[i]+'.bak')
	endif
endfor
