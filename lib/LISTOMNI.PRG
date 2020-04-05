* Вызывающая программа должна иметь:
* Func no_empty
* Proc ListBody
* Proc paint
* Proc sums Parameter sign
* Proc BeforeL
* Proc ListStr
* Proc EmpStr

Parameter parent, flt, ColorActive, ColorNoActive
Private ro, no_empty, first, i, x, key, beginL, sele
if inList(LastKey(), 5, 15, 19)
	Seek m.flt
	if Found()
		Count to ro While &parent=m.flt
		beginL=Max(0, m.ro-m.hei+1)
		ro=Min(m.ro, m.hei-1)
		Do say_h
	else
		ro=0
	endif
else
	ro=0
endif
sele=Select()
beginL=0
On ReadError qqqqqqq=0	&& ничего не делать см. ClrR
Do While .t.
	if &parent=m.flt
		Scatter Memvar
	else
		Scatter Memvar Blank
	endif
	ro=m.ro+m.RowList
	=paint(m.ColorActive)
	first=.t.
	Do ListBody
	Read
	key=LastKey()
	=paint(m.ColorNoActive)
	ro=m.ro-m.RowList
	if m.key=-7
		Loop
	endif
	no_empty=no_empty()
	Select (m.sele)
	if &parent=m.flt
		Gather Memvar
		for i=1 to FCount()
			x=Field(m.i)
			if Type(m.x)="M"
				Replace (m.x) with m.&x
			endif
		endfor
	else
		=m.no_empty and recapp()
	endif
	Do Case
	Case inList(m.key, 5, 15, 19)
		if Bof()
			Exit
		endif
		Skip -1
		if Bof() or &parent#flt
			Exit
		endif
		if m.ro=0
			beginL=m.beginL-1
			Do say_h
		else
			ro=m.ro-1
		endif
	Case m.key=18
		if m.ro=0
			if m.beginL=0
				Exit
			endif
			rec=RecNo()
			Do While !Bof() and m.beginL>0 and &parent=m.flt
				Skip -1
				beginL=m.beginL-1
				rec=RecNo()
			EndDo
			=GoRec(m.rec)
			Do say_h
		else
			Skip iif(&parent#m.flt, 1, 0)-m.ro
			ro=0
		endif
	Case m.key=3
		if &parent#m.flt
			Exit
		endif
		Count Next m.hei While &parent=m.flt to i
		if m.ro+1=m.hei
			ro=m.i
			beginL=m.beginL+m.hei
			Do say_h
		else
			if m.i=m.hei or Eof()
				ro=m.i-1
			else
				ro=m.ro+1
				Skip
			endif
		endif
	Case m.key=27 or &parent#m.flt
		Exit
	Otherwise
		if !Eof()
			Skip
		endif
		if m.ro+1=m.hei
			beginL=m.beginL+1
			Do say_h
		else
			ro=m.ro+1
		endif
	EndCase
EndDo
On ReadError

Func ClrR
	if !m.first and inList(LastKey(), 24, 5, 3, 18, 29, 23)
		Clear Read
		Return .f.
	endif
	first=.f.
Return .t.

Proc del
	=sums(-1)
	if &parent=m.flt
		Delete
		Locate Rest For !Delete() While &parent=m.flt
		Do say_h
	endif
	Clear Read
Return

Proc AfterL
Private top, bottom, right
	top=m.RowList-1
	bottom=m.RowList+m.hei
	right=wCols()-1
	if m.hn+m.beginL>=m.HEI
		@ m.top, m.right to m.bottom, m.right Color N/N PANEL
		@ m.top, m.right Say '' Color W+/N
		@ m.bottom,  m.right Say '' Color W+/N
	else
		@ m.top, m.right to m.bottom, m.right Color n/bg
		@ m.top, m.right Say '┤' Color n/bg
		@ m.bottom,  m.right Say '╡' Color n/bg
	endif
Return
