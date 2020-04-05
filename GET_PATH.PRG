Parameter varr
Private dir, new
dir=Full('')
do defa with m.varr, ''
varr='m.m_'+m.varr+'path'
path=&varr
if !Empty(m.path)
	On Error new=.f.
	Set Default to &path
	On Error
endif	
new=GetFile('dbf', 'Выберите путь к данным:')
if ''#m.new
	Store Left(m.new, Rat('\', m.new)) to (m.varr)
endif
Set Default to &dir
Return .t.
