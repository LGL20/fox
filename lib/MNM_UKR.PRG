Parameter mon
if m.mon=0
	Return ''
else
	Private b
	Declare b[12]
	Do mon_ukr with b
	Return win(b[m.mon])
endif
