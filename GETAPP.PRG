Parameter DocName, app, docApp, open
Local ext
ext = Lower(JustExt(m.DocName))
app = iif(inList(m.ext, 'rtf', 'doc', 'dot'), "word", iif(m.ext='xls', "excel", ''))+'.Application'
docApp = iif(FindProcess(Strt(Strt(m.app, 'word', 'winword'), 'Application', 'exe'))>0,;
	GetOBJECT(, m.app), iif(m.open, CreateObject(m.app), null))
Return m.docApp