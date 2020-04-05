Para m.word
Private All
m.word=Allt(m.word)
len=Len(m.word)
if m.len=0
	Return ''
endif
word=towin(m.word)
begin=one_(Righ(m.word,1))-1
m.word=Stuf(m.word, 1, m.begin,'')+Left(m.word, m.begin)
Store 0 to sdvig1, sdvig2, sdvig3, zamena1, zamena2
Do param with m.word
vstavka3=sdv(Righ(m.word,1),1,sdvig2)
vstavka1=one_(vstavka3)
vstavka2=Max(one_(Left(m.word,1)),2)
for i=vstavka1 to Len(m.word) step vstavka2
	m.word=Stuf(m.word,i,0,vstavka3)
endfor
len=Len(m.word)
sign=1
if begin=0
	do sdvig
	do zamena
else
	do zamena
	do sdvig
endi
Return m.word
