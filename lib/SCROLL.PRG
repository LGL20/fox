Para y,x,prog,color,pri
Priv key
Defi Wind scroll from 0,0 to y,x Shad;
	Colo (iif(Empt(m.color), "n/w", m.color))
Acti Wind scroll NoShow
do (prog)
WAIT CLEA
pr=.f.
Acti Wind scroll Same
do whil .t.
	key=inKe(0,'hm')
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
		do whil menu02("Печатать?") and Ready()
			pr=.t.
			Set Cons off
		 	do (pri)
			Set Cons on
		endd
	case key=27
		do whil !m.pr and menu02("Печатать?") and Ready()
			Set Cons off
		 	do (pri)
			Set Cons on
		endd
		Exit
	endc
endd
Rele Wind scroll
