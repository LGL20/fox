Parameters mon, year, color, ro, co, ondo, ConstYear
Private oldy, oldm
if Empty(m.mon)
	mon=Mont(Date())
endif
b=Type('m.year')
Do Case
Case m.b='N'
	year=Str(m.year,4)
Case m.b='L'
	year=Str(Year(Date()),4)
EndCase
do defa with m.ro, 13
do defa with m.co, 21
Decl b[12]
do mon with b
oldy=m.year
mon=aSca(b,walk('ﭢ���䥢ࠫ쳬���ޠ�५쳬������ި�쳠�����ᥭ����ޮ����쳭���쳤������',;
	"�롥�� ����� �� "+m.year+" ���",	b[m.mon],ro,co,;
	iif(m.ConstYear, '', '��������� �o�� - F2'),m.color,.t.,'izm_year',.f.,.f.,m.ondo))
if Last()=27
	year=m.oldy
	mon=0
endif

Proc izm_year
	if !m.ConstYear
		@ 0,22 Get m.year Vali Val(m.year)>1000 Erro '�o� ������ �����o';
			Size 1,4
		Read
		r=schm(m.color,4)
		@ 0,22 Say m.year Colo (m.r)
	endif
Retu
