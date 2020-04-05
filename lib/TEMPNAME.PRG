Parameter ext
Return SYS(2023)+'\'+Sys(2015)+'.'+iif(Empty(m.ext), 'tmp', m.ext)
