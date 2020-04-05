DO Case
Case inEXE()
	QUIT
Otherwise
	SET HELP ON
	Set Sysm to Default
	Set Sysm on
	On Key
	Clos All
	if Type('m.win')='U' or !m.win
		Set Color of Scheme  1 to
		Set Color of Scheme  2 to
		Set Color of Scheme  6 to
		Set Color of Scheme 13 to
		Set Color of Scheme 14 to
		Set Color of Scheme 15 to
		Set Color of Scheme 16 to
		Clear All
		Do begin
	else
		Clear All
	endif
	Set Color to
	Clear
	CANCEL
EndCase
