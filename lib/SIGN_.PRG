Parameter x
Private p
if Type('m.x')#"C" or ''=m.x
	Return ''
endif
x=Trim(m.x)
p=At('.', m.x)
Do Case
Case m.p=0
Case m.p#2
	m.x = Trim(Subs(m.x, m.p-1, 100))+' '+Trim(Left(m.x, m.p-2))
Case At(' ', m.x)=0
	p=At('.', m.x, 2)
	if m.p=0
		p=At('.', m.x)
	endif
	x=Stuff(m.x, m.p+1, 0, ' ')
EndCase
Return '( '+win(m.x)+' )'
