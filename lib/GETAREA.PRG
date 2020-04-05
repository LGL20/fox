Parameter base
area=0
On Error area=0
if Used('TABLES')
	Select tables
else
	Select 0
	Use tables
endif
Locate For base=m.base
area=area
Return errorif(m.area<=0, 'Îáëŕńňü äë˙ ňŕáëčöű '+m.base+' íĺ íŕéäĺíŕ')
