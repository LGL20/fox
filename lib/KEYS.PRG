*	ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
*	³ 				  		KEYS		   				³
*	ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Para m.last
Do Case
Case m.last	= 1
	Keyb "{Home}" Plain
Case m.last	= 6
	Keyb "{End}" Plain
Case m.last	= 18
	Keyb "{PgUp}" Plain
Case m.last	= 3
	Keyb "{PgDn}" Plain
Case inList (m.last, 4, 5)
	Keyb "{UpArrow}" Plain
Case inList (m.last, 19, 24, 9)
	Keyb "{DnArrow}" Plain
EndCase
