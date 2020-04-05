Parameter FirstParam
Private J, I, rec
Do BeforeL
i=m.RowList
rec=RecNo()
j=m.beginL
Seek m.flt
Do While !Eof() and &parent=m.flt and m.j>0
	j=j-1
	Skip
EndDo
SCAN While &parent=m.flt Next m.hei
	Do ListStr
	i=i+1
ENDScan
for i=m.i to m.RowList+m.hei-1
	Do EmpStr
endfor
if Between(m.rec, 1, RecC())
	Go m.rec
else
	Go Bottom
	Locate Rest For .f.
endif
Do AfterL
