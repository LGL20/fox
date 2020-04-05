PARAMETERS RO, CL, N, LEAVE
DO DEFA WITH M.RO, 7
DO DEFA WITH M.CL, 25
SET DATE Germ
M.MARK = MARK()
DIMENSION B(12)
DO MON WITH B
IF FILES('range.mem')
   RESTORE FROM range ADDITIVE
ELSE
   STORE DAY(DATE()) TO D1, D2
   STORE MONTH(DATE()) TO DM1, DM2
   STORE YEAR(DATE()) TO DY1, DY2
ENDIF
DEFINE WINDOW DATE FROM RO, CL TO RO+4, CL+23 SHADOW NONE COLOR N/W,N/BG
ACTIVATE WINDOW NOSHOW DATE
@ 0, 0 TO 4, 22 DOUBLE
@ 0, 23 FILL TO 4, 23 COLOR N/N
IF N
   @ 1, 10 SAY 'на'
ELSE
   @ 1, 2 SAY STR(D1,2)+' '+BB(DM1)+' '+STR(DY1,4)+' г.' COLOR N/BG
ENDIF
@ 3, 2 SAY STR(D2,2)+' '+BB(DM2)+' '+STR(DY2,4)+' г.' COLOR N/BG
ACTIVATE WINDOW SAME DATE
DO WHILE LASTKEY()<>27
   @ 2, 23 SAY '' COLOR W+/N
   LAST = INKEY(0,'hm')
   DO CASE
   CASE LAST=13
      IF DY1<>DY2
         WAIT WINDOW NOWAIT 'За два гoда не пoлучится'
      ELSE
         BEGIN = DDAT(D1,DM1,DY1)
         END = DDAT(D2,DM2,DY2)
         BG = DAT(BEGIN)
         EN = DAT(END)
         SAVE TO range ALL LIKE d*
         EXIT
      ENDIF
   CASE LAST<>27
      IF M.N
         I = 2
      ELSE
         I = 1
         IF !M.N and LAST<>9
            DO KUDA WITH M.I
         ENDIF
         I = MAX(1,M.I)
      ENDIF
      DO WHILE LASTKEY()#27 and (I=2 or (!M.N and I=1))
         IF I=1
            DO DT WITH 1, 2, D1, DM1, DY1
         ELSE
            DO DT WITH 3, 2, D2, DM2, DY2
         ENDIF
         DO KUDA WITH M.I
      ENDDO
   ENDCASE
ENDDO
IF !M.LEAVE
   RELEASE WINDOW DATE
ENDIF
RETURN LASTKEY()<>27

*****************************************************************************
*                                                                           *
*                          Procedure   DT                                   *
*                                                                           *
*****************************************************************************
PROCEDURE DT
PARAMETERS ROW, COL, DAY, MON, YE
@ 2, 23 SAY '' COLOR N/N
M.R = BB(MON)
PRIVATE M.DATE
M.DATE = CTOD(STR(DAY)+M.MARK+STR(MON)+M.MARK+STR(YE))
@ ROW, COL GET DAY SIZE 1, 2 VALID BETWEEN(DAY,1,DAYS(M.DATE)) ERROR 'Дата;
 дoлжна быть между 1 и '+STR(DAYS(M.DATE),2)
@ ROW, COL+3 GET M.R DEFAULT 0 WHEN W_MON()
@ ROW, COL+12 GET YE SIZE 1, 4 VALID YE>0 ERROR 'Гoд - пoлoжительнoе числo!'
@ ROW, COL+17 SAY 'г.' COLOR N/BG
READ
RETURN LASTKEY()<>27

*****************************************************************************
*                                                                           *
*                          Procedure   W_MON                                *
*                                                                           *
*****************************************************************************
PROCEDURE W_MON
DIMENSION ALL(12)
FOR J = 1 TO 12
   ALL(J) = STR(J,3)+'│ '+B(J)
ENDFOR
DEFINE WINDOW MON FROM RO, CL TO RO+13, CL+14 SHADOW NONE
ACTIVATE WINDOW NOSHOW MON
@ ROW+1, 1 MENU ALL, 12, 12 TITLES '  '
M.R = M.MON
READ MENU TO R
RELEASE WINDOW MON
DO CASE
CASE LASTKEY()=19
   _CUROBJ = 1
CASE LASTKEY()=27
   CLEAR READERROR
CASE LASTKEY()=13
   M.MON = M.R
   @ ROW, COL+3 SAY BB(MON) COLOR N/BG
ENDCASE
RETURN .F.


