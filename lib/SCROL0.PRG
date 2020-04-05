Para pri
Priv key, pr, wwin
wwin=wOut()
pr=.f.
Acti wind (m.wwin) Same
Do Whil .t.
	key=inKe(0,'hm')
	do case
	case key=4
		if wLco()+wCol()>sCol()-2
			Move wind (m.wwin) By 0,-1
		endi
	case key=19
		if wLco()<0
			Move wind (m.wwin) By 0,1
		endi
	case key=5
		if wLro()<0
			Move wind (m.wwin) By 1,0
		endi
	case key=24
		if wLro()+wRow()>sRow()-2
			Move wind (m.wwin) By -1,0
		endi
	case key=9
		if wLco()+wCol()-1>sCol()
			Move wind (m.wwin) By 0,-5
		else
			Move wind (m.wwin) to wLro(),Min(sCol()-wCol()-2, 0)
		endi
	case key=15
		if wLco()<0
			Move wind (m.wwin) By 0,5
		else
			Move wind (m.wwin) to wLro(),0
		endi
	case key=18
		if wLro()>-10
			Move wind (m.wwin) to 0, wLco()
		else
			Move wind (m.wwin) By 10,0
		endi
	case key=3
		if wLro()+wRow()-10<sRow()
			Move wind (m.wwin) to sRow()-wRow()-2, wLco()
		else
			Move wind (m.wwin) By -10,0
		endi
	case key=1
		Move wind (m.wwin) to wLro(),0
	case key=6
		Move wind (m.wwin) to wLro(), Min (sCol()-wCol()-2, 0)
	case key=29
		Move wind (m.wwin) to 0,0
	case key=23
		Move wind (m.wwin) to sRow()-wRow()-2, Min (sCol()-wCol()-2, 0)
	case key=13 and !Empt(m.pri)
		pr=.t.
	 	do (pri)
	case key=27
		if !m.pr and !Empt(m.pri)
		 	do (pri)
		endi
		Exit
	endc
endd
Rele wind (m.wwin)
Retu .t.
