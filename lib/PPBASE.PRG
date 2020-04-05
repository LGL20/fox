Parameter base
Private select, ar, was, i, n, deac, parent, pfp,;
	setfilt, ppb, add, _key, time_,	HaveChild, tableID, fnd, rec, _x
tableID=.f.
if Type('m.base')="C"
	Private sl
else
	base=''
	i=0
	Priv here
	here=Sys(16)
	do while sys(16, m.i)#m.here
		base = sys(16, m.i)
		i=m.i+1
	enddo
	i=Rat('\', m.base)
	if m.i>0
		base = Stuff(m.base, 1, m.i, '')
		i=Rat('.', m.base)
		if m.i>0
			base = Left(m.base, m.i-1)
		endif
	endif
endif
if CanSee()
	Store .f. to deac, HaveChild, _key, ('done'+m.base)
	Private ('deac'+m.base)
	Store 0 to ('deac'+m.base), rec
	if Type('m.sl')#"C" or Empty(m.sl)
		sl='_deac'
		if Type('m.sl_'+m.base)="C"
			sl='m.sl_'+m.base
			sl=&sl
		endif
	endif
	sl=m.sl+iif(At('(',m.sl)=0,'()','')
	select=Select()
	was=Used(m.base)
	Declare ar[1]
	parent=' '
	pfp=''
	Do us_back
	setfilt=Filter()
	n='m.'+m.base
	if Type(m.n)="U"
		Select 0
		i=m.PathUser+'mem.dbf'
		if File(m.i)
			Use (m.i) Again
			Locate For tables=m.tableID
			i=Found()
		else
			Create Table (m.i) (tables C(2), mem C(2))
			i=.f.
		endif
		if !m.i
			Append Blank
			Replace tables with m.tableID
		endif
		Store Trim(mem) to (m.n), n
		Use
		Select (m.base)
	else
		n=&n
	endif
	i=.t.
	Do poisk
	Do Case
	Case !m.i
		if ''#Sys(14,2)
			Set Order to 2
		endif
		Set Filter to &setfilt
		Go Top
	Case tree() and ''#Trim(m.n)
		Set Filter to &_key#' '
		n=0
		if parent#' '
			Do While Found()
				n=n+1
				Declare ppb[m.n]
				ppb[m.n]=&_key
				Seek parent
			EndDo
		endif
		Set Filter to &setfilt
		deac=m.n>0 and go_nowa(m.n,m.ro,m.co)
	EndCase
	if !m.deac and Dbf()=Upper(m.PathUser) and wExist('f'+m.pfp)
		deac=!_flt()
		Do us_back
	endif
	*if !m.deac ;
	*and !(RecNo()>RecCount() and !wExist('f'+m.pfp) and CanSee("E") and !add())
	if !m.deac
	*and !(RecNo()>RecCount() and !wExist('f'+m.pfp) and CanSee("E") and !add())
		if Dbf()=Upper(m.PathUser)
			Do poisk
		endif
		if ''#Sys(14,2)
			Set Order to 2
		endif
		Activate Popup (m.pfp) Rest
	endif
	On Key Label F2
	On Key Label F7
	Release Window (m.pfp), ('f'+m.pfp)
	Release Popup (m.pfp)
	Select (m.base)
	if Type(m._key)#"U"
		fnd=&_key
		Select 0
		Use (m.PathUser+'mem.dbf') Again
		Locate For tables=m.tableID
		if Type('mem')=Type('m.fnd')
			Replace mem with m.fnd
		endif
		Use
	endif
	Do uss
	Do out255
	Private _i, a, n
	Declare a[1]
	n=0
	Do GetLinks with a, n
	for _i=1 to m.n
		if a[m._i, 2]#0
			Use in (a[m._i, 2])
		endif
		if Used('t_'+a[m._i, 1])
			Select ('t_'+a[m._i, 1])
			Use
		endif
	endfor
	Select (m.base)
	_i=On('Error')
	On Error n=.t.
	Do after in (m.base)
	On Error &_i
	if !m.was
		Select (m.base)
		Use
	endif
	Select (m.select)
	i='m.done'+m.base
	Return &i
else
	Return .f.
endif

Proc add
Private flt, i, a, x, _x, rec, f_parent, rec, empty
	if key_now() and CanSee("E")
		On Key label F2
		On Key label F7
		f_parent=m.parent
		flt=Upper(Filter())
		for i=1 to Fcount()
			x=Upper(Fields(m.i))
			if At('M.'+m.x, m.flt)=0 or Type('m.'+m.x)="U"
				Private (m.x)
				Scatter Blank Memvar Fields (m.x)
			else
				x='m.'+m.x
				a=&x
				Private (m.x)
				Store m.a to (m.x)
			endif
		endfor
		empty=.f.
		add=.t.
		filter=Filter()
		if m.HaveChild
			=appnew(m._key)
			&_key=&_key
			rec=RecNo()
		endif
		Do edi in (m.base)
		Do uss
		if !m.empty	and iif(m.HaveChild, GoRec(m.rec),;
		iif(Type(m._key)="U", recapp(), appnew(m._key))))
			if m.HaveChild
				Gather Memvar
			endif
			Scatter to _x
			Store '' to date_, time_
			=CanSee("A")
			Select 0
			Use (m.base+'.log')
			Do to_log with _x
			Use
		endif
		Do us_back
		parent=m.f_parent
	endif
