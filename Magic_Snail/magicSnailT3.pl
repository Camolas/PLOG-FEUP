:-use_module(library(clpfd)).
:-use_module(library(lists)).

/* MIEIC/FEUP - Progamação em Lógica:
*	Manuel Curral
*	Nelson Costa
*   Iniciação: executar o comando magicSnail(8,[1,2,3],M)
*/

%   isEmpty(+M)
% Platí právě když M neobsahuje žádné prvky.
isEmpty([]).
isEmpty([[]|XS]) :- isEmpty(XS).

%   split(+M, Col, Rest)
% Rozdělí matici na první sloupec a zbytek.
split([], [], []).
split([[X|XS]|XSS], [X|C], [XS|R]) :-
    split(XSS, C, R).

%   splitRev(+M, RCol, Rest)
% Rozdělí matici na první sloupec (v opačném pořadí) a zbytek.
splitRev(M, C, R) :- splitRev(M, [], C, R).

splitRev([], A, A, []).
splitRev([[X|XS]|XSS], A, A2, [XS|R]) :-
    splitRev(XSS, [X|A], A2, R).

%   rotate(+M, RM)
% Otočí matici o 90° ve směru hodinových ručiček.
rotate(XS, []) :- isEmpty(XS).
rotate([X|XS], [C|MR]) :-
    splitRev([X|XS], C, R),
    rotate(R, MR).

%   spiral(+M, R)
% Nalezne všechny prvky na spirále matice.
spiral(M, []) :- isEmpty(M).
spiral([X|XS], FSp) :-
    split([X|XS], C, R),
    rotate(R, RR),
    spiral(RR, Sp),
    append(C, Sp, FSp).

length_list(N, L) :-
   length(L, N).

n_matrix(N, Xss) :-
   length(Xss, N),
   maplist(length_list(N),Xss).

maplist2(_, []).
maplist2(C, [X|Xs]) :-
   call(C,X),
   maplist(C, Xs).
      
flatten(Matrix,FlatMatrix):-
labeling([],[FlatMatrix]),
write(FlatMatrix).

rowN([H|_],1,H).
rowN([_|T],I,X) :-
    I1 is I-1,
    rowN(T,I1,X).

magicSnail(N,Keys,Matrix):-
	n_matrix(N, Matrix),
	transpose(Matrix,MatrixT),
	spiral(MatrixT,SpiralList),
	%dominio
	length(Keys,LengthKeys),
	domain(SpiralList,0,LengthKeys),
	%Restricoes
			%restricao da linha
	checkMatrix(Matrix,Keys),
	%restições
	
	checkMatrix(MatrixT,Keys),
	%seq(SpiralList, Keys, Keys),
	reverse(SpiralList, RevSpiralList),
	%restrições de sequência
	makeSequence(SpiralList),
	%labeling
	labeling([],SpiralList),
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

seq(Vars,[],Ar2):- length(Vars,L),(count(0,Vars,#=,L) #\/ seq(Vars,Ar2,Ar2)). 
seq([Hvars | Tvars], [Hargs | Targs], Array2):-
	((Hvars #= 0 #/\ NewArray #= [Hargs | Targs]) #\/
	(Hvars #= Hargs #/\ NewArray #= Targs)),
	seq(Tvars, NewArray,Array2).

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