para x
priv i
x = Ltrim(x)
for i=len(x)-2 to 2 step -3
	x=Stuff(x,i,0,',')
endfor
retu x
