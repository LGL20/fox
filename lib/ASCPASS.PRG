Parameter new, TryKind, forEdi
Private key, pass1, was, result, pass0
*pass0='foxuser.ini'
*was=Used('foxuser')
pass0='user'
was=Used(m.pass0)
Do Case
*Case !File(m.pass0+'.dbf')
*	Create Table (m.pass0) (id C(2), name C(30), word C(30), sys C(20))
	*, kind C(1)
Case m.was
	*Select foxuser
	Select (m.pass)
Otherwise
	Select 0
	Use (m.pass0)
EndCase
Do defa with m.new, 0
col=iif(m.new=1, 3, iif(m.new=2, 5, 0))
Define Window ascpass from 9,28-m.col to 12,45+m.col;
	Shadow NoClose Float Color n/w,n/bg
Activate Window ascpass NoShow
pass0=''
@ 0,1 Say iif(m.new=2,'Подтвердите ', 'Введите ');
	+iif(m.new=0, '', 'новый ')+'пароль'
@ 1,1 Say Space(14) Color bg/bg
key=0
col=1
result=.f.
Activate Window ascpass
Do While .t.
	key=inkey(0,'h')
	Do Case
	Case m.key=27
		result=.f.
		Exit
	Case m.key=13
		Do Case
		Case ''=m.pass0
			Wait Window 'Hужен пароль!' NoWait
		Case m.new=0
			pass1=translat(m.pass0)
			Locate for word=m.pass1
			if Found()
				result=(Empty(m.TryKind) or id$m.TryKind);
					and (Empty(sys) or sys=Sys(0))
				if m.result
					user_name=fromwin(Trim(name))
					user=id
					UserID=id
				else
					=ok('Простите,▌у вас нет права доступа▌к данной информации.')
				endif
				Exit
			else
				Wait Window 'Пароль введен неверно!' NoWait
				pass0=''
				col=1
				@ 1,1 Say Space(14) Color bg/bg
			endif
		Otherwise
			result=.t.
			Exit
		EndCase
	Case inList(m.key, 1,3,4,5,6,7,9,18,19,22,24,32)
	Case m.key=127
		col=Max(m.col-1, 1)
		@ 1, m.col Say ' ' Color n/bg
		pass0=Left(m.pass0, m.col-1)
	Case m.key>0
		if m.col<15
			@ 1, m.col Say '*' Color n/bg
		endif
		col=Min(m.col+1, 15)
		if m.col<15
			pass0=m.pass0+chr(m.key)
		endif
	EndCase
EndDo
if m.result
	pass=m.pass0
	*kind=kind
	*if Type('m.forEdi')="C"
	*	CanEdi=At(kind, m.ForEdi)#0
	*endif
endif
if !m.was
	Use
endif
Release Window ascpass
if m.result
	Private count
	result=.f.
	if File('tome.dbf')
		Select 0
		Use user Again
		Locate for id=m.user
		count=count
		Use tome Again
		Locate for user=m.user
		if !Found()
			Append Blank
			Replace user with m.user, count with m.count
		endif
		if count#0
			result=.t.
			if m.count<count or count<0
				Replace count with m.count
			endif
			if count>0
				Replace count with Max(0, count-1)
			endif
		endif
		Use
		=m.result or ok('Срок действия лицензии истек')
	else
		=ok('Hе найден файл tome.dbf')
	endif
endif
Return m.result

Proc add
Return
Proc edi
Return
Proc del
Return
