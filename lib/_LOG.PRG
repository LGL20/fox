Parameter sl
sl='edi'
Return ppbase()

Proc before
	flt='user=Trim(m.f_user) and tables=Trim(m.f_tables);
		and (do#"A" or m.f_add) and (do#" " or m.f_edi);
		and (do#"D" or m.f_del)'
Return

Proc after
	Use in 1
	Use in 3
Return

Proc dfpp
	Define Window ('f'+m.pfp) from 1,0 to 5,78 Title ' Фильтр ' Float;
		Color g/n,,g/n,g/n,g/n,n/g,,,g/n
	Define Popup (m.pfp) from 6,0 to 22, 78 in Screen Margin Shadow Scroll;
		Prompt Fields;
		date38C(date_)+' │ '+time38(time_)+' │ '+Left(user.name, 20);
		+' │ '+Left(table_nm(), 30)+iif(id=' ', ' ', '');
		Title ' Дата ──── Время ─── Пользователь ─────────────────── Таблица ────────────────────*';
		Footer ' события ' Message ' F7-Фильтр    Выбор-Enter   Выхoд-Esc';
		Color ,g/n,g/n,g/n,gr+/bg,n/g
Return

Proc defs
Return

Proc add
Return
Proc del
Return

Proc flt
	u=0
	@ 0, 1 Get m.u Function '*n Пользователь';
		Valid emp('user')
	@ 1, 1 Get m.u Function '*n Таблица';
		Valid emp('tables')
	@ 2, 1 Get m.f_add Function '*c Добавление'
	@ 2,$+2 Get m.f_edi Function '*c Изменение'
	@ 2,$+2 Get m.f_del Function '*c Удаление'
Return

Func vld
	f_tables=m.tables
	f_user=m.user
Return .t.

Proc say_
	@ 0,16 Say PadR(m.user_name, 28) Color gr+/n
	@ 1,11 Say PadR(m.tables_name, 33) Color gr+/n
	@ 0,54 Say 'Записей'
	@ 0,$+1 Say PadR(Ltrim(Str(RecC('_log'))), 10) Color gr+/n
	@ 1,54 Say 'Размеp'
	@ 1,$+1 Say PadR(Ltrim(Str(FileSize('_log.dbf'), 16, 3))+' кБ', 16) Color gr+/n
Return

Proc edi
Private tables_name, i, table, sele, add,;
	date_, time_, user, old_, do, tables, id, pfp, noEdit, title
	if id=' '
		Wait Window 'Просмотр списка: '+Trim(table_nm()) NoWait
	else
		Push Key Clear
		add=.f.
		Scatter Memvar
		tables_name=table_nm()
		Select 24
		Use tables Order id Again
		Seek m.tables
		if Found()
			table=AllTrim(alias)
			Use (m.table+'.log') Again
			sele=Select()
			Locate For id=m.id
			title=_title()
			if Found()
				old_=.f.
				if _go()
					rec=RecNo()
					Do before in (m.table)
					Select (m.sele)
					Set Filter to
					for i=1 to fCount()
						Private (Fields(m.i))
					endfor
					noEdit=.t.
					pfp=Sys(2015)
					Do While .t.
						Wait Window m.title;
							+iif(m.do="D", ' (удалено)', '');
							+iif(m.do="D", '', ' │ '+iif(old_, 'стар', 'нов');
							+'ая версия │ F2') NoWait
						Scatter Memvar
						Do edi in (m.table)
						Select (m.sele)
						if Last()=-1
							old_=!m.old_
							if !_go()
								Wait Window 'Версия не найдена' NoWait
							endif
						else
							Exit
						endif
					EndDo
				else
					Wait Window m.title+' (просмотр)' NoWait
				endif
			else
				Use (m.table) Again
				Locate For id=m.id
				if Found()
					Wait Window _title()+' (просмотр)' NoWait
				else
					=ok('Hе найден элемент')
				endif
			endif
		else
			=ok('Hеизвестная таблица')
		endif
		Use
		Set Delete on
		Pop Key
	endif
Return

Proc _go
	Locate For id=m.id and time_=m.time_ and user=m.user and old_=m.old_
Return Found()

Func _title
	Do before in (m.table)
	Select (m.sele)
	Set Filter to
	i=m.table+'_name'
	Store '' to (m.i)
	rec=RecNo()
	Do defs in (m.table)
	title=Trim(&i)
	Set Filter to 
Return m.title
