Parameter tx, ukr, _win, male
Private p
tx=Trim(m.tx)
if ''#m.tx
	if m._win
		tx=fromwin(m.tx)
	endif
	do while .t.
		p=At('  ', m.tx)
		if m.p=0
			Exit
		endif
		tx=Strt(m.tx, '  ', ' ')
	enddo
	do while .t.
		p=At(' ', m.tx)
		if m.p=0
			Exit
		endif
		*tx=Stuff(m.tx, m.p-1, 3, iif(Subst(m.tx, m.p-1, 1)$'�', '�',;
		*	Subst(m.tx, m.p-1, 1))+RLower(Subst(m.tx, m.p+1, 1)))
		tx=Stuff(m.tx, m.p-1, 3, '�'+RLower(Subst(m.tx, m.p+1, 1)))
	enddo
	if Right(m.tx,1)$'�����'
		tx=Left(m.tx, Len(m.tx)-1)
	endif
	if m.male
		Do Case
		Case Right(m.tx,2)='�'
			tx=Stuff(m.tx, Len(m.tx)-1, 1, '�')
		Case Right(m.tx,2)='��'
			tx=Stuff(m.tx, Len(m.tx)-1, 1, 'i')
		Case Right(m.tx,2)='�'
			tx=Left(m.tx, Len(m.tx)-2)
		Case Right(m.tx,2)='��'
			tx=Stuff(m.tx, Len(m.tx), 0, '�')
		Case Right(m.tx,2)='��'
			tx=m.tx+'i�'
		Case Right(m.tx,2)='�'
			tx=Left(m.tx, Len(m.tx)-1)+'��'
		Case Right(m.tx,2)='��'
			tx=Left(m.tx, Len(m.tx)-1)
		Case Right(m.tx,2)='��'
			tx=m.tx+'��'
		Case Right(m.tx,1)='�'
			tx=m.tx+'�'
		EndCase
		tx=iif(Right(m.tx,1)$'��', m.tx,;
			iif(Right(m.tx,1)$'�', Left(m.tx, Len(m.tx)-1)+'�',;
			m.tx+'�'))+'쪨�'
	else
		tx=m.tx+'�쪠'
	endif
endif
Return iif(m.win, towin(m.tx), m.tx)
