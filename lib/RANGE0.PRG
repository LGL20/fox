PARAMETERS BG, EN, YEAR, COLOR, RO, CO, LEAVE
PRIVATE GTC, X, SD
DO DEFA WITH BG, CHR(1)+CHR(1)
DO DEFA WITH EN, CHR(1)+CHR(1)
DO DEFA WITH COLOR, 'b/w,n/w,b/w,b/w'
DO DEFA WITH RO, 10
DO DEFA WITH CO, 25
IF TYPEAHEAD('year')='N'
   YEAR = STR(YEAR)
ENDIF
YEAR = '.'+RIGHT(YEAR,2)
SD = SET('Date')
SET DATE Germ
DO CTODMY WITH BG
DO CTODMY WITH EN
GTC = SCHM(COLOR,2)
DEFINE WINDOW RANGE FROM RO, CO TO RO+2, CO+22 SHADOW TITLES ' Периoд ';
 COLOR (COLOR)
ACTIVATE WINDOW NOSHOW RANGE
@ 0, 1 SAY BG+YEAR COLOR (GTC)
@ 0, 10 SAY '-'
@ 0, 12 SAY EN+YEAR COLOR (GTC)
GTC = 1
ACTIVATE WINDOW RANGE
DO WHILE .T.
   X = IIF(GTC=1,BG,EN)
   DO WHILE .T.
      @ 0, GTC*11-10 GET X PICTURE '@l 99.99'
      READ
      IF EMPTY(CTOD(M->X+M->YEAR))
         WAIT WINDOW NOWAIT 'Дата введена невернo!'
      ELSE
         EXIT
      ENDIF
   ENDDO
   STORE X TO (IIF(GTC=1,'bg','en'))
   IF INLIST(LASTKEY(),13,27,151)
      EXIT
   ENDIF
   DO KUDA WITH GTC, 2
ENDDO
IF .NOT.M->LEAVE
   RELEASE WINDOW RANGE
ENDIF
BEGIN = BG+YEAR
END = EN+YEAR
DO DMTOC WITH BG
DO DMTOC WITH EN
SET DATE (M->SD)

*****************************************************************************
*                                                                           *
*                          Procedure   CTODMY                               *
*                                                                           *
*****************************************************************************
PROCEDURE CTODMY
PARAMETERS X
X = TRANSFORM(ASC(RIGHT(X,1)),'@l 99')+'.'+TRANSFORM(ASC(LEFT(X,1)),'@l;
 99')
RETURN

*****************************************************************************
*                                                                           *
*                          Procedure   DMTOC                                *
*                                                                           *
*****************************************************************************
PROCEDURE DMTOC
PARAMETERS X
X = CHR(VAL(RIGHT(X,2)))+CHR(VAL(LEFT(X,2)))
RETURN


