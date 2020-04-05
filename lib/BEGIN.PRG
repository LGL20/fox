PARAMETERS INWIN, KEY
PUBLIC PATHUSER, WIN
*, PATHLIB, PATHL, PathFoxWin, INEXE, CANEDI
Set TALK OFF
Set HOURS to 24
Set ESCAPE OFF
WIN=m.INWIN
CLEAR MACROS
ON KEY 
DEFA=SYS(16,0)
DEFA=SUBSTR(m.DEFA,AT(':',m.DEFA)-1,LEN(m.DEFA))
Set DEFAULT to (LEFT(m.DEFA,RAT('\',m.DEFA)))
= NUMLOCK(.T.)
Set CENTURY OFF
Set SAFETY OFF
Set HELP OFF
Set SYSMENUS OFF
Set DELETED ON
Set BELL OFF
Set SHADOW ON
Set MESSAGE to 24
Set SEPARATOR to "'"
Set DATE Germ
Set EXACT OFF
Set HEADINGS OFF
Set TEXTMERGE ON
Set Text Delimiters to '{', '}'
Set CONSOLE OFF
Set EXCLUSIVE OFF
Set STATUS OFF
Set REPROCESS to 20
Set BLINK OFF
_WRAP=.F.
_RMARGIN=255
PATHUSER='c:\work\'
IF !FILES(m.PATHUSER+'user.mem')
	R='mkdir '+LEFT(m.PATHUSER,LEN(m.PATHUSER)-1)
	!&r
	SAVE to (m.PATHUSER+'user') ALL LIKE s
ENDIF
*CANEDI=EMPTY(m.KEY).OR.FILES(m.PATHUSER+m.KEY+'.mem')
*ON KEY LABEL F6 Do edi_
*IF m.CANEDI
	ON KEY LABEL Ins Do add
	*ON KEY LABEL Del Do del
	*ON KEY LABEL F4 Do add
	ON KEY LABEL F8 Do del
*ENDIF
*PathFoxWin='m:\Foxpro\VFP6.EXE -t '
*INEXE=INLIST(RIGHT(m.DEFA,3),'EXE','APP')
IF INEXE()
	Set DEBUG OFF
	Set RESOURCE OFF
	*STORE '' to PATHL, PATHLIB
ELSE
	DEACTIVATE MENU ALL
	DEACTIVATE POPUP ALL
	CLOSE ALL
	CLEAR FIELDS
	CLEAR GETS
	CLEAR MENU
	CLEAR POPUP
	CLEAR PROMPT
	CLEAR READERROR
	CLEAR TYPEAHEAD
	CLEAR WINDOW
	Set COLOR to 
	CLEAR
	Set DEVELOPMENT ON
	if m.win
		PathL='L:\lib;L:\common;L:\lib\encrypt;L:\Foxpro\lib;L:\Foxpro\common'
		Set Path to (m.PathL)
		PathL=';'+m.PathL
	else
		*PathLib=';'+SYS(2004)+'lib;'+SYS(2004)+'common;'+SYS(2004)+'lib\encrypt'
	endif
	SET DEVELOPMENT ON
	ON KEY LABEL Ctrl+O Do modicomm
	ON KEY LABEL F11 Do mysuspen
ENDIF
*On Error Do catch_er
IF m.WIN
	Set Clock off
else
	Set CLOCK to 0, 72
	Set Color to
	Set Color of Scheme 1 to N/W,N/BG,N/W,B/W,B/W,W+/B,GR+/RB,,N/W,W/W
	Set Color of Scheme 2 to N+/W,N/W,,,,W+/B,GR+/W,,,N+/W
	Set Color of Scheme 6 to ,W+/BG,,,,W+/B,GR+/W,,,N+/W
	Set Color of Scheme 13 to B/BG, GR+/B, N/BG, W+/N, W/N, W+/B, GR+/BG, w/n, N/BG, BG/BG
	Set Color of Scheme 14 to N/W,W+/B,N/W,N/W,N+/W,W+/B,GR+/W,,N/W,W/W
	Set Color of Scheme 15 to ,N*/W,R+*/W,R*/W,N/W,W+/GR
	Set Color of Scheme 16 to N/W,N/BG,N/W,B/W,B/W,W+/B,GR+/W,,N/W,W/W
ENDIF
On Error
RETURN .T.
