Parameter base, new
if !File(m.path+m.base+'.dbf') and !File(m.program+m.base+'.dbf')
	if File(m.oldpath+m.base+'.dbf') and !m.new
		name=m.base
		=cpf('dbf')
		=File(m.oldpath+m.base+'.idx') and cpf('idx')
		=File(m.oldpath+m.base+'.ord') and cpf('ord')
	else
		Return .t.
	endif
endif
Return .f.
