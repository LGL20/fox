PARAMETERS R, FULL, NUL, ed, ROD, edFIRST, KOP, UKR, kop_name, prop
PRIVATE n, ten, lg, c, m, l, i, f, g, w, s, t, q, noKop_name
Do defa with m.ed, ''
if m.rod
	ed=padeg(m.ed, iif(m.ukr, 'ukrod', 'rod'), .t.)
endif
noKop = Empty(m.kop_name)
if Type('m.rod')#"C"
	rod=iif(m.ed='гр', 'ж', '')
endif
DIMENSION N(9), C(6)
N(1)='один'
N(2)='два'
N(3)='три'
IF m.UKR
	N(4)='чотири'
	N(5)="п'ять"
	N(6)='шiсть'
	N(7)='сiм'
	N(8)='вiсiм'
	N(9)="дев'ять"
	TEN='надцять '
	lg='i'
ELSE
	N(4)='четыре'
	N(5)='пять'
	N(6)='шесть'
	N(7)='семь'
	N(8)='восемь'
	N(9)='девять'
	TEN='надцать '
	lg='е'
ENDIF
STORE '' TO C
IF m.FULL
	IF m.UKR
		C(2)='тисяч'
		C(3)='мiлiон'
		C(4)='мiлiард'
	ELSE
		C(2)='тысяч'
		C(3)='миллион'
		C(4)='миллиард'
	ENDIF
ELSE
	C(2)='тыс.'
	C(3)='млн.'
	C(4)='млрд.'
ENDIF
DECI=INT((m.R-INT(m.R))*100)
m=iif(Int(r)=0 and !m.nul, 'ноль', '')
R=LTRIM(STR(INT(m.R),100))
L=CEILING(LEN(m.R)/3)*3
R=PADL(m.R,m.L)
FOR m.I=m.L-2 TO 1 STEP -3
	F=CEILING((m.L-I)/3)
	G=SUBSTR(m.R,I,3)
	w=VAL(SUBSTR(m.G,1,1))
	DO CASE
	CASE m.w=0
		S=''
	CASE m.w=1
		S='сто '
	CASE m.w=2
		S=IIF(UKR,'двiстi ','двести ')
	CASE m.w=3.OR.m.w=4
		S=N(m.w)+'ста '
	OTHERWISE
		S=N(m.w)
		if m.ukr and m.w#7 and m.w#8
			s=Left(m.s, Len(m.s)-1)
		endif
		s=m.s+'сот '
	ENDCASE
	T=VAL(SUBSTR(m.G,2,1))
	q=VAL(SUBSTR(m.G,3,1))
	if m.T=1
		if m.q=0
			S=m.S+'десят'+iif(m.w<2, 'ь','')+' '
		else
			Do Case
			CASE m.q=1
				S=m.S+'один'+IIF(UKR,'','н')
			CASE m.q=2
				S=m.S+'дв'+IIF(UKR,'а','е')
			CASE m.q=3 or m.q=8
				S=m.S+n[q]
			OTHERWISE
				S=m.S+LEFT(N(m.q),LEN(N(m.q))-iif(q=7, 0, 1))
			ENDCASE
			s=m.s+m.ten
		endif
	else
		DO CASE
		CASE m.T=0
		CASE m.T=2.OR.m.T=3
			S=m.S+N(m.T)+RIGHT(m.TEN,6)
		CASE m.T=4
			S=m.S+'сорок '
		CASE m.T=9
			S=m.S+'дев'+IIF(UKR,"'",'')+'яносто '
		OTHERWISE
			S=m.S+N(m.T)+'десят '
		ENDCASE
		DO CASE
		CASE m.q=0
		CASE m.q<3 and (m.F=2.OR.(m.F=1 and (m.ROD='ж' or m.rod='ёЁ')))
			S=m.S+iif(m.q=1, 'одн'+iif(m.ROD='ж', 'а', 'о'), 'дв'+m.lg)+' '
		OTHERWISE
			S=m.S+N(m.q)+' '
		ENDCASE
	endif
	IF m.w+m.q+m.t#0
		G=''
		IF FULL
			IF m.F=2
				g=iif(m.q=1 and m.t#1, 'а', iif(BETWEEN(m.q,2,4), 'и', ''))
			ELSE
				G=IIF(m.q=1.OR.m.F=1,'',IIF(m.q=3.OR.m.q=4,'а',IIF(UKR,'i','о')+'в'))
			ENDIF
		ENDIF
		g=c[f]+m.G
		m=m.S+iif(''=m.g, '', m.g+' ')+m.m
	ENDIF
	if m.f=1
		DO CASE
		Case m.EdFirst
		CASE m.q=1 and m.rod='ж' and m.t#1
			Do case
			Case m.ed='гривень'
				ed='гривня'
			Case m.ed='копеек'
				ed='коп'+m.lg+'йка'
			ENDCase
		CASE m.t#1 and (m.q=3 or m.q=4 or (m.q=2 and m.rod='ж'))
			Do Case
			Case m.ed='копеек'
				ed='коп'+m.lg+'йки'
			Case m.ed='гривень'
				ed='гривнi'
			ENDCase
		Case m.ed='гривнi'
			ed='гривень'
		ENDCASE
	endif
ENDFOR
IF !m.edFIRST and m.prop
	m=RUSPROP(m.m)
ENDIF
m=win(TRIM(m.m))
IF ''#m.m and !Empty(m.ed)
	ed=win(m.ed)
	m=IIF(edFIRST,m.ed+' '+m.m, m.m+' '+m.ed)
ENDIF
if Type('m.kop')="C"
	kop_name = m.kop
	kop=.t.
endif
IF m.DECI#0.OR.(m.KOP and ''#m.m)
	r=MOD(m.DECI,10)
	Do defa with m.kop_name, 'коп'+iif(m.ukr, 'i','е')+'йки'
	kop=iif(m.r=4, m.kop_name, iif(m.ukr, ukrod(m.kop_name), rod(m.kop_name)))
	Do Case m.r=1
		Do Case
		Case m.kop='копеек'
			KOP='копейка'
		Case m.kop='копiйок'
			KOP='копiйка'
		Case m.kop='марок'
			KOP='марка'
		ENDCase
	Case m.r=2 and m.kop='копiйок'
		kop='копiйки'
	EndCase
	DECI=TRANSFORM(m.DECI,'@l 99')
	kop=win(m.kop)
	m=m.m+' '+IIF(m.edFIRST, m.KOP+' '+m.DECI, m.DECI+' '+m.KOP)
ENDIF
RETURN Trim(m.m)
