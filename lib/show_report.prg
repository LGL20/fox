Parameter report
*Private temp
*temp='w'+Sys(3)
*Define Window (m.temp) from 0,0 to 40,100 System Close Grow Float Zoom Minimize Title ''
Wait Clear
*main.WindowState=2
REPORT FORM (m.report+'.frx') NOEJECT Preview NoConsole
* Window (m.temp)
*main.WindowState=0
*Release Window (m.temp)
