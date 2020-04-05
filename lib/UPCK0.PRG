Parameter children
Private i,k,n,parent,child,old
Wait Wind "Packing the base. Wait, please..." NoWa
do defa with m.children,''
children=Uppe(children)
Decl child[1]
n=0
do spis with m.children, child, n
parent=Alia()
for i=1 to m.n
	Select 0
	Use (child[m.i]) Again Alias ('b_'+child[i])
	Copy to (child[m.i]+'.old')
endf
Select (m.parent)
Copy to (m.parent+'.old')
k=Replicate(chr(1), Len(kod))
Scan
	old=kod
	Replace kod with m.k
	for i=1 to m.n
		Select ('b_'+child[i])
		Replace (m.parent) with m.k for &parent=m.old
	endf
	k=kd(m.k)
EndScan
for i=1 to m.n
	Select ('b_'+child[i])
	Use
endf
Select (m.parent)
parent=Dbf()
Inde on kod to (Left(m.parent, Len(m.parent)-4)) Compact
Wait Clea
