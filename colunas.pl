printColumnIds(A, Max) :-	%case < 10
	M is Max + 1,
	A < M,
	A < 4,
	write('  '),
	write(A),
	write('  '),
	B is A + 1,
	printColumnIds(B, Max).