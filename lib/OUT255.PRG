Private nar, i
Set Filter to
if Type('ar')="N"
	if Type(Alias()+'.name')="C"
		nar=aLen(ar)
		Declare ar[m.nar]
		for i=1 to m.nar
			Go ar[m.i]
			Do while name=chr(255)
				Replace name with Stuff(name,1,1,'')
			EndDo
		endfor
	endif
endif
