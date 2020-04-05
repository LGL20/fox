Para mon
Private b
decl b[12]
do mon_ukr with b
r=b[m.mon]
Retu PadC(iif(m.mon=11, m.r+'а', iif(m.mon=2, Strt(m.r,'ий','oгo'), Strt(m.r,'ень','ня'))),9)
