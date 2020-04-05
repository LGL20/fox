Parameter keys, rgbg, rgen
Private dop, task, title, height, width, obje, special, acti,;
	sl, y, prmtr, m, k, p, bg, en, d, bord, ex
Store .f. to dop, task, title, height, width, obje, special, rgsgat, alltime, acti
Store '' to rgotpk, bord
Store 1 to rgalp, rgpf
Declare g[12]
Store 0 to m, k, p, bg, en, d, height, width, ok, ex
rgopl=3
Do keyPar with m.keys
if ''=m.bord
	wasBord=Set('Border')
	Set Border to Single
endif
Define Window range2 NoClose Float Shadow Color Scheme 13 &bord;
	from 9-Ceiling(m.height*.5), Max(0, 21-Ceiling(m.width*.5));
	to 15+Int(m.height*.5), Min(58+Int(m.width*.5), 79);
	Title iif(empt(m.title),'',' '+m.title+' ')
Activate Window range2 NoShow
if !m.special
	@ wrows()-1, 1 get m.ok siZe 1, 10 function '*n \!\<Расчет';
		Valid okk()
	@ wrows()-1, wCols()-12 get m.ex siZe 1, 11 function '*t \<Закpыть'
endif
ran_row=0
Do ran_gets
alltime=.f.
if !Empty(m.dop)
	do (m.dop)
endif
sl=m.task
do defa with m.obje, 1
On ReadError wait wind 'Дата введена невеpнo' nowa
okk=''
Activate window range2
Read Cycle Object m.obje When ran_Vl() Activate ac()
Release Window range2
On ReadError
if tyPeahead('m.rgbg')='d'
	rgbg=date83(m.rgbg)
	rgen=date83(m.rgen)
endif
Do SavePara
Return m.ok=1
*Return m.okk

Func ac
	if !Empty(m.acti)
		Do (m.acti)
	endif
Return .t.
