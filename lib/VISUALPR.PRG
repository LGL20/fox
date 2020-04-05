Parameter prg_name, param
Private temp, defa
defa=Full('')
temp='c:\work\temp.bat'
Set Console off
Set Print on
Set Print to (m.temp)
?? '@ECHO OFF'
? 'm:\vfp\VFP6.EXE -t ';
	+iif(inEXE(), 'm:\'+m.prg_name+'.exe', 'L:\poltgaz\'+m.prg_name+'.prg');
	+' '+iif(Empty(m.param), '', m.param)+' >nul'
Set Printer to
Set Printer off
Set Default to m:\vfp
!&temp
Set Default to &defa
Erase (m.temp)
Return .t.