lParameter name
Local i, p, n, j, proj
if File(m.name)
	name = Lower(m.name)
	for j=1 to 2
		n = Application.Projects.Count
		for i=1 to m.n
			p = Application.Projects.Item[m.i]
			if Lower(m.p.name)=m.name
   				proj=m.p
				Exit
			endif
		endfor
		if m.i>m.n
			Modify Project (m.name) NoShow NoWait
		else
			Exit
		endif
	endfor
else
	MessageBox('Проект '+m.i+' не найден', 16, 'Свойства проекта')
	proj=null
endif
Return m.proj