Parameter do
Return .t.

Private i, tables, sele
Do defa with m.do, ' '
if Type('m.base')#"C"
	i=0
	Do While ''#sys(16,m.i+1)
		i=i+1
	Enddo
	base=Sys(16,m.i-1-iif("PPBASE." $ Sys(16,m.i-1), 1, 0))
	base=Subs(m.base, Max(1,Rat('\',m.base)+1), 100)
	base=Lower(Left(m.base, At('.',m.base)-1))
endif
sele=Select()
Select 0
Use tables Again
Locate For Lower(alias)=Lower(m.base)
tables=id
tableID=id
Use permit Again
*Locate For for_user=m.UserID and tables=m.tables
Locate For user=m.UserID and tables=m.tables
i=rights
Do Case
Case m.i=' '
	=ok('Извините,▌у Вас нет прав на просмотр▌данной информации')
	Return .f.
Case m.do#"E"
	Use _log Again
	date_=date83(Date())
	time_=time83()
	Do recapp
	Replace user with m.UserID
EndCase
Use
Select (m.sele)
Return m.i='' or (m.do#"E" and m.i='')
