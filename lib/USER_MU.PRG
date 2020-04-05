Private hot, temp
if m.old_user#m.UserID
	old_user=m.UserID
	Release Menu main Extend
	Define Menu main Bar
	Use UserMenu Order menu_ in 6
	Select 5
	Use menu_ Again
	* Order parent
	temp=TempName()
	Index on parent+Str(bar) to (m.temp)
	Set Relation to id+m.UserID into UserMenu
	Set Filter to UserMenu.enabled
	MainPopup=chr(0)
	Scan For parent=' '
		pad=AllTrim(pad)
		name=AllTrim(name)
		Define Pad (m.pad) of main Prompt;
			iif('\<'$m.name, '', '\<')+m.name
			* &key	это н., чтобы не попадать в основное меню из edi_...,
			* а если заменить menu на _MSYSMENU, то при ошибках надо все время Set Sysm to defa 
		if Len(AllTrim(select))>1
			sele=_sele()
			if ''#m.sele
				On Selection Pad (m.pad) of main y=shmenu() and &sele
			endif
		else
			Define Popup (m.pad) Margin Shadow
			On Pad (m.pad) of main Activate Popup (m.pad)
			if m.MainPopup=chr(0)
				MainPopup=m.pad
			endif
		endif
		popup=id
		rec=RecNo()
		Seek m.popup
		bar=0
		hot=''
		Scan While parent=m.popup
			name=AllTrim(name)
			bar=m.bar+1
			Define Bar (m.bar) of (m.pad) Prompt;
				iif('-'=m.name, '\-',;
				iif('\<'$m.name or At(Left(m.name, 1), m.hot)>0, '', '\<')+m.name)
			sele=_sele()
			if ''#m.sele
				On Selection Bar (m.bar) of (m.pad) y=shmenu() and &sele
			endif
			hot=m.hot+Left(m.name, 1)
		EndScan
		Go m.rec
	EndScan
	Use
	Use in 6
	Erase (m.temp)
	Define Bar CntBar(m.MainPopup)+1 of (m.MainPopup) Prompt '\-'
	Define Bar CntBar(m.MainPopup)+1 of (m.MainPopup) Prompt 'Вы\<ход'
	On Selection Bar CntBar(m.MainPopup) of (m.MainPopup) Do exit

	Define Bar CntBar('serv')+1 of serv Prompt 'Пользователь \<'+m.user_name
	On Selection Bar CntBar('serv') of serv y=shmenu() and ascpass() and dc()

	Do pad_year
	popup=m.MainPopup
	bar=1
endif

Proc _sele
	sele=AllTrim(select)
	if ''#m.sele
		Do Case
		Case m.sele='\'
			sele="ppbase('"+Stuff(m.sele, 1, 1, '')+"')"
		Case !'('$m.sele
			sele=m.sele+'()'
		EndCase
	endif
Return m.sele
