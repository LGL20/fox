Private varr
varr='m.'+Varr()
varr=&varr
if !Empty(Strt(m.varr, '.'));
and Empty(CtoD(Stuff(m.varr, 7, 0, iif(Val(Right(m.varr, 2))<50, '20', '19'))))
	Wait Window 'Дата введена неверно' NoWait
	Return 0
endif
Return .t.
