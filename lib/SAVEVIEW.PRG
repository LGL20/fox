Parameter temp, rec
*temp=TempName()
temp='c:\view.tmp'
Create View (m.temp)
Declare rec[25]
for i=1 to 25
	rec[i]=RecNo(i)
endfor
