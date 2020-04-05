Para ro, co, height, width, type, color
DO defa WITH m.type,''
DO defa WITH m.color, 'n/w'
m.height = m.height + 1
m.width	 = m.width  + 1

@ m.ro, m.co TO m.ro+m.height, m.co+m.width &type COLO (m.color)
@ m.ro+1, m.co+m.width+1 to m.ro+m.height+1, m.co+m.width+2 Fill Colo n/n
@ m.ro+m.height+1, m.co+2 to m.ro+m.height+1, m.co+m.width Fill	Colo n/n
@ m.ro,m.co FILL TO m.ro+m.height,m.co+m.width COLO (m.color)
Priv c
c=schm(m.color,3)
