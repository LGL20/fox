*	ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
*	³      ‚ë¢o¤  ä ©«  oâç¥â  ­  íªà ­ (¨) ¯¥ç âì          ³
*	ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Para x
Set Cons on
Clos Alte
Set Alte off
Defi Wind otch from 0,iif(Empt(m.x), 76-_RMARGIN, 0);
	to 23, iif(Empt(x), 79, m.x) Shad Float Grow Titl '';
	Colo  n/w,n/w,n/w,w/n,w/n
Wait Clea
if Set("Curs")="OFF"
	Set Curs on
endif
Set Sysm to _MSM_WINDO
Set Sysm on
Modi File vrem.txt Noed Wind otch
Rele Wind otch
Set Sysm to defa
Set Sysm off
Set Head off
Do whil menu02('¥ç â âì ? ')
	do whil !Prin() and Menu02('à¨­â¥à ­¥ £oâo¢ !', ' o¢âoà¨âì ', '‚ë©â¨')
	endd
	if !Prin()
		exit
	else
		Set Cons off
		Stor 0 to _PLOFFSET,_LMARGIN,_INDENT
		Type vrem.txt to Prin
	endi
	Set Cons on
endD
Dele File vrem.txt
Set Prin off
