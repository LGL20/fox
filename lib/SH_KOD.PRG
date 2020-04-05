Parameter KOD
Private I, S, len
S=''
len=Len(m.kod)
FOR I=1 TO m.len
   S=m.S+SUBSTR(m.KOD,m.I,1)+' ³ '
ENDFOR
Return '³ '+m.S
