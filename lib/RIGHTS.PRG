Parameter sl
Return ppbase()

Proc dfpp
	Define Popup (m.pfp) from 10,20;
		Margin Mark ' ' Title ' Права ';
		Message msg() Shadow Scroll in Screen Prompt Field fromwin(name);
		Color ,n/w,n/w,b/w,gr+/bg,w+/b
Return

Proc defs
	right_name=fromwin(name)
Return

Proc edi
	Push Key Clear
	name=fromwin(m.name)
	Define Window (m.pfp) from 10,17 to 12,30 Shadow Float;
		Title ' Право ' Footer aefoot()
	Activate Window (m.pfp)
	@ 0,1 Get m.name
	Read
	Release Window (m.pfp)
	name=towin(Ltrim(m.name))
	empty=''=m.name
	Pop Key
Return
