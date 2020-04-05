Parameter num, add, tables, old_num, condition, object
Private fnd, sele, recn, not_here, x, doub, i, table, obj, dbf, max
doub = Type('m.num')#"L"
fnd=.f.
max=0
if !(m.doub and (m.num=0 or (!m.add and m.num=m.old_num)))
	do defa with m.condition, ''
	sele = Select()
	recn = iif(Type('recno')="N", recno, RecNo())
	Select 0
	for i=1 to aLen(tables)
		table=tables[m.i]
		not_here = !Used(m.table) and !Used(m.table+'_')
		Use (m.table) Again
		if Empty(m.object)
			obj='num'
		else
			obj=&object
		endif
		dbf = Lower(Dbf())
		if m.doub and !m.fnd
			Locate For &obj= m.num and (m.add or m.not_here or RecNo()#m.recn) &condition 
			fnd=m.fnd or Found()
		endif
		Calculate Max(&obj) to x For (m.add or m.not_here or RecNo()#m.recn) &condition
		max=Max(m.max, m.x)
	endfor
	Use
	max=m.max+1
	Select (m.sele)
endif
Do Case
Case m.fnd
	num = iif(MessageBox('Номер '+Ltrim(Str(m.num))+' уже есть. Вернуться к номеру ';
	+Ltrim(Str(m.old_num))+' ?', 4+16, 'Проверка уникальности номера')=6, m.old_num, -1)
Case m.doub and (m.max=0 or (m.num > m.max and;
MessageBox('Номер по порядку должен быть '+Ltrim(Str(m.max))+'. Установить ?',;
4+32, 'Проверка уникальности номера')#6))
	num=0
Otherwise
	num=m.max
EndCase
