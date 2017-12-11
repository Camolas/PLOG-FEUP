:-use_module(library(clpfd)).
:-use_module(library(lists)).

/* MIEIC/FEUP - Progamação em Lógica:
*	Manuel Curral
*	Nelson Costa
*   Iniciação: executar o comando teste
*/


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

%Vars=[A,B,C,X].


		

		

%   rotate(+M, RM)
% Gira a matriz 90 ° no sentido horário.
rotate(XS, []) :- isEmpty(XS).
rotate([X|XS], [C|MR]) :-
    splitRev([X|XS], C, R),
    rotate(R, MR).
	
rotate2(XS, []) :- isEmpty(XS).
rotate2([X|XS], [C|MR]) :-
split([X|XS], C, R),
rotate2(R, MR).

%   spiral(+M, R)
% Localiza todos os elementos na espiral da matriz.

spiral(M, []) :- isEmpty(M).
spiral([X|XS], FSp) :-
    split([X|XS], C, R),
    rotate(R, RR),
    spiral(RR, Sp),
    append(C, Sp, FSp).
	
spiral(M, []) :- isEmpty(M).
spiral([X|XS], FSp) :-
    rotate(R, RR),
	reverse(RR,RR2),
	split([X|XS], C, R),
    spiral(RR, Sp),
    append(C, Sp, FSp).
	
	
spiral2(M, []) :- isEmpty(M).
spiral2([X|XS], FSp) :-
    split([X|XS], C, R),
    rotate2(R, RR),
    spiral2(RR, Sp),
    append(C, Sp, FSp).


length_list(N, L) :-
   length(L, N),
   domain(L,0,N).

n_matrix(N, Xss) :-
   length(Xss, N),
   maplist(length_list(N),Xss).

maplist(_, []).
maplist(C, [X|Xs]) :-
   call(C,X),
   maplist(C, Xs).
   
   %proj(N,Seq,Initial):-
   %n_matrix(N,Matrix),
   
flatten(Matrix,FlatMatrix):-
labeling([],[FlatMatrix]),
write(FlatMatrix).

%//fourQuenns
tab(L):-
L=[[1,2,3,4,5],
	[6,7,8,9,10],
	[11,12,13,14,15],
	[16,17,18,19,20],
	[21,22,23,24,25]].
  
%ordem( , ):-  
   
%row([],[],[]).
rowN([H|_],1,H).
rowN([_|T],I,X) :-
    I1 is I-1,
    rowN(T,I1,X).

teste2:-
	tab(L),
	spiral2(L,L2),
	write(L2).
   
teste:-
	
	tab(L),
	transpose(L,LT),
	spiral(LT,L2),
	write(L2).
	
	run:- length(Vars,25),
		domain(Vars, 0 , 3),
		labeling([],Vars),
		write(Vars).
		
		
letra(0 , X).
letra(1 , A).
letra(2 , B).
letra(3 , C).
	
%split(Vars, 
%spiral(Vars
	/* LISTA 	TODOS OS ELEMENTOS: Sequencia ABC
		Lista-> matriz converete predicado.
				labeling listas
				
				sudoku para matriz
	*/
	
/*
	
	launch(SizeBoard, NumTrees) :-
	printLegend,
	write('Generator started'), nl, nl, 
	generatePuzzle(SizeBoard, NumTrees, Trees, RowTents, ColTents),
	write('Solver started'), nl, 
	solvePuzzle(SizeBoard, NumTrees, Trees, RowTents, ColTents).*/
