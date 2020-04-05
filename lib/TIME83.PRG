Parameter time
if Type('m.time')#"C"
	time=Time()
endif
Return iif(''=Chrt(m.time, ': ', ''), '',;
	chr(Val(Subs(m.time,1,2)))+chr(Val(Subs(m.time,4,2)))+chr(Val(Subs(m.time,7,2))))
