Private path, i, now
path=''
i=1
now = Prog()
Do While Prog(m.i)#m.now
	x = Prog(m.i)
	if m.x#"ON... "
		path = m.path + '\'+Prog(m.i)
	endif
	i=m.i+1
Enddo
Set Prin to error.log Addi
Set Prin on
? "�訡�� = "+Mess()
? "���    = "+Mess(1)
? "����   = "+Stuff(m.path,1,1,'')
? "��ப� = "+Allt(Str(Line()))
?
Set Prin to
Set Prin off
if inEXE()
	Quit
else
	Cancel
endif
