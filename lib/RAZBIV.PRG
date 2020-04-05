PARAMETERS X, A, N, M, LEN
PRIVATE all_, d_need, row, col, p, i, e, s
row=At(chr(124), m.x)
row=iif(m.row=0, 'Þ', chr(124))
COL='³'
d_need=RIGHT(m.X,1)#m.ROW
if m.d_need
	X=m.X+m.ROW
	d_need=.t.
ENDIF
N=OCCURS(m.ROW,m.X)
M=0
P=1
FOR I=1 TO m.N
	E=AT(m.ROW,m.X,m.I)
	S=SUBSTR(m.X,m.P,m.E-m.P)
	P=m.E+1
	M=MAX(m.M,OCCURS(m.COL,m.S)+1)
ENDFOR
Declare A(m.N, m.M)
STORE '' TO A
P=1
LEN=0
FOR I=1 TO m.N
	E=AT(m.ROW,m.X,m.I)
	S=SUBSTR(m.X,m.P,m.E-m.P)
	IF RIGHT(m.S,1)<>m.COL
		S=m.S+m.COL
	ENDIF
	P=m.E+1
	V=1
	L=0
	FOR J=1 TO m.M
		E=AT(m.COL,m.S,m.J)
		A(m.I, m.J)=SUBSTR(m.S,m.V,m.E-m.V)
		V=m.E+1
		IF EMPTY(A(m.I,m.J))
			EXIT
		ENDIF
		L=m.L+LEN(A(m.I,m.J))+1
	ENDFOR
	LEN=MAX(m.LEN,m.L)
ENDFOR
LEN=LEN+2
if m.d_need
	x=Left(m.x, Len(m.x)-1)
endif

