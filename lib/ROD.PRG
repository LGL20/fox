Para tx, rod, ukr
Private x
if m.tx='��ࠨ��'
	Return m.tx
endif
if m.ukr
	tx=Chrt(Rtri(m.tx),'op','��')
	x=Righ(m.tx,3)
	y=m.x
	Do Case
	Case inList(m.x,'��','��','ࠡ','���','���')
	Case m.x='�i'
		y='쪨�'
	Case m.x='ન' or m.x='ન'
		y='ப'
	Case m.x='��i'
		y='��i�'
	Case m.x='���'
		y='����'
	Case m.x='���'
		y='���'
	Case m.x='��i' or m.x='���'
		y='����'
	Case m.x='���'
		y='����'
	Case m.x='���'
		y='���'
	Case m.x='���'
		y='���'
	Case m.x='��'
		y='����'
	Case m.x='���'
		y='���'
	Case m.x='���'
		y='���'
	Case m.x='���'
		y='��'
	Case inList(m.x,'���','���','殢','���','���')
		y=m.x+'�'
	Otherwise
		Store Righ(m.tx,2) to x,y
		Do Case
		Case inList(m.x,'��','�','��','��','�')
		Case m.x='��'
			y='���'
		Case m.x='��'
			y='��'
		Case m.x='��'
			y='��'
		Case m.x='��'
			y='��'
		Case m.x='��'
			y='��'
		Otherwise
			Store Right(m.x,1) to x,y
			Do Case
			Case At(m.x,'.�����H��������������������������')#0
				y=m.x
			Case m.x='�'
				y='�'
			Case m.x='�'
				y='�'
			Case m.x='�'
				y='�'
			Case m.x='�'
				y='��'
			Case m.x='�'
				y='�'
			Case inList(m.x,'�','�','�')
				y=m.x+'�'
			EndCase
		EndCase
	EndCase
	x=Len(m.x)
	Retu Stuff(m.tx, Len(m.tx)-m.x+1,m.x,m.y)
else
	tx=Chrt(Rtri(m.tx),'op','��')
	if Len(Allt(m.tx))<3
		Return m.tx
	endif
	x=Righ(m.tx,5)
	Do Case
	Case m.x='嬠��'
		y='嬠��'
	Case m.x='�ࠫ�'
		y='�ࠫ�'
	Case m.x='���'
		y='���'
	Case m.x='���'
		y='���'
	Otherwise
		x=Righ(m.tx,3)
		y=m.x
		Do Case
		Case inList(m.x,'��','��','ࠡ','���','���')
		Case m.x='��'
		Case m.x='���'
			y='����'
		Case m.x='���'
			y='����'
		Case m.x='���'
			y='���'
		Case m.x='���'
			y='���'
		Case m.x='��'
			y='����'
		Case m.x='���'
			y='���'
		Case m.x='���'
			y='���'
		Case m.x='���'
			y='����'
		Case m.x='���'
			y='��'
		Case m.x='���'
			y='��'
		Case inList(m.x,'���','���','殢','���','���','ᮢ','��')
			y=m.x+'�'
		Otherwise
			Store Righ(m.tx,2) to x,y
			Do Case
			Case inList(m.x,'��','�','��','��','�','��')
			Case m.x='��'
				y='���'
			Case m.x='�'
				y='�'
			Case m.x='��'
				y='���'
			Case m.x='��'
				y='��'
			Case m.x='��'
				y='��'
			Case m.x='��'
				y='��'
			Case m.x='��'
				y='�'
			Case m.x='��'
				y='��'
			Otherwise
				Store Right(m.x,1) to x,y
				Do Case
				Case At(m.x,'.�����H��������������������������')#0
					y=m.x
				Case m.x='�'
					y='�'
				Case m.x='�'
					y='�'
				Case m.x='�'
					y='�'
				Case m.x='�'
					y='��'
				Case m.x='�'
					y='�'
				Case m.x='�'
					y='�'
				Case At(m.x, '����')>0
					y=m.x+'�'
				EndCase
			EndCase
		EndCase
	EndCase
	x=Len(m.x)
	Retu Stuff(m.tx, Len(m.tx)-m.x+1,m.x,m.y)
endif
