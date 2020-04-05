
*****************************************************************************
*                                                                           *
*                          Procedure   TO_FILE                              *
*                                                                           *
*****************************************************************************
PROCEDURE TO_FILE
DEFINE WINDOW T FROM 20, 12 TO 22, 45 SHADOW DOUBLE COLOR N+/W
ACTIVATE WINDOW T
FLN = REPLICATE(' ',12)
@ 0, 0 SAY 'Введите имя файла ' GET FLN
READ
RELEASE WINDOW T
IF LEN(ALLTRIM(FLN))>0
   TYPE vrem.txt TO FILE &fln
ENDIF
RETURN

*****************************************************************************
*                                                                           *
*                          Procedure   ALTON                                *
*                                                                           *
*****************************************************************************
PROCEDURE ALTON
SET CONSOLE OFF
SET ALTERNATE TO vrem.txt
SET ALTERNATE ON
RETURN

PROCEDURE ALTOFF
PARAMETERS YY, XX
PRIVATE T
CLOSE ALTERNATE
SET ALTERNATE OFF
SET CONSOLE ON
DO WHILE .T.
   IF !MENU02('Печатать ?')
      EXIT
   ENDIF
   SET HEADINGS OFF
   SET CONSOLE OFF
   IF MENU02('Принтер ?')
      IF READY()
         TYPE TO PRINTER vrem.txt
      ENDIF
   ELSE
      DO TO_FILE
   ENDIF
   SET CONSOLE ON
ENDDO
DELETE FILES Vrem.txt
SET CONSOLE ON
RETURN


