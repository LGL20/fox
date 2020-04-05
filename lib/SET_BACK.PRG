Parameter priznak
if &priznak='ON'
	if Set(m.priznak)='OFF'
		Set &priznak ON
	endif
else
	if Set(m.priznak)='ON'
		Set &priznak OFF
	endif
endif
