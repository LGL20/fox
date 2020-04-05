Parameter date
Private x, y
date=m.date+iif(Year(m.date)>1950, 0, 36525)
date=m.date-firstDat()
y=m.date%255
x=(m.date-m.y)%65025
Return iif(m.date<=0, '', chr(((m.date-m.x-m.y)%(255^3))/65025)+chr(m.x/255)+chr(m.y))
