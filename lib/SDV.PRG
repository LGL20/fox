Para m.word,i,sdvig
x=asc(Subs(m.word,i,1))+sdvig
m.word=Stuf(m.word,i,1,chr(x+iif(x>255, -255, iif(x<1, 255, 0))))
Retu m.word
