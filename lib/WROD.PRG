Para tx, rod
Priv x
tx=Chrt(Rtri(m.tx),'op','��')
if Len(Allt(m.tx))<3
	Return m.tx
endif
x=Righ(m.tx,5)
Do Case
Case m.x='�����'
	y='�����'
Case m.x='�����'
	y='�����'
Case m.x='����'
	y='����'
Case m.x='����'
	y='����'
Otherwise
	x=Righ(m.tx,3)
	y=m.x
	Do Case
	Case inList(m.x,'���','���','���','���')
	Case m.x='���'
	Case m.x='���'
		y='���'
	Case m.x='���'
		y='����'
	Case m.x='���'
		y='����'
	Case m.x='���'
		y='���'
	Case m.x='���'
		y='���'
	Case m.x='���'
		y='����'
	Case m.x='���'
		y='���'
	Case m.x='���'
		y='���'
	Case m.x='���'
		y='����'
	Case m.x='���'
		y='���'
	Case inList(m.x,'���','���','���','���','���','���','���')
		y=m.x+'�'
	Otherwise
		Store Righ(m.tx,2) to x,y
		Do Case
		Case inList(m.x,'��','��','��','��','��','��','��')
		Case m.x='��'
			y='��'
		Case m.x='��'
			y='���'
		Case m.x='��'
			y='��'
		Case m.x='��'
			y='���'
		Case m.x='��'
			y='���'
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
