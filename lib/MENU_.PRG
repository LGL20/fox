Parameter sl
Private UserMenu
UserMenu=Used('user')
Return ppbase()

Proc before
	ro=8
	co=15
	HaveChild=.t.
	Use UserMenu Order menu_ in 6
	Set Relation to id+m.user into UserMenu
Return

Proc after
	Use in 6
Return

Proc stay
	Select 0
	Use UserMenu Again
	Delete For !enabled
	Use
	Select (m.base)
Return

Proc dfpp
	Define Popup (m.pfp) from m.ro, m.co;
		Margin Mark ' ' Shadow Scroll in Screen Prompt Fields;
			Left(name,0);
			+iif(m.UserMenu, iif(UserMenu.enabled, '√', ' '), '');
			+Tran(bar, '@z 99')+'. '+name+iftree();
		Title iif(m.parent=' ', ' Меню ', ' '+Trim(name)+' ');
		Footer iif(m.UserMenu, ' '+Trim(m.user_name)+' ', '');
		Message msg();
		Color ,n/w,n/w,w+/n,gr+/bg,w+/b
Return

Proc defs
	menu__name=menu_.name
Return

Proc set_rela
	if m.UserMenu
		Set Relation to id+m.user into UserMenu
	endif
Return

Proc edi
Private u, menu__name, menu_, ok
	ok=0
	if m.UserMenu
		enabled=UserMenu.enabled
	endif
	Set Filter to
	Set Order to id
	Seek m.parent
	menu__name=name
	menu_=m.parent
	u=m.parent#' '
	Set Filter to id#m.parent
	Define Window (m.pfp) from 12,0 to 18,79 Footer aefoot();
		Title ' Меню ' Float Shadow
	Activate Window (m.pfp) NoShow
	@ 0,1 Say '№' Get m.bar Picture '@z 99'
	@ 0,$+2 Get m.u Function '*cn';
		Valid iif(m.u, menu_() or .t., emp_parent()) and say_()
	@ 0,$ Get m.ok Function '*n Pad' Valid (menu_() or .t.) and say_()
	@ 0,47 Say 'Pad' Get m.pad
	@ 1,1 Say 'Hаименование' Get m.name
	@ 2,9 Get m.select
	if m.UserMenu
		@ 3,1 Get m.enabled Function '*cn Разрешено'
	endif
	@ 4,33 Get m.ok Function '*t \!Закрыть' Size 1,11
	=say_() and _read(.f., iif(m.UserMenu, 6, 1))
	name=Ltrim(m.name)
	parent=m.menu_
	empty = m.bar=0 and ''=Trim(m.parent+m.name+m.select)
	if m.UserMenu
		Select UserMenu
		Locate For menu_=m.id and for_user=m.user
		if !Found()
			Calculate Max(id) to uid For id#' '
			=recapp(.t.)
			Replace menu_ with m.id, for_user with m.user, id with kd(m.uid)
		endif
		Replace enabled with m.enabled
	endif
Return

Func say_
	@ 0,17 Say m.menu__name Color b/w
	@ 2,1 Say iif(m.parent=' ', 'Key Alt+', 'Команда ')
Return .t.

Func emp_parent
	if menu02('Сделать структурой верхнего уровня?')
		Store ' ' to menu_, menu__name
	else
		u=.t.
		Show Get m.u
	endif
Return .t.
