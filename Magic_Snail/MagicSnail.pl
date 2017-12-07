%   isEmpty(+M)
% Aplica-se apenas quando M não contém nenhum elemento.
isEmpty([]).
isEmpty([[]|XS]) :- isEmpty(XS).

%   split(+M, Col, Rest)
% Divide a matriz na primeira coluna e no resto.
split([], [], []).
split([[X|XS]|XSS], [X|C], [XS|R]) :-
    split(XSS, C, R).

%   splitRev(+M, RCol, Rest)
% Divide a matriz na primeira coluna (na ordem inversa) e no resto.
splitRev(M, C, R) :- splitRev(M, [], C, R).

splitRev([], A, A, []).
splitRev([[X|XS]|XSS], A, A2, [XS|R]) :-
    splitRev(XSS, [X|A], A2, R).

%   rotate(+M, RM)
% Gira a matriz 90 ° no sentido horário.
rotate(XS, []) :- isEmpty(XS).
rotate([X|XS], [C|MR]) :-
    splitRev([X|XS], C, R),
    rotate(R, MR).

%   spiral(+M, R)
% Localiza todos os elementos na espiral da matriz.

spiral(M, []) :- isEmpty(M).
spiral([X|XS], FSp) :-
    split([X|XS], C, R),
    rotate(R, RR),
    spiral(RR, Sp),
    append(C, Sp, FSp).


length_list(N, L) :-
   length(L, N),
   domain(L,0,N).
.

n_matrix(N, Xss) :-
   length(Xss, N),
   maplist(length_list(N),Xss).

maplist(_, []).
maplist(C, [X|Xs]) :-
   call(C,X),
   maplist(C, Xs).
   
   proj(N,Seq,Initial):-
   n_matrix(N,Matrix),
   
flatten(Matrix,FlatMatrix):-
labeling([],[FlatMatrix]),
write(FlatMatrix).

//fourQuenns
   
teste:-
	tab(L),
	spiral(L,L2),
	write(L2).
	
