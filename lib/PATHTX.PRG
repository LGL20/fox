Parameter PathLabel, txt
Private label, style, len, cut
label = PathLabel.FileName
style = iif(label.BackStyle=0, 'T', 'Q');
	+iif(label.FontBold, 'B','');
	+iif(label.FontItalic, 'I','');
	+iif(label.FontOutline, 'O','');
	+iif(label.FontShadow, 'S','');
	+iif(label.FontStrikethru, '-','');
	+iif(label.FontUnderline, 'U', '')
len = iif(PathLabel.autosize, PathLabel.MaxWidth, label.Width)
cut=.f.
Do While RealTxtWidth(m.txt, label.FontName, label.FontSize, m.style) > m.len
	txt = Stuff(m.txt, 1, 1, '')
	cut=.t.
EndDo
if m.cut
	len=At('\', m.txt)
	txt=Stuff(m.txt, 1, iif(m.len=0, 0, m.len-1), '...')
endif
if PathLabel.autosize
	label.Width = RealTxtWidth(m.txt, label.FontName, label.FontSize, m.style)
	PathLabel.Width = label.Width + label.Left*2
endif
label.Caption = m.txt
