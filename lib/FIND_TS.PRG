Parameter code
Index on code to temp
code=chr(0)
Scan
	if code=m.code
		*k=kd(k)
		*repl code with k
		*Go Top
		canc
	endif
	code=code
EndScan
