* m.Cprocessname - имя процесса (или заголовок окна)
* m.npriz= 0 - поиск по имени процесса, иначе - по заголовку окна 
* m.nlen - количество процессов
* amass - двумерный массив (x,y)
* amass(x,1) - имя процесса
* amass(x,2) - окно
Parameters Cprocessname, npriz
Local nCharSimv, nlen, nfound, cTest, cnn, cext, i, j, amass[1], library
if Empty(m.Cprocessname)
	MessageBox('Не задан параметр поиска', 16, 'Отсутствие данных')
	Return -1
endif
npriz = iif(parameters()=1 or m.npriz=0, 1, 2)
Store 0 to nlen, nfound
Cprocessname = Lower(ALLTRIM(m.Cprocessname))
library = Set('Library')
Set Library to cliutil.fll
nlen = Findprocess('amass')
Set Library to &library
for i=1 to m.nlen
	cTest = lower(alltrim(amass[m.i, m.npriz]))
	If m.Cprocessname==m.cTest
		nfound=m.nfound+1
	Endif
Endfor
If m.nfound=0 and m.npriz=1
	For i=1 to m.nlen
		cext=JUSTEXT(alltrim(amass[i,1]))
		cnn=JUSTSTEM(alltrim(amass[i,1]))
		For j=1 to len(m.cnn)
			nCharSimv=asc(substr(m.cnn,j,1))
			If m.nCharSimv<80
				cnn=strtran(m.cnn,substr(m.cnn,j,1),chr(m.nCharSimv+176))
			Endif
		Endfor
		cTest=lower(alltrim(m.cnn)+'.'+m.cext)
		If m.Cprocessname==m.cTest
			nfound=m.nfound+1
		Endif
	Endfor
Endif
Return m.nfound
