Parameter file1, file2
Do getf with m.file1, 'Первый'
if ''#m.file1
	Do getf with m.file2, 'Второй'
	if ''#m.file2
		f1=FOpen(m.file1)
		f2=FOpen(m.file2)
		win=.f.
		Do _prin
		Do While !Feof(m.f1) and !Feof(m.f2)
			s1=FGets(m.f1)
			s2=FGets(m.f2)
			if !m.s1==m.s2
				? m.s1
				? m.s2
				?
			endif
		EndDo
		Do While !Feof(m.f2)
			? '▌'+FGets(m.f2)
		EndDo
		=FClose(m.f1)
		=FClose(m.f2)
		?
		=ModiFile(250)
	endif
endif


Proc getf
Parameter file, text, getf
	getf=Empty(m.file) or Type('m.file')#'C'
	if !m.getf
		if At('.', m.file)=0
			file=m.file+'.txt'
		endif
		getf=!File(m.file)
	endif
	if m.getf
		file=GetFile('txt', m.text)
	endif
Return
