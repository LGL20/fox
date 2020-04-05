Parameters X, FILE, pri_PRG, COLOR
Private KEY, ff, priff, exit, c, k, m, i, j, t, noEject, noErase, small,;
	BigSlow, CopyNum, a
?
Store .f. to needkey, noeject, NoErase, small, BigSlow
CopyNum=1
if !Empty(m.file)
	Do keypar with m.file
endif
CopyNum=Max(1, m.CopyNum)
if !m.needkey
	PUSH KEY CLEAR
endif
_CLIPTEXT=''
file=iif(Empty(m.file), iif(Sys(6)='PRN:', 'temp.txt', Sys(6)),;
	m.file+iif(At('.', m.file)=0, '.txt', ''))
Store 0 to m, len
n_file=1
Declare a[1]
Do razbiv with m.file, a, n_file, m, len
n_file=aLen(a)
Declare priff[m.n_file]
Set Printer off
Set Printer to
ff=Alltrim(m.file)
if Left(Right(m.ff,4),1)#'.'
	ff=m.ff+'.txt'
endif
Do DEFA WITH m.X, _RMARGIN+5
x=Min(256, m.x)
Do DEFA WITH m.COLOR, 'n/w'
Do df_win
printed=.F.
Set Color of Schem 3 to ,gr+/w
if Type('m.MainProgram')="U" or m.MainProgram#"svod"
	Set Sysm to _MSM_EDIT
	Define Pad _MSM_EDIT of _MSYSMENU Prompt win('\<Правка') Key Alt+G
	Define Popup _MEDIT Margin Shadow Color bg/w,n/w
	Define Bar _MED_COPY	of _MEDIT Prompt win('Копировать') Key Ctrl+C, '^с'
	Define Bar _MED_PASTE	of _MEDIT Prompt win('Вставить') Key Ctrl+V, '^м'
	Define Bar _MED_SLCTA	of _MEDIT Prompt win('Выделить все') Key Ctrl+A, '^ф'
	Define Bar _MED_FIND	of _MEDIT Prompt win('H\<айти') Key Ctrl+F,'^а'
	Define Bar _MED_FINDA	of _MEDIT Prompt win('Hайти снова') Key Ctrl+G,'^п'
	Define Bar 1 of _MEDIT Prompt win('П\<ечать') Key Ctrl+N, '^т'
	Define Bar 2 of _MEDIT Prompt '\-'
	Define Bar 3 of _MEDIT Prompt win('Аварийный выход')
	Define Bar 4 of _MEDIT Prompt win('Вы\<ход') Key Alt+x,'Alt+ч'
	On Selection Bar 1 of _MEDIT Do pr
	On Selection Bar 3 of _MEDIT Quit
	On Selection Bar 4 of _MEDIT Do ex
endif
for i=1 to m.n_file
	priff[i]=mf(a[i], 'p_')
	Copy File (a[i]) to (priff[i])
	if m.n_file>1
		j=Ltrim(Str(m.i))
		k='Alt+'+m.j
		Define Pad ('p'+m.j) of _MSYSMENU Prompt 'Страница \<'+m.j Key &k;
			Color (','+iif(i=1, 'n/bg,,,,,n/bg','gr+/w,,,,,w+/w'))
		On Select Pad ('p'+m.j) of _MSYSMENU Do go_page with &j
	endif
endfor
WAIT CLEAR
IF m.X>79 or m.n_file>1
	ON KEY LABEL RIGHTARROW y=iif(Prog()="MODIFILE" ,ra(),.t.)
	ON KEY LABEL LEFTARROW y=iif(Prog()="MODIFILE" ,la(),.t.)
	ON KEY LABEL End Move Wind mod to wlRow(),80-wCols()
	ON KEY LABEL Home Move Wind mod to Row(),0
endif
IF !EMPTY(m.pri_PRG)
	ON KEY LABEL Enter Do pr
endif
Set Sysm AUTOMATIC
exit=.f.
i=1
Do While !m.exit
	Activate Window mod
	MODIFY FILE (a[m.i]) NOEDIT WINDOW mod IN mod
	exit=m.exit or Last()=27
EndDo
IF m.X>79
	ON KEY LABEL RIGHTARROW
	ON KEY LABEL LEFTARROW
	ON KEY LABEL End
	ON KEY LABEL Home
endif
IF !EMPTY(m.pri_PRG)
	ON KEY LABEL Enter
endif 
Set Color of Scheme 3 to
=m.printed or PR()
if Type('m.MainProgram')="U" or m.MainProgram#"svod"
	Set Sysmenu to Default
	Set Sysmenu off
endif
Release Window mod
for i=1 to m.n_file
	Erase (priff[i])
endfor
if !m.noErase
	for i=1 to m.n_file
		Erase (a[i])
	endfor
