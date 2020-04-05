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
		*tx=Stuff(m.tx, m.p-1, 3, iif(Subst(m.tx, m.p-1, 1)$'а', 'о',;
		*	Subst(m.tx, m.p-1, 1))+RLower(Subst(m.tx, m.p+1, 1)))
		tx=Stuff(m.tx, m.p-1, 3, 'о'+RLower(Subst(m.tx, m.p+1, 1)))
	enddo
	if Right(m.tx,1)$'оаияеє'
		tx=Left(m.tx, Len(m.tx)-1)
	endif
	if m.male
		Do Case
		Case Right(m.tx,2)='ьв'
			tx=Stuff(m.tx, Len(m.tx)-1, 1, 'е')
		Case Right(m.tx,2)='ов'
			tx=Stuff(m.tx, Len(m.tx)-1, 1, 'i')
		Case Right(m.tx,2)='ьк'
			tx=Left(m.tx, Len(m.tx)-2)
		Case Right(m.tx,2)='бн'
			tx=Stuff(m.tx, Len(m.tx), 0, 'е')
		Case Right(m.tx,2)='нк'
			tx=m.tx+'iв'
		Case Right(m.tx,2)='чк'
			tx=Left(m.tx, Len(m.tx)-1)+'ан'
		Case Right(m.tx,2)='вк'
			tx=Left(m.tx, Len(m.tx)-1)
		Case Right(m.tx,2)='ух'
			tx=m.tx+'ин'
		Case Right(m.tx,1)='л'
			tx=m.tx+'ь'
		EndCase
		tx=iif(Right(m.tx,1)$'сц', m.tx,;
			iif(Right(m.tx,1)$'чк', Left(m.tx, Len(m.tx)-1)+'ц',;
			m.tx+'с'))+'ький'
	else
		tx=m.tx+'ська'
	endif
endif
Return iif(m.win, towin(m.tx), m.tx)
