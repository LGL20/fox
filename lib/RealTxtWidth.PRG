Parameter txt, font, size, style
do defa with m.style, ''
Return TXTWIDTH(m.txt, m.font, m.size, m.style)*FONTMETRIC(6, m.font, m.size, m.style)
*/FONTMETRIC(6)