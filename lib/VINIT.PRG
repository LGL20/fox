Para tx, female
Priv x,z
Store Righ(m.tx,3) to x,z
Do Case
Case m.x='���'
	z='����'
Otherwise
	Store Righ(m.tx,2) to x,z
	Do Case
	Case m.x='��'
		z='��'
	Case m.x='��'
		z='��'
	Case m.x='��'
		z='��'
	Case m.x='��'
		z='��'
	Case m.x='��'
		z='��'
	Case m.x='��'
		z='��'
	Case inList(m.x,'��','�','�','��','��','o�','��')
		z=m.x
	Otherwise
		Store Righ(m.x,1) to x,z
		Do case
		Case m.x='p'
			z='�'
		Case m.x='�'
			z='�'
		Case m.x='�'
			z='�'
		Case m.x='�'
			z='�'
		Case m.x='�'
			z='o�'
		Case m.x='�'
			z='�'
		Case m.x='�'
			z='��'
		Case m.x='�'
			z='�'
		EndCase
	EndCase
EndCase
x=Len(m.x)
Return Stuff(m.tx, Len(m.tx)-m.x+1, m.x,m.z)
