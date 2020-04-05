Para h,color,titl
Priv i,l,pr,g,ng
do defa with m.titl,''
l=aLen(h)
ng=0
for i=1 to m.l
	ng=Max(m.ng,Len(h[i]))
endf
do defa with m.color, "n/w"
g=m.color+",,"+ton(m.color)
Defi Wind scroll from 0,0 to m.l+2,m.ng+4 Shad Doub Colo (m.g) Titl m.titl
do esc_code
g=m.g+m.ng
Rele ng
Acti Wind scroll NoShow
for i=1 to m.l
	? ' '+Chrt(h[i],m.g,'')
endf
pr=.f.
WAIT CLEAR
Acti Wind scroll Same
do while .t.
	key=inKey(0,'hm')
	do case
		case key=4
			if wLcol()+wCols()>sCol()-2
				Move Wind scroll By 0,-1
			endi
		case key=19
			if wLcol()<0
				Move Wind scroll By 0,1
			endi
		case key=5
			if wLrow()<0
				Move Wind scroll By 1,0
			endi
		case key=24
			if wLrow()+wRows()>sRow()-2
				Move Wind scroll By -1,0
			endi
		case key=9
			if wLcol()+wCols()-1>sCol()
				Move Wind scroll By 0,-5
			else
				Move Wind scroll to wLrow(),Min(sCol()-wCols()-2, 0)
			endi
		case key=15
			if wLcol()<0
				Move Wind scroll By 0,5
			else
				Move Wind scroll to wLrow(),0
			endi
		case key=18
			if wLrow()>-10
				Move Wind scroll to 0, wLcol()
			else
				Move Wind scroll By 10,0
			endi
		case key=3
			if wLrow()+wRows()-10<sRow()
				Move Wind scroll to sRow()-wRow()-2, wLcol()
			else
				Move Wind scroll By -10,0
			endi
		case key=1
			Move Wind scroll to wLrow(),0
		case key=6
			Move Wind scroll to wLrow(), Min (sCol()-wCols()-2, 0)
		case key=29
			Move Wind scroll to 0,0
		case key=23
			Move Wind scroll to sRow()-wRow()-2, Min (sCol()-wCols()-2, 0)
		case key=13
			do while menu02("Печатать?")
				pr=.t.
			 	do pri
			enddo
		case key=27
			do while !m.pr and menu02("Печатать?")
			 	do pri
			enddo
			Exit
	endcase
enddo
Rele Wind scroll

Proc pri
	if Ready()
		Stor '' to g,ng
		do esc_code
		Set Cons off
		Set Prin on
		?chr(27)+'9'+m.g+m.titl+m.ng
		for i=1 to m.l
			?h[i]
		endf
		?
		Set Cons on
		Set Prin off
	endi
Retu
