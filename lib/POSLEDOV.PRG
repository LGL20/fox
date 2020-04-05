Parameter b, k, pck, ZeroLen
Private first, second, i
pck=''
do defa with m.ZeroLen, 0
if m.k>0
	Declare b[k]
	=aSort(b)
	Store b[1] to first, second
	for i=1 to k
		if b[i]=m.second+1
			first=m.second
			second=b[i]
		else
			second=b[i]
			Do tx
			first=b[i]
		endif
	endfor
	i=k
	if m.second>m.first
		Do tx
	endif
	pck=Stuf(m.pck,1,1,'')
endif

Proc tx
Private r
	r=iif(m.second-m.first=1, '-'+PadL(m.second, m.ZeroLen, '0'),;
		','+PadL(b[i], m.ZeroLen, '0'))
	if Right(m.pck, Len(m.r))#m.r
		pck=m.pck+m.r
	endif
Return