Return .f.

Proc edi_
Parameter any
Private rec, date_, _x, _y, f_parent, id
	if (m.any or key_now()) and real_rec()
		if iif(Type(m._key)="U", Eof(), &_key=iif(Type(m._key)="N", 0, ' '))
			=CanSee("E") and add()
		else
			On Key label F2
			On Key label F7
			f_parent=m.parent
			*id=id
			Do to_real
			rec=RecNo()
			for i=1 to Fcount()
				Private (Fields(m.i))
			endfor
			Scatter Memvar
			add=.f.
			filter=Filter()
			if CanSee("E")
				Scatter to _x
			endif
			Do edi in (m.base)
			Do after_edi
			parent=m.f_parent
		endif
	endif
Return .t.

Proc del
Parameter any
Private fnd, name, _x, id, (m.base+'_name'), year, _i, a, i, deleted
	deleted=.f.
	if (m.any or key_now()) and real_rec() and CanSee("E")
		id=&_key
		if Type('m.id')#"U" and iif(Type('m.id')="C", ''=Trim(m.id), m.id=0)
			fnd=0
		else
			name=_name()
			if ifTree(.t.)
				fnd=iif(Type('m.childname')="C", RLower(m.childname),;
					'подразделения')
			else
				fnd=''
				rec=RecNo()
				_i=On('Error')
				On Error a=.t.
				Do stay in (m.base)
				On Error &_i
				if Empty(m.fnd)
					=wai('Поиск ссылок')
					Store 0 to fnd, i
					Select 25
					Use links Order link Again
					Seek m.tableID
					Scan While link=m.tableID
						i=m.i+1
						Declare a[m.i,2]
						a[m.i, 1]=tables
					EndScan
					Use tables Order id Again
					for i=1 to m.i
						Seek a[m.i, 1]
						a[m.i, 1]=Trim(iif(name=' ',	alias, fromwin(name)))
						a[m.i, 2]=Trim(alias)+'.dbf'
					endfor
					Declare _x[1]
					for i=1 to m.i-1
						year=m.FirstYear
						Do While ''#SYS(2000, m.m_path+Str(m.year,4)+'\*.*')
							_i=m.m_path+Str(m.year, 4)+'\'+a[m.i, 2]
							if ''#SYS(2000, m._i)
								Use (m._i) Again
								Locate for &base=m.id
								=Found() and add_item(' ('+Str(m.year, 4)+')')
							endif
							year=m.year+1
						EndDo
						_i=m.m_path+a[m.i, 2]
						if ''#SYS(2000, m._i)
							Use (m._i) Again
							Locate for &base=m.id
							=Found() and add_item('')
						endif
					endfor
					Use
				endif
			endif
		endif
		Do Case
		Case Type('m.fnd')="C"
			=ok(m.name+'▌Удалить нельзя: есть '+m.fnd)
		Case m.fnd>0
			=aSort(_x)
			Define Window is from 8,12 to 19,68 in Screen Float;
				Shadow Title ' '+Trim(m.name)+' ';
				Color w+/r,,gr+/r,w+/n,w+/n,w+/n,gr+/r,,gr+/r
			Activate Window is NoShow
			@ 0,1 Say iif(CanSee("E"), 'удалить нельзя, ', '')+'есть:'
			i=1
			@ 1,1 Get m.i from _x Size 8,55
			@ 9,16 Get m.i Function '*nh Закрыть;Печать' Valid pri_del() Size 1,0,3
			Wait Clear
			Activate Window is
			Read Cycle
			Release Window is
		Case menu02(m.name, 'Удалить')
			Do to_real
			Delete
			deleted=.t.
			_i='m.f_'+m.base
			if Type(m._i)="C" and m.id=&_i
				Store '' to (m._i)
			endif
			Scatter to _x
			Store '' to date_, time_
			=CanSee("D")
			Select 0
			Use (m.base+'.log')
			Do to_log with _x
			Use
		EndCase
		Do us_back
	endif
