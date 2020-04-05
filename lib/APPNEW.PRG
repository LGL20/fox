Parameter code
Private base, i, k, n, space, append, len, new, flt, nar, order
base=Alias()
code=iif(!Empty(m.code), m.code, iif(Type('id')="C", 'id',;
	iif(Type('code')="C", 'code', iif(Type('kod')="C", 'kod', ''))))
i=Dbf()
i=Stuff(m.i, 1, At('\\', m.i)-1, '')
i=Left(m.i, Rat('\', m.i))+'bases'
if !File(m.i+'.dbf')
	Create Table (m.i) (name C(8))
	Index on name to (m.i) Compact
	Use
	Select (m.base)
endif
Use bases Index bases in 25
Set Relation to m.base into bases Additive
if Empty(bases.name)
	Select bases
	Append Blank
	Replace name with m.base
	Select (m.base)
endif
len=fSize(m.code)
append=.f.
Do While .t.
	Do Case
	Case Lock('bases')
		append=.t.
		flt=Filter()
		order = Order()
		if ''=m.code
			new='ok'
		else
			if m.len=6
				new = date83(Date())+time83()
			else
				Set Filter to
				Set Delete off
				space=iif(Type(m.code)="C", Space(m.len), 0)
				Calculate Max(&code) to new For &code#m.space
				if m.new>=iif(Type(m.code)="C",;
				Replicate(chr(254), m.len), Val(Repl('9', fsize(m.code))))
					*=wai('Ищу местo')
					*new=kd(m.space)
					*Go Top
					*Scan For &code#m.space While &code=m.new
					*	new=kd(m.new)
					*EndScan
					*Wait Clear
					*if RecNo()>RecC()
						=ok('Перепoлнение кoда!▌Дoбавлениие невoзмoжнo.▌Обратитесь к разработчику.')
						Do ex
						Use in 25
						Return .f.
					*endif
				else
					new=kd(m.new)
				endif
			endif
			if iif(Type(m.code)="C", '', 0)#m.new
				Store m.new to (m.code)
			endif
		endif
		if iif(Type(m.code)="C", '', 0)#m.new
			nar=1
			if Type('ar')#"U"
				nar=aLen(ar)+iif(Type('ar')="N", 1, 0)
				if Type('m.name')="C"
					name=Replicate(chr(255), m.nar)+m.name
				endif
			endif
			if File(m.base+'.idx')
				Set Index to (m.base+'.idx') Additive
			endif
			if File(m.base+'.ord')
				Set Index to (m.base+'.ord') Additive
			endif
			Do recapp
			Declare ar[m.nar]
			ar[m.nar]=RecNo()
			KeyBoard "{End}" Plain
		endif
		Do ex
		Exit
	Case menu02('Справoчник занят другим пoльзoвателем.▌Прервать дабавление записи?')
		Exit
	EndCase
	=wai('Ожидаю, пока другой пользователь освободит справочник')
EndDo
Select bases
Use
Select (m.base)
Wait Clear
Return m.append

Proc ex
	Set Order to (iif(Val(m.order)#0, m.order,;
		iif(File(m.base+'.ord'), 2, iif(File(m.base+'.cdx'), m.order, 0))))
	Set Filter to &flt
	Set Delete on
Return
