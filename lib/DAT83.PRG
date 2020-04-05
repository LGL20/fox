Parameter date
Private x, y
date=iif(Year(m.date)>1950, m.date,;
	CtoD(Stuff(DtoC(m.date), 7, iif(Set('Cent')='ON',2,0), '20')));
	-CtoD('1.1.1900')
if m.date<0
	Wait Window wai('Дата oшибoчная и запoмнена не будет') NoWait
	Return ''
endif
y=m.date%255
x=(m.date-m.y)/255
Return iif(m.date=0, '', chr((m.date-m.x*255-m.y)/65025)+chr(m.x)+chr(m.y))
