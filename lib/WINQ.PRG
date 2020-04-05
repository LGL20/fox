Para ro, co, height, width, type, color, fon
Priv old,i,f
Do defa with m.type,''
Do defa with m.color, 'n/w'
Do defa with m.fon, 'b/b'
height=m.height+1
width =m.width +1
f=Subs(m.fon,At('/',m.fon)+1,Len(m.fon))
f=m.f+'/'+m.f
@ m.ro, m.co TO m.ro+m.height, m.co+m.width &type Colo (m.f)
old=Set("Colo")
Set Colo to (m.f)
@ m.ro+1,m.co+1 Clea to m.ro+m.height-1,m.co+m.width-1
@ m.ro,m.co FILL TO m.ro+m.height,m.co+m.width COLO (m.color)
height=m.height+1
width=m.width+2
@ m.ro+m.height,m.co+2 FILL TO m.ro+m.height,m.co+m.width COLO n/n
@ m.ro+1,m.co+m.width-1 FILL TO m.ro+m.height,m.co+m.width COLO n/n
Set Colo to (m.old)