endif
p=Rat('.', m.file)
if m.p#0
	file=Left(m.file, m.p-1)
endif
Use in 25
if !m.needkey
	POP KEY
endif
Return .T.

Proc RA
	IF WLCOL()+WCOLS()>80
		MOVE WINDOW MOD BY 0, -1
	endif
Return

Proc LA
	if WLCOL()<0
		MOVE WINDOW MOD BY 0, 1
	endif
Return

Proc PR
Private CONS, temp, ok, what, where, outfile, _i
	Push Key Clear
	CONS=Set('Console')
	Set Console off
	IF EMPTY(m.pri_PRG)
		temp=Sys(2015)
		if m.win
			Define Window (m.temp) Shadow from 7,25 to 16,62;
				in Screen Float Title win(' Печатать ') Font 'System', 10;
				Color b/gb,n/w,n/bg,w+/n,w/n,w+/b,gr+/bg,n+/n,n/bg,bg/bg
		else
			Define Window (m.temp) Shadow from 7,25 to 16,55;
				in Screen Float Title ' Печатать ';
				Color b/gb,n/w,n/bg,w+/n,w/n,w+/b,gr+/bg,n+/n,n/bg,bg/bg
		endif
		Store 1 to ok, where, outf
		what=iif(''=_CLIPTEXT,1,3)
		outfile=Space(12)
		numbers=''
		Clear Gets
		Set Sysmenu off
		Activate Window (m.temp) NoShow
		@ wRow()-1, 3 Get m.ok Function '*nh \!'+win('Печать;Закрыть') Size 1,10,3;
			Valid _pri_()
		@ 0, 1 Get m.what Valid vlwhat();
			Function win('*rn Весь \<текст;\<Страницы;Выделенную \<часть')
		@ 1,14 Get m.numbers Size 1,10
		@ 4, 1 Get m.where Function '*rn '+win('на \<принтер;в \<файл');
			Valid vlwhere()
		@ 5,14 Get m.outf Function '*n '+win('выбор файла');
			Valid chfile() and vlwhere()
		chfile=0
		Activate Window (m.temp)
		Read Modal Cycle When vlwhat() and vlwhere()
		Release Window (m.temp)
		Set Sysmenu Auto
	else
		Do (m.pri_PRG)
		Set Printer off
		printed=.T.
	endif
	IF m.CONS='ON'
		Set CONSOLE ON
	endif
	Pop Key
Return

Func _pri_
Private _WRAP, mem, ex, error, nnn
	ex=0
	if m.ok=2
		Clear Read
	else
		Do Case
		Case m.what=1
			np=m.n_file
			Declare page[np]
			for i=1 to np
				page[i]=i
			endfor
		Case m.what=2
			if Empty(m.numbers)
				error=.t.
			else
				np=0
				nnn=','+Alltrim(m.numbers)
				error=.f.
				Do While ''#nnn and !m.error
					Do Case
					Case m.nnn='-'
						np=np+1
						Declare page[np]
						page[np]=''
					Case Val(m.nnn)=0
						if inList(m.nnn, ',', ';')
							np=np+1
							Declare page[np]
							page[np]=''
						else
							error=.t.
						endif
					EndCase
					page[m.np]=page[m.np]+Left(m.nnn,1)
					nnn=Stuff(m.nnn, 1, 1, '')
				EndDo
				if !m.error
					i=1
					do while i<=np and !m.error
						do while page[i]=','
							page[i]=Stuff(page[i],1,1,'')
						enddo
						if page[i]='-'
							do while page[i]='-'
								page[i]=Stuff(page[i],1,1,'')
							enddo
							page[i]=Int(Val(page[i]))
							if i>1
								k=page[i]-page[i-1]-1
								if k<0
									error=.t.
								else
									np=np+m.k
									Declare page[np]
									for j=1 to k
										=aIns(page, i)
										page[i]=page[i-1]+j
									endfor
									i=m.i+m.k+1
								endif
							endif
						else
							page[i]=Int(Val(page[i]))
							i=m.i+1
						endif
					enddo
					if !m.error
						i=1
						do while i<=m.np and !m.error
							p=1
							do while p>0
								p=aScan(page, page[i], m.i+1)
								if p>0
									=aDel(page, p)
									np=np-1
									Declare page[np]
								endif
							enddo
							i=i+1
						enddo
					endif
				endif
				if m.error
					Wait Window win('Указан неверный диапазон печати') NoWait
					Return ObjNum(m.numbers)
				endif
			endif
		Otherwise
			np=1
		EndCase
		_WRAP=.f.
		mem=Set('MemoWidth')
		Set MemoWidth to m.x
		Set Printer on
		if m.where=1
			for j=1 to m.CopyNum
				if m.j>1
					Wait Window 'Копия N '+Ltrim(Str(m.j));
						+' послана на принтер' NoWait
				endif
				for i=1 to np
					if Ready()
						Do prin0
					endif
				endfor
			endfor
		else
			if Empty(m.outfile)
				Wait Window 'Введите имя файла' Nowait
				ex=-1
			else
				Set Printer to (m.outfile)
				for i=1 to np
					Do prin0
				endfor
				Set Printer to
				Wait Window 'Копирование в файл успешно завершено.' Nowait
				ex=.t.
			endif
		endif
		Set Printer off
		Set MemoWidth to m.mem
	endif
