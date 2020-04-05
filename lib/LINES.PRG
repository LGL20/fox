Parameters str, len, N, J, LINES
Private size, pos, J, R, S, P, I, Y, exac, TRIM, tr
exac=SET('Exac')
Set Exac On
str=Strt(m.str,CHR(10))
TRIM=.F.
DO KEYPAR WITH m.str
size=MAX(Len(ALLTRIM(m.str)),3)
pos=1
J=0
r=' ,.-'
S=''
tr=CHR(13)+'▌▐|'
DO WHILE m.pos+1<=m.size
	J=m.J+1
	Declare n[m.j]
	n[J]=m.s+Substr(m.str, m.pos, m.len-Len(m.s)+1)
	pos=m.pos-Len(m.s)
	i=1
	p=0
	Do While i<=Len(m.tr) and m.p=0
		p=At(Subs(tr, m.i, 1), n[j])
		i=m.i+1
	EndDo
	if m.p=0
		s=Substr(m.str, m.pos, 1)
		Y=.F.
		if Len(n[j])>m.len
			*FOR I=1 TO m.CHARS
			FOR I=1 TO Len(m.r)
				*if m.s=r[i]
				if m.s=Subs(m.r, m.i, 1)
					S=''
					Y=.T.
					EXIT
				endif
			ENDFOR
			if !m.Y
				*FOR I=1 TO m.CHARS
				FOR I=1 TO Len(m.r)
					p=RAT(Subs(m.r, m.i, 1), n[J])
					*p=RAT(r[i], n[J])
					if m.p>1
						n[J]=LEFT(n[J],m.p)
						S=''
						EXIT
					endif
				ENDFOR
			endif
		endif
		pos=m.pos+Iif(m.p=0,m.len+1,m.p)
	ELSE
		pos=m.pos+m.p
		n[J]=LEFT(n[J],m.p-1)
		S=''
	endif
	n[J]=iif(m.trim, ALLTRIM(n[J]), PADR(Ltrim(n[J]), m.len))
EndDo
lines=Max(m.j, iif(Empty(m.lines), 0, m.lines))
Declare n[m.lines]
for i=m.j+1 to m.lines
	n[m.i]=iif(m.TRIM,'',SPACE(m.len))
endfor
Do exac
RETURN J
