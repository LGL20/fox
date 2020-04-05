Parameter num, add, list, condition, object
Private fnd, sele, x, doub, i, table, obj, max, cond, old_num
doub = Type('m.num')#"L"
fnd=.f.
max=0
if Empty(m.object)
	old_num=num
else
	table=Lower(Alias())
	obj=&object
	old_num=&obj
endif
if !m.doub or (m.num#0 and (m.add or m.num # m.old_num))
	if Empty(m.condition)
		Store '' to condition, cond
	else
		cond = 'For '+m.condition
		condition = ' and ('+m.condition+')'
	endif
	Declare tables[1]
	Do razbiv with m.list, tables
	sele = Select()
	Select 0
	for i=1 to aLen(tables)
		table=tables[m.i]
		Use (m.table) Again
		if Empty(m.object)
			obj='num'
		else
			obj=&object
		endif
		if m.doub and !m.fnd
			Locate For &obj= m.num &condition
			fnd=m.fnd or Found()
		endif
		Calculate Max(&obj) to x &cond
		max=Max(m.max, m.x)
	endfor
	Use
	Select (m.sele)
	max = m.max + iif(!m.doub or m.add or m.max#m.old_num, 1, 0)
endif
i=Ltrim(Str(m.max))
obj = 'Hoмер по порядку должен быть '+m.i+'. Установить ?'
Do Case
Case m.fnd
	i = 'Hoмер '+Ltrim(Str(m.num))+' уже есть. ';
		+iif(m.add, 'Установить номер '+m.i,;
		'Вернуться к номеру '+Ltrim(Str(m.old_num)))+' ?'
	num = iif(iif(m.win, MessageBox(win(m.i), 4+16, '╧ЁютхЁър єэшъры№эюёЄш эюьхЁр')=6,;
		menu01(m.i)),;
		iif(m.add, m.max, m.old_num), -1)
Case !m.doub or (m.num > m.max and m.max>0;
and iif(m.win, MessageBox(win(m.obj), 4+32, '╧ЁютхЁър єэшъры№эюёЄш эюьхЁр')=6,;
menu01(m.obj)))
	num=m.max
EndCase
Return m.num