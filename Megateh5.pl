tabuleiro(u,i):=
	[
	 [-,-,-,-],
	 [-,-,-,-],
	 [-,-,-,-],
	 [-,-,-,-]
	];
printRow([]).

/*predicados de impressão de Tabuleiros*/
%impressão de jogos para a consola
P_m([]).
%alguma coisa para imprimir .. e resto do tabuleiro
P_m([L|T]):-
 P_l(L),
 P_m(T). %apresentação do código para representação do jogo.. correr o predicado para estes 3 arg.
 
 %passámos para a linha seguinte
 P_l([]):-nl.
 P_l([c|T]):-
 write(C),write('|'),
 P_L(T).
 
 Print_horizontal([]):-
 N > 0,
 N2-N1>0,
 Print_horizontal().
 