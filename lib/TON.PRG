Para color
Priv p
p=At('/',m.color)
Retu iif(Subs(m.color,m.p-1,1)='+',;
	Left(m.color,m.p-2), Left(m.color,m.p-1)+"+")+"/"+;
	Subs(m.color,m.p+1,Len(m.color))