Return m.deleted

Proc add_item
Parameter tx
	fnd=m.fnd+1
	Declare _x[m.fnd, 2]
	_x[m.fnd, 1]=a[m.i,1]+m.tx
Return .t.

Proc go_nowa
Parameters n, ro, co
Private parent, pfp, rec
	Do tryroco
	Set Filter to
	Set Order to 1
	Seek ppb[m.n]
	parent=parent
	rec=RecNo()
	pfp=df_pp()
	=GoRec(m.rec)
	Set Filter to parent=m.parent
	if ''#Sys(14,2)
		Set Order to 2
	endif
	if m.n>1
		Activate Popup (m.pfp) nowait rest
		= go_nowa(m.n-1,m.ro+2,m.co+4)
		if m.n<=Alen(ppb)
			Set Order to 1
			Seek ppb(m.n)
			if ''#Sys(14,2)
				Set Order to 2
			endif
		endif
	endif
	if !m.deac
		Activate Popup (m.pfp) rest
	endif
	Deactivate Popup (m.pfp)
	Release Popup (m.pfp)
	Release Window ('f'+m.pfp)
Return .t.

Proc df_pp
	pfp=Sys(2015)
	Do dfpp in (m.base)
	=wExist('f'+m.pfp) and _flt(.t.)
	Do on_sele_pp
Return m.pfp

Proc beforesl
	if Type(m._key)#"U"
		Store &_key to (m.base)
	endif
	filter=Filter()
	rec=RecNo()
Return .t.

Proc go_in
Parameters ro, co
Private parent, pfp
	Do tryroco
	parent=&_key
	pfp=df_pp()
	Go Top
	if parent=m.parent or add()
		Activate Popup (m.pfp) rest
	endif
	Release Popup (m.pfp)
	Release Window (m.pfp), ('f'+m.pfp)
Return .t.

Proc tryroco
	if m.ro>20
		ro=0
	endif
	if m.co>70
		co=0
	endif
Return

