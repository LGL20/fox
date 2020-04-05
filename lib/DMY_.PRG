Parameter date, ukr
if Type('m.date')="C"
	date=date38(m.date)
endif
Return iif(Empty(m.date), '',;
	Tran(Day(m.date), '@l 99')+' '+bb(Month(m.date), m.ukr)+Str(Year(m.date), 5);
	+iif(m.ukr, ' ğ.', ' ã.'))