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
    rotate(XS, RR),
    spiral(RR, Sp),
    append(X, Sp, FSp).
/*	
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
    append(C, Sp, FSp).*/


length_list(N, L) :-
   length(L, N).

n_matrix(N, Xss) :-
   length(Xss, N),
   maplist(length_list(N),Xss).

maplist2(_, []).
maplist2(C, [X|Xs]) :-
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
   /*
tabuleiro(Size):-
	size #= 5,
	L=[length(Vars,Size)],
	[length(Vars2,Size)],
	[length(Vars3,Size)],
	[length(Vars4,size)],
	[length(Vars5,size)]].*/



   
teste(size):-%teste:-
	
	L=[tabuleiro],% tab(L)
	transpose(L,LT),
	spiral(LT,L2),
	write(L2).
	
magicSnail(N,Keys,Matrix):-
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
		
		
letra(0 , X).
letra(1 , A).
letra(2 , B).
letra(3 , C).

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
	
/*
	
	launch(SizeBoard, NumTrees) :-
	printLegend,
	write('Generator started'), nl, nl, 
	generatePuzzle(SizeBoard, NumTrees, Trees, RowTents, ColTents),
	write('Solver started'), nl, 
	solvePuzzle(SizeBoard, NumTrees, Trees, RowTents, ColTents).*/

	%continuedList(Vars, List) :-

