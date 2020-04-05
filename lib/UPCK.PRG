Para children, areas, save, saveParent, with_filt
Priv i,j,k,n,parent,child,area
Wait Wind "Packing the base. Wait, please..." NoWa
Crea View upck
do defa with m.children,''
do defa with m.areas,''
do defa with m.save,0
do defa with m.saveParent,0
n=0
children=Uppe(children)
Decl child[1], area[1]
do spis with m.children, child, n
do spis with m.areas, area
parent=Alia()
for i=1 to m.n
	if File(child[m.i]+".cdx")
		j="Orde "+m.parent
	else
		j="Inde "+child[m.i]
		if File(Left(child[m.i]+"_"+m.parent,8)+".idx")
			j=m.j+"_"+m.parent
		endi
	endi
	Use (child[m.i]) in (Val(area[m.i])) &j
endf
Rele area
i=Repl (chr(1), Len(kod)-m.saveParent)
Sele 0
Crea Tabl upck (base C(8), rec N(10))
Inde on base+Str(rec) to upck
Use upck Exclusive
Sele (m.parent)
if !m.with_filt
	Set Filt to
endi
Go Top
Scan
	k=kod
	for j=1 to m.n
		Sele (child[m.j])
		Set Rela off into upck
		Set Rela to Alia()+Str(RecN()) into upck
		if Left(Sys(14,1),Len(m.parent))=m.parent
			Seek m.k
			Scan Whil &parent=m.k For upck.rec=0 
				do rpl
			EndS
		else
			Loca for &parent=m.k and upck.rec=0
			do whil Foun()
				do rpl
				Conti
			endd
		endi
	endf
	Sele (m.parent)
	Repl kod with Left(kod,m.saveParent)+i
	i=kd(i)
EndS
Set View to upck
Eras upck.vue
Eras upck.dbf
Eras upck.idx
Wait Clea
Retu .t.

Proc rpl
	Repl (m.parent) with Stuf(&parent,m.save,Len(m.i),i)
	Inse into upck (base,rec) Valu (child[m.j],RecN(child[m.j]))
Retu