Return m.ex

Proc prin0
Private f, n, a
*	? ''+CHR(27)+'9'+chr(27)+'M'+iif(m.small, chr(27)+'0', '')
	?
	Do Case
	Case m.what=3
		? _CLIPTEXT
	Case m.where=3
		Set Sysmenu to Default
		e=''
		last=.f.
		f=fOpen(priff[page[i]])
		Do While !fEof(m.f)
			Do _e
			if m.last
				Exit
			endif
			last=Right(m.e, 1)=''
		EndDo
		n=0
		l=Len(m.e)
		for i=1 to m.l
			if At(Subs(m.e, m.i, 1), '│▌░')#0
				n=m.n+1
				Declare a[n]
				a[n]=m.i
			endif
		endfor
		if m.n=0
			=ok('не получится\color="n/w,w+/b"')
		endif
		Select 25
		Use
		Create Table (m.outfile) (field_NAME C(10), field_TYPE C(1),;
			field_LEN N(3), field_DEC N(3))
		last=1
		for i=1 to n
			Append Blank
			Replace field_NAME with 's'+Ltrim(Str(m.i)),;
				field_TYPE with 'C', field_len with a[i]-m.last
			last=a[i]+1
		endfor
		Use
		Create (m.outfile) from (m.outfile)
		finish=.f.
		Do While !fEof(m.f)
			Append Blank
			last=1
			for i=1 to n
				Replace ('s'+Ltrim(Str(m.i))) with Subs(e, m.last, a[i])
				last=a[i]+1
			endfor
			if m.finish
				Exit
			endif
			Do _e
			finish=Right(m.e, 1)=''
		EndDo
		=fClose(m.f)
		Use
	Case page[i]<=m.n_file
		Type to Printer (priff[page[i]])
	EndCase
	*??chr(27)+'P'+iif(m.small, chr(27)+'2', '')
	if !m.noeject
		??''
	endif
	?
	printed=.t.
Return

Proc ex
	*Store .t. to printed, exit
	exit=.t.
	Release Window mod
Return

Proc go_page
Parameter pad
	Release Window mod
	Do df_win
	for i=1 to m.n_file
		j=Ltrim(Str(m.i))
		k='Alt+'+m.j
		Define Pad ('p'+m.j) of _MSYSMENU Prompt win('Страница \<'+m.j) Key &k;
			Color ,gr+/w,,,,,w+/w
	endfor
	i=m.pad
	j=Ltrim(Str(m.i))
	k='Alt+'+m.j
	Define Pad ('p'+m.j) of _MSYSMENU Prompt win('Страница \<'+m.j) Key &k;
		Color ,n/bg,,,,,n/bg
Return

Func vlwhere
	if m.where=1
		Show Get m.outf Disable
		if m.CopyNum>1
			@ 4,17 Say '('+Ltrim(Str(m.CopyNum))+win(' копи');
				+iif(m.CopyNum=1, 'я', win(iif(m.CopyNum<5, 'и', 'й')))+')'
		endif
		@ 6, 1 Say Space(wCols())
	else
		@ 4,17 Clear to 4,wCols()
		Show Get m.outf Enable
		if Empty(m.outfile)
			Do chfile
		endif
		@ 6, 1 Say PadR(m.outfile, wCols())
	endif
Return .t.

Func vlwhat
	if m.what=2
		Show Get m.numbers Enable
		_CurObj=ObjNum(m.numbers)
	else
		Show Get m.numbers Disable
	endif
Return .t.

Proc df_win
	if m.win
		DEFINE WINDOW MOD FROM 0,0 TO 40, 300 COLOR (m.COLOR) NoNe Font 'System', 10
	else
		DEFINE WINDOW MOD FROM 0,0 TO 24, m.X COLOR (m.COLOR) NoNe
	endif
Return

Proc _e
	e=FGets(m.f)
	if At(Left(m.e,1), '│▌░')#0
		e=Stuff(m.e, 1, 1, '')
	endif
Return

Func chfile
	outfile=PutFile(win('Введите имя файла'), '', 'txt')
	if File(m.outfile);
	and !menu02(win('Файл ')+m.outfile+win(' уже существует.▌Заменить его новым?'))
		outfile=''
		_CurObj=ObjNum(m.outf)
	else
		_CurObj=ObjNum(m.ok)
	endif
Return .t.
