Private col
if Type('m.years')="N"
	@ m.ran_row+1, 1 Get m.years Picture '@z 9999' Valid mb()
	col=10
else
	col=0
endif
@ m.ran_row, m.col+1 get m.d;
	Function '^n \<Месяц;\<Кваpтал;\<Пoлугoдие;\<Гoд;\<Диапазoн;\<Все даты;День';
	Valid ran_chm() and ran_vl() and mb()
col=m.col+15
@ m.ran_row, m.col get m.m from g function '^' 			when m.d=1 Valid mb()
@ m.ran_row, m.col get m.k function '^ I;II;III;IV'		when m.d=2 Valid mb()
@ m.ran_row, m.col get m.p size 1, 5 function '^ I;II' 	when m.d=3 Valid mb()
@ m.ran_row+1, m.col get m.bg when m.d=5 or m.d=7 Valid mb()
@ m.ran_row+1, m.col+11 get m.en when m.d=5 Valid mb()
