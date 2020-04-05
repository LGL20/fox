Parameter now, year
Release win
Public inExe, PATHUSER, win, m_year
Local path
Set Delete on
*Set Bell off
Set Exclusive off
Set Talk off
Set Safety off
Set Date German
Set MULTILOCKS ON
win=.t.
PATHUSER='c:\work\'
INEXE=INLIST(RIGHT(SYS(16,0), 3),'EXE','APP')
*!*	path=';L:\'+m.now+'\WIN\'
*!*	Set Path to ('M:\Fox\'+m.now;
*!*		+';m:\fox\common;m:\fox;L:\Lib;L:\Lib\Win;L:\Lib\Encrypt;L:\Lib\WIN\Import;L:\Common;L:\Common\WIN';
*!*		+m.path+';'+m.PathUser+';L:\'+m.now)
Set Path to ('L:\Lib;L:\Lib.WIN;L:\'+m.now+';L:\Common;c:\work')
Set ClassLib to classlib Additive
**Set Classlib to commlib Additive
if m.inexe
	DECLARE INTEGER LoadKeyboardLayout IN win32api STRING @, INTEGER
	LoadKeyboardLayout('00000419', 1)	&&Russian Layout
	CLEAR DLLS
endif
if Empty(m.year)
	m_year=Year(Date())
	if File(m.PATHUSER+'user.mem')
		Restore from (m.PATHUSER+'user.mem') Additive
	endif
else
	m_year=m.year
endif
Set Path to (Set('path')+';m:\;m:\'+Str(m.m_year, 4))
