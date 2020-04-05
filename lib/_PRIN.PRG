Private temp
temp=TempName()
*if !m.win
	Set Console off
	Set Printer to (m.temp)
	Set Printer on
*endif
Return m.temp
