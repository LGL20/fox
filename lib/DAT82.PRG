Parameter date
date=iif(Year(m.date)>1950, m.date,;
	CtoD(Stuff(DtoC(m.date), 7, iif(Set('Cent')='ON',2,0), '20')));
	-CtoD('01.01.1900')
if m.date<0
	Wait Window wai('��� o訡o筠� � ���o����� �� �㤥�') NoWait
	Return ''
endif
Return iif(m.date=0 or m.date>=65280, '', chr((m.date-m.date%255)/255)+chr(m.date%255))
