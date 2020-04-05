Parameter date, ukr
Private b, m
Declare b[12]
Do mon with b, m.ukr
m=b[Month(m.date)]
Return iif(m.win, win(m.m), m.m)
