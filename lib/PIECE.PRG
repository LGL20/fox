PARAMETERS LEN
IF A(T)+LEN>M->RMAR
   T = T+1
   DIMENSION A(T)
   A(T) = 0
ENDIF
A(T) = A(T)+LEN+1


