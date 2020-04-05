Parameter r
Return iif(m.win and r=null, '', Strt(Strt(Strt(str(asc(right(r,1)),2)+'.'+str(asc(subs(r,2,1)),2);
	+'.'+str(asc(left(r,1)),2),' ','0'),'32','  '),'00.00.00','  .  .  '))
