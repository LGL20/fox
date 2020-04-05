Parameter field
Private code
Calculate to code Max(&field)
if m.code=Int(Val(Replicate('9', fSize(m.field))))
	=ok('Переполнение кода|Обратитесь к разработчику')
	Return 0
endif
Return m.code+1
