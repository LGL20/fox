do while !Print() and menu02('Принтер не гoтoв !', 'Печать', 'Отменить')
endd
if Prin()
	Set Console off
	Set Printer on
else
	Set Printer off
	Set Console on
endi
Return Prin()
