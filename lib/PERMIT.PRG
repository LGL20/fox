Parameter sl
Private tables, id
Select 2
Use permit Again
Calculate Max(id) to id For id#' '
Select 3
Use tables Again
Scan
	tables=id
	Select 2
	Locate For tables=m.tables and user=m.user
	if !Found()
		id=kd(m.id)
		Do recapp
		Replace user with m.user
	endif
EndScan
Use
Return ppbase()

Proc before
	Use tables Order id in 3
	Use rights Order id in 4
	flt='user=m.user'
	Set Relation to rights into rights, tables into tables
Return

Proc after
	Use in 3
	Use in 4
Return

Proc dfpp
	Define Popup (m.pfp) from 10,20;
		Margin Mark ' ' Title ' Таблица ─ Право ───';
		Message msg() Shadow Scroll in Screen Prompt Fields;
			Left(tables,0)+tables.alias+' │ '+rights.name;
		Footer ' '+Trim(user.name)+' ' Color ,n/w,n/w,b/w,gr+/bg,w+/b
Return

Proc defs
Return

Proc edi
Private u, tables_name, right_name
	Set Relation to m.tables into tables, m.rights into rights
	tables_name=tables.alias
	right_name=rights.name
	Set Relation to
	u=' Разрешения для '+Trim(user.name)+' '
	Define Window (m.pfp) from 10,15 to 14,20+Len(m.u) Shadow Float;
		Title m.u Footer aefoot() Color n/w,w+/b,n/w,w+/n,w/n
	u=0
	Activate Window (m.pfp) NoShow
	Do say_
	@ 0,1 Get m.u Function '*n Таблица' Valid (tables() or .t.) and say_();
		When m.tables#' ' or ((tables() or .t.) and !say_())
	@ 1,1 Get m.u Function '*n Права' Valid (rights() or .t.) and say_();
		When m.rights#' ' or ((rights() or .t.) and !say_())
	@ 2,8 Get m.u Function '*t \!Закрыть' Size 1,11
	Activate Window (m.pfp)
	=_read(.f.,2)
	Release Window (m.pfp)
	Select permit
	u=RecN()
	Locate For tables=m.tables and (m.add or RecNo()#m.rec)
	empty=Found()
	=GoRec(m.u) and m.empty and ok(Trim(m.tables_name)+' уже есть')
	*for_user=m.user
Return

Func say_
	@ 0,11 Say m.tables_name Color b/w
	@ 1,11 Say m.right_name Color b/w
Return .t.
