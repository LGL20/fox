Para var, defa
if Empty(m.var) and !(Type('m.var')='C' and ''#Trim(m.var))
	var=m.defa
endif
Return m.var
