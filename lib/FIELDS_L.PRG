Private i, n
fields=''
n=FCount()
for i=1 to m.n
	fields=m.fields+','+Field(m.i)
endfor
Return Stuff(m.fields,1,1,'')
