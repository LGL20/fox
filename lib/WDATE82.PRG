Para date
date=Max(0, m.date-CtoD('30.12.1899'))
Retu chr((m.date-m.date%255)/255)+chr(m.date%255)
