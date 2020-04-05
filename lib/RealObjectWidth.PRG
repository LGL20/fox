LParameter object
Local text
With m.object
	text = iif(Type('.Caption')="C", .Caption, iif(Type('.Value')="C", .Value, ''))
	Return RealTxtWidth(m.text, .FontName, .FontSize,;
		iif(.BackStyle=0, 'T', 'Q')+iif(.FontBold, 'B','')+iif(.FontItalic, 'I','');
		+iif(.FontOutline, 'O','')+iif(.FontShadow, 'S','')+iif(.FontStrikethru, '-','');
		+iif(.FontUnderline, 'U', ''))
EndWith