PARAMETERS F, K, PROG
R = REPLICATE('░',LEN(TITL))
= ALTON()
? SY+'г.'
?
? TITL
? R
DO P1
FOR I = 1 TO K
   ? LINE
   ? F(I)
ENDFOR
? R
? LINE
? FOOT
?
SET CONSOLE ON
CLOSE ALTERNATE
SET ALTERNATE OFF
DEFINE WINDOW OTCH FROM 0, 0 TO 23, MIN(263,MAX(LEN(TITL)+6,SCOLS()-1));
 GROW FLOAT SHADOW TITLES '' FOOTER ' Калькулятoр-F9   Закрасить-Shift';
+CHR(27)+CHR(26)+'   Запoмнить-Ctrl/C   Перенести-Ctrl/V ' COLOR N/W,N;
/W,N/W,W/N,W/N
DEFINE POPUP CALC
DEFINE BAR _MST_CALCU OF CALC PROMPT 'calc' KEY f9
SET SYSMENUS TO _MSM_WINDO
SET SYSMENUS ON
WAIT CLEAR
MODIFY FILES vrem.txt NOEDIT WINDOW OTCH
RELEASE WINDOW OTCH
RELEASE POPUP CALC
SET SYSMENUS TO DEFAULT
SET SYSMENUS OFF
SET HEADINGS OFF
L = K-1
P = 1
RESTORE FROM pri ADDITIVE
A(T) = M->RMAR
R = REPLICATE('░',M->RMAR)
DO WHILE MENU02('Печатать ? ')
   STORE '' TO PERF, CH_ON, CH_OFF, G, NG
   DO ESC_CODE
   SET CONSOLE OFF
   SET PRINTER ON
   ON ERROR Do er
   FOR I = 1 TO T
      ? PERF+''+G+SY+''+'г.'+NG
      IF T>1
         ?? '       Лист'+STR(I,2)
      ENDIF
      ?
      ? SUBSTR(TITL,P,A(I))
      ? R
      RR = SUBSTR(LINE,P,A(I))
      DO P2
      FOR J = 1 TO L
         ? RR
         ? CH_ON+PADR(SUBSTR(F(J),P,A(I)),M->RMAR,'_')+CH_OFF
      ENDFOR
      ? CH_OFF+RR
      ? SUBSTR(F(K),P,A(I))
      ? R
      ? RR
      ? SUBSTR(FOOT,P,A(I))
      ?
      ?
      P = A(I)+1
      IF I<T
         WAIT WINDOW 'Вставьте нoвый лист'
      ENDIF
   ENDFOR
   EJECT
   ON ERROR 
   SET PRINTER OFF
   SET CONSOLE ON
ENDDO
ERASE vrem.txt

*****************************************************************************
*                                                                           *
*                          Procedure   ER                                   *
*                                                                           *
*****************************************************************************
PROCEDURE ER
IF ERR()
   ERASE vrem.txt
   Retu to &prog
ENDIF
RETURN


