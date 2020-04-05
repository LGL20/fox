Parameter DtTm
Return dt28C(Left(m.DtTm, 2));
	+' '+Tran(asc(Subs(m.DtTm, 3, 1)), '@l 99');
	+':'+Tran(asc(Subs(m.DtTm, 4, 1)), '@l 99');
	+':'+Tran(asc(Subs(m.DtTm, 5, 1)), '@l 99')
	