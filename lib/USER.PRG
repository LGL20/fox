Parameter sl
Return ppbase()

Proc stay
	Select 0
	Use permit Again
	Locate For for_user=user.id
	fnd=iif(Found(), 'разрешения', .f.)
	Use
	Select user
Return

Proc dfpp
	Define Popup (m.pfp) from 7,10;
		Margin Mark ' ' Title ' Пользователи ' Message msg();
		Shadow Scroll in Screen Prompt Field fromwin(name);
		Color ,n/w,n/w,b/w,gr+/bg,w+/b
Return

Proc defs
	user_name=fromwin(user.name)
	if realsl()
		f_user=id
	endif
Return

Proc edi
	name=fromwin(m.name)
	i=m.count<0
	if m.i
		count=0
	endif
	Define Window (m.pfp) from 10,15 to 16,52 Shadow Float;
		Title ' Пользователь ' Footer aefoot()
	Activate Window (m.pfp)
	@ 0,1 Say 'Имя' Get m.name
	@ 1,1 Say 'Количество запусков' Get m.count Picture "@z 99999"
	@ 2,1 Get m.i Function '*cn не ограничено' Valid ac()
	@ 4,12 Get m.u Default 0 Function '*t \! Закрыть' Size 1,11
	Read Activate ac()
	Release Window (m.pfp)
	name  = AllTrim(m.name)
	count = iif(m.i, -1, m.count)
	empty = ''=m.name
	Select 0
	Use tome Again
	Locate for user=m.id
	Do Case
	Case !Found()
		Append Blank
		Replace user with m.id, count with m.count
	Case m.count>0 and count<m.count;
	and menu02('Для "'+m.name+'" осталось '+Ltrim(Str(count));
	+' запусков программы▌установить '+Ltrim(Str(m.count))+' ?')
		Replace count with m.count
	EndCase
	name  = towin(m.name)
Return

Func ac
	if m.i
		Show Get m.count Disable
	else
		Show Get m.count Enable
	endif
Return .t.
