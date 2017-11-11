dados(um).
dados(dois).
dados(tres).

cut_teste_a(X) :-
	dados(X).
cut_teste_a('ultima_clausula').
%?- cut_teste_a(x), write(X), nl, fail.

cut_teste_b(X) :-
	dados(X), !.
cut_teste_b('ultima_clausula').

cut_teste_c(X,Y) :-
	dados(X),
	!,
	dados(Y).
cut_teste_c('ultima_clausula').


max(X, Y, Z, X):- X>Y, X>Z, !.  % caso de  quando o X é o maior
max(X, Y, Z, Y):- Y>X, Y>Z, !.	% caso de  quando o Y é o maior
max(_, _, Z, Z).				% caso de  quando o Z é o maior, ou X = Y (e sobra o Z, pois não passa as condições e fica falso e vai para a esquerda e para baixo etc!!!)


max2(X,Y,Z,X): - X>=Y, !.
max2(X,Y,Z,Y):-Y>=Z,!.
max2(_,_,Z,Z).



unificavel(L1,Termo, L2).
unificavel
