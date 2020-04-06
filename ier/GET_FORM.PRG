Parameter form, class, title
if wExist(m.title)
	Activate Window (m.title) Top
else

retu
form = AllTrim(m.form)
Modify formect (m.form) NoWait NoShow
form = Upper(m.form)
for i=1 to Application.formects.Count
	if m.form=upper(alltrim(Application.formects.Item(m.i).Name))
		Return Application.formects.Item(m.i)
	endif
endfor
Return null