:-use_module(library(clpfd)).
:-use_module(library(lists)).
:- include('statistics.pl').
:- use_module(library(clpfd)).

matrix_rotated(Xss, Zss) :-
   transpose(Xss, Yss),
   maplist(reverse, Yss, Zss).

/* MIEIC/FEUP - Progamação em Lógica:
*	Manuel Curral
*	Nelson Costa
*   Iniciação: executar o comando magicSnail(8,[1,2,3],M)
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
    rotate(XS, RR),
    spiral(RR, Sp),
    append(X, Sp, FSp).

length_list(N, L) :-
   length(L, N).

n_matrix(N, Xss) :-
   length(Xss, N),
   maplist(length_list(N),Xss).
      
flatten(Matrix,FlatMatrix):-
labeling([],[FlatMatrix]),
write(FlatMatrix).

rowN([H|_],1,H).
rowN([_|T],I,X) :-
    I1 is I-1,
    rowN(T,I1,X).

magicSnail2(N,Keys,Matrix):-
	n_matrix(N, Matrix),
	spiral(Matrix,SpiralList),
	%dominio
	length(Keys,LengthKeys),
	domain(SpiralList,0,LengthKeys),
	%Restricoes
			%restricao da linha
	checkMatrix(Matrix,Keys),
	%restições
	transpose(Matrix,MatrixT),
	checkMatrix(MatrixT,Keys),
	%seq(SpiralList, Keys, Keys),
	reverse(SpiralList, RevSpiralList),
	%restrições de sequência
	makeSequence(SpiralList),
	%labeling
	labeling([],RevSpiralList),
	%display
	displayMatrix(Matrix), nl, nl,
	write(SpiralList).
	%write(Matrix).
	displayMatrix([Lin|Ls]):-
		write(Lin),
		nl,
		displayMatrix(Ls).
	displayMatrix([]).

	run:- length(Vars,25),
		domain(Vars, 0 , 3),
		size #>= Vars+2,
		labeling([],Vars),
		write(Vars).

%isolar uma coluna e usar o global_cardinality para
/*checkRow(R):-
	global_cardinality(Vars, [0-X,1-1, 2-1, 3-1]),*/
verificaRestricao(M):-
	checkMatrix(M),
	checkMatrix(transpose(M)).

checkMatrix([Linha|Ls],Keys):-
	checkRow(Linha,Keys),
	checkMatrix(Ls,Keys).

checkMatrix([],_).
	/*R #= R+1,
	checkColumn(C,)
	R<Size.*/

% dá/gera a lista das keys para associar ao global_cardinaly sem o 0
numCard(Keys,List):-
  	findall(Key-1, member(Key,Keys), List).

%gera o argumento completo para associar ao global_cardinaly!
numCard0(N,Keys,List):-
	 numCard(Keys,ListProv),
	 length(Keys, LengthKey),
	 NumberZeros is N - LengthKey,
	 List=[0-NumberZeros|ListProv].

checkRow(R,Keys):-
length(R, N),
numCard0(N,Keys,List),
global_cardinality(R, List). %[1-1, 2-1, 3-1,0-TamanhoDaLinhaMenosTamanhoDaChave]),

makeSequence(Vars):-
	automaton(Vars,
		[source(a), sink(a)],
		[arc(a, 0, a),
		 arc(a, 1, b),
		 arc(a, 2, f),
		 arc(a, 3, f),
		 arc(b, 0, b),
		 arc(b, 1, f),
		 arc(b, 2, c),
		 arc(b, 3, f),
		 arc(c, 0, c),
		 arc(c, 1, f),
		 arc(c, 2, f),
		 arc(c, 3, a)]).
/*
countletras(X) :-
    findall(N, letra(N), Ns),
    length(Ns, X).*/
%checkColumn(C):-

%Máquinas de estados
/*reconhece(A):-
	inicial(N),
	transicao().*/

%split(Vars, 
%spiral(Vars
	/* LISTA 	TODOS OS ELEMENTOS: Sequencia ABC
		Lista-> matriz converete predicado.
				labeling listas
				sudoku para matriz
	*/