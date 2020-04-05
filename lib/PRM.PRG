f_in=GetFile('prm', 'Введите программу для преобразования')
if ''#m.f_in
	Store .f. to inProc, win
	Do wai
	in=FOpen(m.f_in)
	KolStr=0
	Do While !Feof(m.in)
		s0=FGets(m.in)
		KolStr=m.KolStr+1
	EndDo
	=FClose(m.in)
	KolStr=m.KolStr-2
	fout=Strt(m.f_in, 'PRM', 'prg')
	out=FCreate(m.fout)
	s=''
	if Used('FoxWords')
		Select FoxWords
	else
		Select 0
		Use FoxWords
	endif
	Set Index to FoxWords
	in=FOpen(m.f_in)
	Do While m.KolStr>0
		KolStr=m.KolStr-1
		s0=FGets(m.in)
		if m.s0#'*'
			s=m.s+Lower(m.s0)
			s=Strt(m.s, '->', '.')
			s=Strt(m.s, ' . ', '.')
			s=Strt(m.s, 'M.', 'm.')
			s=Strt(m.s, '<>', '#')
			s=Strt(m.s, '.and.', ' and ')
			s=Strt(m.s, '.or.', ' or ')
			s=Strt(m.s, '.not.', '!')
			s=Strt(m.s, ' indexes ', ' Index ')
			s=Strt(m.s, 'transform', 'Tran')
			s=Strt(m.s, 'replicate', 'Repl')
			s=Strt(m.s, 'procedure', 'Proc')
			if m.s='Function'
				s=Strt(m.s, 'Function', 'Func')
			endif
			if Right(m.s,1)=';'
				s=Left(m.s, Len(m.s)-1)
			else
				s0=m.s
				s=''
				Do While ''#m.s0
					w=WordNum(m.s0, 1, '(')
					l=Len(m.w)+1
					Seek m.w
					f=Trim(topic)
					s=m.s+iif(Found() and m.w=m.f, Proper(m.f), m.w);
						+Subs(m.s0, m.l, 1)
					s0=Stuff(m.s0, 1, m.l, '')
				EndDo
				s=Strt(m.s, ' On ', ' on ')
				i=1
				do while Subs(m.s, m.i, m.i+3)='   '
					s=Stuff(m.s, m.i, 3, chr(9))
					i=m.i+1
				enddo
				s=Strt(m.s, ' = ', '=')
				if m.inProc
					if m.s='Return'
						inProc=.f.
					else
						s=chr(9)+m.s
					endif
				endif
				=FPuts(m.out, m.s)
				if m.s='Proc '
					inProc=.t.
				endif
				s=''
			endif
		endif
	EndDo
	Use
	=FClose(m.in)
	=FClose(m.out)
	Set Sysmenu to Default
	Set Sysmenu on
	Wait Clear
	Modify Command (m.fout)
endif

