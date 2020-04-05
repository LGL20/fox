Parameter table, recno, who
Private lock, sele, done, OnError
OnError=On("Error")
On Error done=.f.
lock='M:\fox\common\lock.dbf'
sele=Select()
Do Case
Case !File(m.lock)
	Create Table (m.lock) (table C(8), recno N(10), who C(1))
Case Used('lock')
	Select lock
Otherwise
	Select 0
	Use (m.lock)
EndCase
Locate For table=m.table and recno=m.recno
done = !Found()
if m.done
	Do recapp
else
	lock = who
	Use foxuser.ini
	Locate For kind = m.lock
	MessageBox('Запись сейчас изменяет другой пользователь';
		+iif(Empty(name), '', chr(13)+'('+win(Trim(name))+')'),;
		64,	'Общий доступ к данным')
endif
Use
Select (m.sele)
On Error &OnError
Return m.done
