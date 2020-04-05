Parameter tx
Return iif(m.win, iif(isNull(m.tx), '', Strt(CPConvert(1251, 866, m.tx), chr(141), 'H')), m.tx)