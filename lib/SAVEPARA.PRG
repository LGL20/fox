Private kk
kk=m.PathUser+'range2.mem'
*if !File(m.kk)
*	kk=fullPath('range2.mem')
*	if Empty(m.kk)
*		kk=left(set('Path'),4)+'\range2'
*	endif
*endif
Save All Like rg* to &kk
