Parameter DocName
Private i, error, app, j
Store '' to app, i
Do GetApp with m.DocName, m.app, m.i
if !isNull(m.i)
	j = JustStem(m.DocName)
	error=.f.
	on_error=On('Error')
	On Error error=.t.
	i = iif(m.app="w", m.i.Documents(m.j), m.i.Workbooks(m.j))
	On Error &on_error
	if !m.error
		*j=TempName()
		*if m.i.ReadOnly
		*	m.i.SaveAs(m.j)
		*else
		*	m.i.Save
		*endif
		m.i.Saved=.t.
		m.i.Close
		Erase (m.j)
	endif
endif
