Parameter tx
Return iif(m.win, iif(isNull(m.tx), '', Chrt(CPConvert(866, 1251, m.tx), 'po', '��')), m.tx)