Proc us_back
Private _i, a, n, flt, table, j, empty
	Do uss
	_key=_KeyExp()
	Declare a[1]
	n=0
	Do GetLinks with a, n
	Do _filters
	empty=.f.
	for j=1 to 2
		for i=1 to m.n
			*Seek a[m.i,3]+m.tableID
			Seek m.tableID
			Locate While tables=m.tableID For links=a[m.i,3]
			time_='f_'+a[m.i,1]
			if Type(m.time_)="U"
				Public (m.time_)
			endif
			_i='h_'+a[m.i,1]
			Do Case
			Case Type(m._i)="U"
				Store iif(m.empty, '', Trim(filter)) to (m.time_)
			Case !m.empty
				Store &_i to (m.time_)
				empty=.t.
				Exit
			EndCase
		endfor
		if !m.empty
			Exit
		endif
	endfor
	Use
	for i=1 to m.n
		Use (a[m.i, 1]) Order id in (a[m.i, 2])
	endfor
	Select (m.base)
	Do _relation
	flt=''
	_i=On('Error')
	On Error flt=''
	Do before in (m.base)
	On Error &_i
	=''#m.pfp and wExist('f'+m.pfp) and _flt(.t.)
	Select (m.base)
	for _i=1 to m.n
		table=a[m._i, 1]
		if Type(m.table)="C"
			flt=m.flt+' and ';
				+iif(Used('t_'+m.table), '('+m.table+" #' ' and "+m.table+'=t_'+m.table+'.id)',;
					m.table+'=m.f_'+m.table)
		endif
	endfor
	if m.flt=' and '
		flt=Stuff(m.flt, 1, 5, '')
	endif
	if tree()
		flt='parent=m.parent'+iif(''=m.flt,'',' and ('+m.flt+')')
	endif
	Select (m.base)
	Set Filter to &flt
	if ''#m.flt
		if &flt
		else
			Go Top
		endif
	endif
	if ''=m.pfp
		if m.n>0 and Type('m.'+m.base)="U"
			sl=iif(m.sl='_deac', '_ActiMnu()', m.sl)
			Do f2
		endif
		pfp=df_pp()
	endif
	Do _relation
	Do f7
	if ''#Sys(14,2)
		Set Order to 2
	endif
	_i=On('Error')
	On Error flt=''
	Do set_rela in (m.base)
	On Error &_i
Return .t.

Proc _deac
	Store .t. to ('deac'+m.base)
Return .t.

Proc uss
	i=area()
	Select (m.i)
	Use (m.base) Again
	if Files(m.base+'.idx')
		Set Index to (m.base)
	endif
	if Files(m.base+'.ord')
		Set Index to (m.base+'.ord') Additive
	endif
Return

Proc to_log
Parameter a
	if recapp(.t.)
		Gather from a
		Gather Memvar Fields &_key, date_, time_
		Replace user_ with m.user
	endif
Return

Proc after_edi
Private changed, date_, time_
	Store '' to date_, time_
	Do CanSee
	Do uss
	=GoRec(m.rec)
	if CanSee("E")
		Gather Memvar
		Scatter to _y
		changed=.f.
		for i=1 to Fcount()
			if _x[m.i]#_y[m.i]
				changed=.t.
			endif
		endfor
		if m.changed
			Select 0
			Use (m.base+'.log')
			Do to_log with _x
			Replace old_ with .t.
			Do to_log with _y
			Use
			Select (m.base)
		endif
	endif
	Do us_back
	=GoRec(m.rec)
	i='m.'+m._key
	if Type(m._key)#"U" and &_key=&i
		Do defs in (m.base)
		Do us_back
	endif
Return

Proc to_real
Private dbf, rec
	dbf=Dbf()
	rec=RecNo()
	id=&_key
	Do uss
	if m.dbf=Dbf()
		=GoRec(m.rec)
	else
		i=Sys(14,1)
		if ''=m.i or Type(m._key)#Type('m.id')
			Locate For &_key=m.id
		else
			Set Order to 1
			Seek m.id
		endif
	endif
Return

Func _filters
Private i
	i=m.PathUser+'_filters.dbf'
	if !File(m.i)
		Create Table (m.i) (tables C(2), links C(2), filter C(2))
		*Index on links+tables Tag id	&& из=за C++
		Index on tables Tag tables
		Use
	endif
	Select 25
	Use (m.i) Order tables
Return

