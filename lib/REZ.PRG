Para text
if m.fou
	do Show0 in edi
else
	if !m.mute
		Set Bell to 180,1
		?? CHR(7)
		Set Bell to
		@ 0,52 Say " "+PadL(m.text,9)+" дoкумент " Colo w+/rb
	endi
	Go m.rec
endi
