Parameter sl
Private tables_name, v_tables
tables_name=Trim(RusProp(table_nm()))
v_tables=m.tables
Return ppbase()

Proc before
	flt='link=m.tables'
Return

Proc dfpp
	Define Popup (m.pfp) from 10,20 to 18,50 in Screen;
		Margin Message msg() Shadow Scroll Prompt Fields;
			Left(id,0)+PadR(table_nm(), 30)+'│ '+tables.alias;
		Title ' '+m.tables_name+' ' Footer ' связи ';
		Color ,n/bg*,n/bg*,n/bg,gr+/bg,n/bg
Return

Proc defs
	links_name='связь: '+table_nm()
Return

Proc set_rela
	Set Relation to link into tables
Return

Proc edi
Private u, tables_name
	u=0
	if m.add
		tables='  '
	endif
	Set Relation to m.tables into tables
	tables_name=iif(m.add, '', table_nm())
	Set Filter to
	Set Relation to
	Define Window (m.pfp) from 10,1 to 13,74 Footer aefoot() Float Shadow;
		Title ' Связь ' Color n/w,n/w*,n/w,w+/n,,w+/b,,,n/w
	Activate Window (m.pfp) NoShow
	@ 0,1 Get m.u Function '*n Таблица' Valid (tables() or .t.) and say_()
		*When m.tables#' ' or (tables() and !say_())
	@ 1,30 Get m.u Function '*t \!Закрыть' Size 1,11
	=say_() and _read()
	empty=''=Trim(m.tables)
	link=m.v_tables
Return

Func say_
	@ 0,11 Say PadR(m.tables_name, wCols()-11) Color b/w
Return .t.