Func _tables
Private i
	i=m.PathUser+'_tables.dbf'
	if !File(m.i)
		Create Table (m.i) (tables C(2), bar C(1))
		Index on tables Tag id
		Use
	endif
	Select 25
	Use (m.i) Order id
	Seek m.tableID
Return Found()

Func f7
	if Type('m.pfp')="C" and wExist('f'+m.pfp)
		On Key Label F7 y=key_now() and (_flt() or .t.) and us_back()
	endif
Return .t.

Proc pri_del
	if m.i=1
		Clear Read
	else
		Do _prin
		? m.name+' :'
		?
		for i=1 to m.fnd
			? _x[m.i,1]
		endfor
		?
		Do ModiFile
	endif
Return 0

Func area
	if Used(m.base)
		Select (m.base)
		i=Select()
	else
		Select 25
		Use tables Again Order alias
		Seek Lower(m.base)
		i=Max(area, 1)
		tableID = id		&&mb
		Use
	endif
Return m.i

Func msg
Private j
	j=iif(''=On('Key', 'F2'), '', ' F2-Меню ');
		+iif(CanSee("E"), ' F4-Дoбавить  F6-Изменить  F7-Поиск  F8-Удалить ',;
		' F6-Просмотр  F7-Поиск ')+' Выбор-Enter  Выхoд-Esc'
	if !wExist('f'+m.pfp)
		j=Strt(m.j, 'F7-Поиск  ')
	endif
	if tree()
		j=Strt(m.j, 'Enter', 'Enter, пробел')
	endif
Return m.j

Proc poisk
Private i
	if iif(Type('m.n')="C", ''=m.n or m.n=' ', m.n=0)
		Go Top
	else
		setfilt=Filter()
		Set Filter to
		if ''=Sys(14,1)
			Locate For &_key=m.n
		else
			Set Order to 1
			Seek (m.n)
		endif
		i=Found()
		Set Filter to &setfilt
	endif
Return

Func tree
Return Type(m.base+'.parent')#"U"

Func _bar
	if !_tables()
		Append Blank
		Replace tables with m.tableID
	endif
	Replace bar with chr(Bar())
Return .t.

Proc on_sele_pp
	On Selection Popup (m.pfp);
		i=iif(LastKey()=13 and ifTree(.t.), go_in(m.ro+2, m.co+4),;
			realsl() and beforesl() and dfs() and (&sl or .t.));
			and us_back() and aftersl()
Return .t.

Proc f2
	On Key Label F2 y=key_now() and _ActiMnu()
Return .t.

Func _name
Private _name
	_name=m.base+'_name'
	Private (m._name)
	Store '' to (m._name)
	Do defs in (m.base)
Return &_name

