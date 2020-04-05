Parameter form, parameter
if wExist(m.form)
	Activate Window (m.form) Top
else
	if Type('m.parameter')="L" and !m.parameter
		Do Form (m.form)
	else
		Do Form (m.form) with m.parameter
	endif
endif
