Parameter date
if Year(m.date)<=1950
	date=CtoD(Stuff(DtoC(m.date), 7, iif(Set("Cent")="ON", 2, 0), '20'))
endif
Return m.date
