Parameter dop, menu
Do defa with m.dop, ''
Do defa with m.menu, 'm'
DEFINE PAD MON OF (m.menu) PROMPT SAY_MYR() MESSAGE ' �롮� ⥪�饣� ���� � �����';
	&dop COLOR ,B/W,,,B/W,w+/b
ON SELECTION PAD MON OF (m.menu) do monss
