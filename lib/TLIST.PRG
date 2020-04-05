* Это работает только когда запускаеш как EXE
* Запущена ли дважды данная программа
	cProg=JUSTFNAME(sys(16))
	if Findprocess(cProg)>1
		messagebox('Запущен дубль программы')
	endif