Func key_now
Private i, p, f
	i=1
	Do While ''#SYS(16, m.i)
		i=m.i+1
	EndDo
	f=Sys(16, m.i-4)
	if m.f="PROCEDURE" and m.f#"PROCEDURE GO"
		Return .f.
	endif
	p=Rat('\', m.f)
	f=iif(m.p=0, m.f, Stuff(m.f,1,m.p,''))
	if m.f#"PPBASE"
		f=Sys(16, m.i-3)
		p=Rat('\', m.f)
		f=iif(m.p=0, m.f, Stuff(m.f,1,m.p,''))
	endif
Return m.f="PPBASE"

Proc _ActiMnu
Private _rec, ('h_'+m.base)
	On Key Label F2
	On Key Label F7
	Store &_key to ('h_'+m.base)
	_rec=RecNo()
	Define Popup ('D'+m.pfp) Margin Shadow Scroll;
		Title ' '+Trim(_name())+' ';
		Color ,n/w*,n/w*,gr+/r,n/w*,w+/n,r/w*
	if df_menu()
		Do _tables
		i=Max(1, asc(bar))
		Use
		Activate Popup ('D'+m.pfp) Bar m.i
	endif
	Release Popup ('D'+m.pfp)
	Do us_back
	=GoRec(m._rec)
	Do f2
	Do f7
Return .t.

Proc df_menu
Private _max, i, a
	Store 0 to i, _max
	Select 25
	Use links Order link
	Seek m.tableID
	Scan While link=m.tableID
		i=m.i+1
		Declare a[m.i,2]
		a[m.i,1]=tables
	EndScan
	Use tables Order id Again
	for i=1 to m.i
		Seek a[m.i,1]
		a[m.i,1]=Trim(iif(name=' ', alias, fromwin(name)))
		a[m.i,2]=Trim(alias)
		_max=Max(m._max, Len(a[m.i, 1]))
	endfor
	Use
	i=m.i-1
	if m.i>0
		=aSort(a)
		Move Popup ('D'+m.pfp);
			to Max(0, Int((21-m.i)/2)), Max(0, Int(40-m._max/2))
		Define Bar 1 of ('D'+m.pfp) Prompt '\<Изменить'
		Define Bar 2 of ('D'+m.pfp) Prompt '\<Удалить'
		Define Bar 3 of ('D'+m.pfp) Prompt '\-'
		On Selection Bar 1 of ('D'+m.pfp);
			y=_bar() and us_back() and GoRec(m._rec) and edi_(.t.) and dc_f2()
		On Selection Bar 2 of ('D'+m.pfp);
			y=us_back() and GoRec(m._rec) and del(.t.) and dc_f2()
		for i=1 to m.i
			Define Bar m.i+3 of ('D'+m.pfp);
				Prompt '\<'+RusProp(a[m.i, 1])
			_max=a[m.i, 2]+'()'
			On Selection Bar m.i+3 of ('D'+m.pfp) y=_bar() and &_max
		endfor
		Define Bar m.i+3 of ('D'+m.pfp) Prompt '\-'
		Define Bar m.i+4 of ('D'+m.pfp) Prompt '\<Выход'
		On Selection Bar m.i+4 of ('D'+m.pfp);
			Deactivate Popup ('D'+m.pfp)
	endif
Return m.i>0

Func dc_f2
	Deactivate Popup ('D'+m.pfp)
Return .t.

Func real_rec
Private _i
	if RecNo()>RecC()
		Return .f.
	endif
	if Type(m._key)#"U"
		_i=&_key
		if iif(Type('m._i')="C", '', 0)=m._i
			Return .f.
		endif
	endif
	_i=Filter()
	if ''#m._i
		if !&_i
			Return .f.
		endif
	endif
Return .t.

Proc pad_edi
	Set Sysmenu to _MSM_EDIT
	Define Pad _MSM_EDIT of _MSYSMENU Prompt '\<Правка' Key Alt+G
	Define Popup _MEDIT Margin Shadow
	Define Bar _MED_UNDO	of _MEDIT Prompt 'Отменить'		Key CTRL+U, '^U'
	Define Bar _MED_REDO	of _MEDIT Prompt 'Вернуть'		Key CTRL+R, '^R'
	Define Bar _MED_SP100	of _MEDIT Prompt '\-'
	Define Bar _MED_COPY	of _MEDIT Prompt 'Копировать'	Key CTRL+C, '^C'
	Define Bar _MED_PASTE	of _MEDIT Prompt 'Вставить'		Key CTRL+V, '^V'
	Define Bar _MED_CUT		of _MEDIT Prompt 'Вырезать'		Key CTRL+X, '^X'
	Define Bar _MED_SP200	of _MEDIT Prompt '\-'
	Define Bar _MED_SLCTA	of _MEDIT Prompt 'Выделить все'	Key CTRL+A, '^A'
	Define Bar 1 of _MEDIT Prompt '\-'
	Define Bar 2 of _MEDIT Prompt 'Аварийный выход'
	On Selection Bar 2 of _MEDIT Set Sysmenu to Default
	Set Sysmenu on
Return

Proc _flt
Parameter show
Private flt_when, CurObj, sele, i, a, j
Private _i, a, n
	On Key Label F7
	On Key Label F2
	sele=Select()
	Declare a[1]
	n=0
	Do GetLinks with a, n
	for n=1 to m.n
		_j=a[m.n, 1]
		if Type(m._j)="C"
			_i='f_'+m._j
			_i=&_i
			Private (m._j+'_name'), (m._j)
			Store '' to (m._j+'_name')
			Store m._i to (m._j)
			_i=PadR(_i, Len(&_j))
			Set Relation to _i into (m._j)
			Do defs in (m._j)
		endif
	endfor
	Set Relation to
	flt_when=.f.
	CurObj=1
	Do pad_edi
	Activate Window ('f'+m.pfp) Same
	Do flt in (m.base)
	Do say_ in (m.base)
	if m.show
		if m.flt_when
			Read When m.flt_when and flt_when() Time .0000000001
		else
			Clear Gets
		endif
	else
		Read When !m.flt_when or flt_when() Object m.CurObj
	endif
	Set Sysmenu off
	Do f7
	Do f2
Return Last()#27

Proc DopKeys
	On Key Label Ins Do add
	On Key Label Del Do del
Return

Proc GetLinks
Parameter a, n
Private i
	Use tables Order alias in 25 Again Alias tt
	Select (m.base)
	n=0
	for i=1 to FCount()
		if !inList(Field(m.i), "ID", "NAME", "PARENT") and File(Field(m.i)+'.dbf')
			Set Relation off into tt
			Set Relation to Lower(Field(m.i)) into tt Additive
			if tt.id#' '
				n=m.n+1
				Declare a[m.n, 3]
				a[m.n, 1]=Field(m.i)
				a[m.n, 2]=tt.area
				a[m.n, 3]=tt.id
			endif
		endif
	endfor
	Use in 25
Return

Proc _relation
Private _j, _table, q
	for _i=1 to m.n
		_table=a[m._i, 1]
		*q=1
		*Do While ''#Target(m.q) and Target(m.q)#Upper(m._table)
		*	q=m.q+1
		*EndDo
		*if ''=Target(m.q) and Used(m._table)
		if Used(m._table) and Type(m._table)="C"
			_j='f_'+m._table
			_j=&_j
			Set Relation off into (m._table)
			if ''=m._j or Type(m._table+'.parent')="U"
				Set Relation to &_table into (m._table) Additive
				if Used('t_'+m._table)
					Select ('t_'+m._table)
					_j=Dbf()
					Use
					Erase (m._j)
					Select (m.base)
				endif
			else
				=GetTree(m._table, m._j)
				rr=Left('t_'+m._table, 8)
				_j=rr+'.id'
				Set Relation off into (rr)
				Set Relation to &_table into (rr),;
					&_j into (m._table) Additive
			endif
		endif
	endfor
Return

Func ifTree
Parameter bool
Private parent, rec, id
	if Type(m.base+'.parent')="U"
		parent=.f.
	else
		rec=RecNo()
		id=id
		parent=''
		Set Order to parent
		Seek m.id
		parent=Found()
		if Type('name')#"U"
			Set Order to name
		endif
		=GoRec(m.rec)
	endif
Return iif(m.bool, m.parent, iif(m.parent, ' ', '  '))

Func aftersl
	Store .t. to ('done'+m.base)
	if Type('deac'+m.base)="L"
		deac=.t.
		Deactivate Popup (m.pfp)
	endif
Return .t.

Func vld
Private _i, link, table
	table=Strt(m._table, '()')
	Select 25
	Use tables Order alias Again
	Seek Lower(m.table)
	link=id
	Do _filters
	Seek m.tableID
	Locate While tables=m.tableID For links=m.link
	*Seek m.link+m.tableID
	if !Found()
		Append Blank
		Replace tables with m.tableID, links with m.link
	endif
	_i='m.'+m.table
	_i=&_i
	Replace filter with m._i
	Use
	_i=On('Error')
	On Error table=.t.
	Do vld in (m.base)
	On Error &_i
Return .t.

Func dfs
	Do defs in (m.base)
Return .t.
