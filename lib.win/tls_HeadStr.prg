* выделение из строки первого из списка элементов,
* разделенных символом tcSep (default=',')
* в tcStr остается хвост
lparameters tcStr, tcElem, tcSep
local lnPos, lcSep
lcSep=iif(empty(tcSep) and tcSep<>EOL,c_Comma,tcSep)
lnPos=at(lcSep, tcStr)
if lnPos=0
  tcElem=tcStr
  tcStr=''
else
  tcElem=left(tcStr, max(lnPos-1, 0))
  tcStr=iif(lnPos+len(lcSep)>len(tcStr),'',substr(tcStr, lnPos+len(lcSep)))
endif
return
