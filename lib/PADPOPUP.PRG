Parameter menu
Private i, n, pad
n=CntPad(m.menu)
for i=1 to m.n
	pad=GetPad(m.menu, m.i)
	Define Popup (m.pad) Margin Shadow
	On Pad (m.pad) of (m.menu) Activate Popup (m.pad)
endfor
