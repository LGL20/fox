Parameter quest, list, PromTx, task
Private var, m, i, p, path, year, table, sele, was, set_bord
i=Alias()+'_name'
Private (m.i)
Store '' to (m.i)
Do defs
PromTx=Trim(&i)
set_bord=set('Bord')
Set Border to Single
sele=Select()
if Type('m.fnd')="U" or Empty(m.fnd)
	Define Popup is Margin Mark ' ' Scroll Color ,n/w
	fnd=0
endif
if Type('m.task')#"C"
	task=''
endif
=m.task='hide' or wai('Поиск ссылок')
if m.quest # iif(Type('m.quest')="C", Space(Len(m.quest)), 0)
	var=Dbf()
	if m.var=Upper(m.PathUser)
		var=Alias()
	else
		var=Stuff(m.var, 1, rAt('\', m.var), '')
		var=Left(m.var, Len(m.var)-4)
	endif
	Declare a[1]
	Do razbiv with m.list, a
	path=m.m_path
	m=aLen(a)
	if m.m=0
		Return
	endif
	Declare a[m.m]
	for i=1 to m
		a[i]=Lower(a[i])
	endfor
	was=Used('TABLES')
	if m.was
		Select tables
		Set Order to alias
		Set Filter to
	else
		Select 0
		Use tables Order alias
	endif
	Select 0
	if Type('m.FirstYear')#"N" or Empty(m.FirstYear)
		FirstYear=1995
	endif
	*i=.f.
	*Do Case
	*Case Type('m.FirstYear')="U" or Empty(m.FirstYear)
	*	FirstYear=1995
	*	i=.t.
	*Case !(Type('m.FirstYear')="L" and m.FirstYear)
	*	i=iif(Type('m.CurYear')="N", m.CurYear, Val(Set('Path')))>=m.FirstYear
	*EndCase
	*if m.i
		year=m.FirstYear
		Do While ''#SYS(2000, m.path+Str(m.year,4)+'\*.*')
			for i=1 to m.m
				table=m.path+Str(m.year, 4)+'\'+a[i]+'.dbf'
				if ''#SYS(2000, m.table)
					Select 0
					Use (m.table) Again
					Locate for &var=m.quest
					if Found()
						*if a[i]='dog'
						*	r=num
						*	Use (m.path+Str(m.year, 4)+'\dog.dbf') Again
						*	Locate For code=m.r
						*	r='N '+AllTrim(num)
						*	r=m.r+', '
						*else
						*	r=''
						*endif
						*=add_item(' ('+m.r+Str(m.year, 4)+')')
						=add_item(' ('+Str(m.year, 4)+')')
					endif
					Use
				endif
			endfor
			year=m.year+1
		EndDo
	*endif
	for i=1 to m.m
		table=m.path+a[i]+'.dbf'
		if ''#SYS(2000, m.table)
			Use (m.table) Again
			Locate for &var=m.quest
			=Found() and add_item('')
			Use
		endif
	endfor
	Use
	if !m.was
		Select tables
		Use
	endif
endif
Select (m.sele)
Wait Clear
Do Case
Case m.task='hide'
Case m.fnd>0
	Wait Clear
	if m.win
		Do form del_list
	else
		Define Window is from 9,20 to 20,76 Shadow Color Scheme 7
		Activate Window is NoShow
		@ 0,1 Say Left(m.PromTx, 34)
		@ 1,1 Say iif(CanSee("E"), 'удалить нельзя, ', '')+'есть:'
		Store 1 to i, u
		@ 2,1 Get m.i Popup is Size 7,55
		@ 9,10 Get m.u Function '*nh Закрыть;Печать' Valid pri_del() Size 1,0,3
		Activate Window is
		Read
		Release Window is
	endif
	fnd='no'
Case !CanSee("E")
	Wait Window win('Hичего нет') NoWait
	fnd='no'
Case (''=m.task or m.task='del') ;
and iif(m.win, MessageBox('╙фрышЄ№ '+AllTrim(m.PromTx)+' ?', 4+32, '╙фрыхэшх фрээ√ї')=6,;
menu02(m.PromTx, 'Удалить'))
	Do to_real
	Delete
	Do us_back
EndCase
Release Popup is
if inList(m.set_bord, 'Doub', 'Panel')
	Set Border to &set_bord
endif
Return !Empty(m.fnd)

Proc pri_del
	if m.u=1
		Clear Read
	else
		Do _prin
		? m.PromTx+' :'
		?
		for i=1 to m.fnd
			? PRMBAR('is', i)
		endfor
		?
		Do ModiFile
	endif
Return 0

Proc add_item
Parameter tx
Private r
	Set Relation to a[i] into tables
	fnd=CntBar('is')+1
	r=Trim(tables.name)
	Define Bar m.fnd of is Prompt iif(''=m.r, a[i],	fromwin(m.r)) + m.tx
Return
