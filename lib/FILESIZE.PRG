Parameter file, table, sele
Private size, handle, was, was_sele
size=0
Do Case
Case !Type('m.file')="C"
	=ok('Имя файла не задано')
Case !File(m.file)
	=ok('Файл▌'+m.file+'▌не найден')
Otherwise
	table=Rat('\', m.file)
	table=Stuff(m.file, 1, m.table, '')
	table=Left(m.table, Rat('.', m.table)-1)
	was=Used(m.table)
	if m.was
		sele=Select()
		Select (m.table)
		was_sele=Select()
		Use
		Select (m.sele)
	endif
	handle=fOpen(m.file)
	if m.handle<0
		=ok('Файл▌'+m.file+'▌не удалось открыть')
	else
		size=fSeek(m.handle,0,2)*.001
		=fClose(m.handle)
	endif
	if m.was
		Use (m.file) in (m.was_sele)
	endif
	Select (m.sele)
EndCase
Return m.size
