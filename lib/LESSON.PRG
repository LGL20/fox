*!*	typedef struct _TASK_LIST {
*!*	    CHAR        ProcessName[PROCESS_SIZE];
*!*	    CHAR        WindowTitle[TITLE_SIZE];
*!*	    HANDLE      hwnd;
*!*	    DWORD       dwProcessId;
*!*	    DWORD       dwInheritedFromProcessId;
*!*	} TASK_LIST, *PTASK_LIST
*Ñì. â òåêñòå
*Ïî÷åìó äëÿ ïîëó÷åíèÿ stitle íàäî ñìåñòèòüñÿ íà 5 âïðàâî - íå çíàþ - ïîäáîð.
*È íå ñîâñåì ïîíÿòíà ñèòóàöèÿ ñ ÷åòâåðòûì ïàðàìåòðîì (dwProcessId) - 
*â Ñè-ïðîãðàììå îí ïîëó÷àåòñÿ îòðèöàòåëüíûì, íó è áîã ñ íèì.
*Âåðîÿòíî âñåãî, åñëè ñòàðøèé áàéò=FF (èëè íóëåâîé áèò=1) ôóíêöèÿ ïðåîáðàçîâàíèÿ str to long
*äîëæíà áûòü äðóãàÿ - íàäî áóäåò èçó÷èòü âîïðîñ ôîðìèðîâàíèÿ îòðèöàòåëüíûõ ÷èñåë.
*Êîãäà-òî ÿ âñòðå÷àëñÿ ñ ýòèì, íî çàáûë.

#define MAX_PATH        	256
#define TITLE_SIZE          64
#define PROCESS_SIZE        MAX_PATH
#define STRUCTURE_SIZE      336
#define HWND_NULL			space(4)

declare integer GetProcessList in process STRING
s1=space(STRUCTURE_SIZE*MAX_PATH)
NumTasks=GetProcessList(@s1)
j=1
for i=1 to NumTasks
	str1=substr(s1,j,STRUCTURE_SIZE)
	sname=left(str1,PROCESS_SIZE)
	sname=iif( at(chr(0),sname)>0 ,left(sname,at(chr(0),sname)-1),sname)
	stitle=substr(str1,PROCESS_SIZE+1+4,TITLE_SIZE)
	stitle=iif(at(chr(0),stitle)>0,left(stitle,at(chr(0),stitle)-1),stitle)
	hwnd=substr(str1,PROCESS_SIZE+1+4+TITLE_SIZE,4)
	hwnd=iif(hwnd=HWND_NULL,0,strtolong(hwnd))
	dwProcessId=strtolong(substr(str1,PROCESS_SIZE+1+4+TITLE_SIZE+4,4))
    dwFromProcessId=substr(str1,PROCESS_SIZE+1+4+TITLE_SIZE+4+4,4)
	dwFromProcessId=iif(dwFromProcessId=HWND_NULL,0,strtolong(dwFromProcessId))
	?sname
	?stitle
	?hwnd,dwProcessId,dwFromProcessId
	j=j+STRUCTURE_SIZE
endfor
clear dlls
return
*********************************************
funct strtolong(pstr)
return asc(substr(pstr,1,1))+asc(substr(pstr,2,1))*256+;
		asc(substr(pstr,3,1))*256*256+asc(substr(pstr,4,1))*256*256*256
*********************************************
