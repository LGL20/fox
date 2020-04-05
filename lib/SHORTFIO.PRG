Parameter fio
Private p
fio=Rtri(m.fio)
p=At(' ',m.fio)
if m.p=0
	short=m.fio
else
	short=Left(m.fio, m.p-1)+' '+Substr(m.fio,m.p+1,1)+'.'
	fio=Stuff(m.fio,1,m.p+1,'')
	p=At(' ',m.fio)
	if m.p=0
		if Right(m.fio,1)='.'
			short=m.short+Right(m.fio,2)
		endif
	else
		short=m.short+Substr(m.fio,m.p+1,1)+'.'
	endif
endif
Return m.short
