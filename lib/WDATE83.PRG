Parameter date
Private x, y
if Empty(m.date)
	Return ''
else
	date=m.date+iif(Year(m.date)>1950, 0, 36525)
	date=m.date-CtoD('30.12.1899') + 693593 +1
	y=m.date%255
	x=(m.date-m.y)%65025
	Return iif(m.date<=0, '', chr(((m.date-m.x-m.y)%(255^3))/65025 +1)+chr(m.x/255+1)+chr(m.y))
endif