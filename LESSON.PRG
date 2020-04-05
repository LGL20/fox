*!*	typedef struct _TASK_LIST {
*!*	    CHAR        ProcessName[PROCESS_SIZE];
*!*	    CHAR        WindowTitle[TITLE_SIZE];
*!*	    HANDLE      hwnd;
*!*	    DWORD       dwProcessId;
*!*	    DWORD       dwInheritedFromProcessId;
*!*	} TASK_LIST, *PTASK_LIST
*См. в тексте
*Почему для получения stitle надо сместиться на 5 вправо - не знаю - подбор.
*И не совсем понятна ситуация с четвертым параметром (dwProcessId) - 
*в Си-программе он получается отрицательным, ну и бог с ним.
*Вероятно всего, если старший байт=FF (или нулевой бит=1) функция преобразования str to long
*должна быть другая - надо будет изучить вопрос формирования отрицательных чисел.
*Когда-то я встречался с этим, но забыл.

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
