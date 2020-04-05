Parameter sl
Return ppbase()

Proc before
	Set Order to area
Return

Proc stay
	fnd=id
	Select 0
	Use links Again
	Locate For link=m.fnd
	fnd=iif(Found(), 'á¢ï§¨', '')
	Use
	Select tables
Return

Proc dfpp
	Define Popup (m.pfp) from 7,10 to 22,72	in Screen Margin;
		Title  'ÄÄÄÄÄÄÄÄÄÄÄÄÄH ¨¬¥­®¢ ­¨¥ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄ” ©«ÄÄÂ¡« áâì';
		Footer 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄâ ¡«¨æëÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄ';
		Shadow Scroll;
		Message msg() Prompt Fields;
			fromwin(name)+'³'+alias+' ³  '+Tran(area, '@z 999');
		Color ,n/w,n/w,b/w,gr+/bg,w+/b
Return

Proc defs
	tables_name = table_nm()
Return

Proc edi
	name=fromwin(m.name)
	Define Window (m.pfp) from 10,14 to 14,70 Shadow Float;
		Title ' ’ ¡«¨æ  ' Footer aefoot()
	Activate Window (m.pfp)
	@ 0,1 Say 'Alias' Get m.alias
	@ 1,1 Say 'Area ' Get m.area Picture '@z 999'
	@ 2,1 Say 'H ¨¬¥­®¢ ­¨¥' Get m.name
	Read
	Release Window (m.pfp)
	alias=Ltrim(m.alias)
	name=towin(m.name)
	empty=.f.
Return
