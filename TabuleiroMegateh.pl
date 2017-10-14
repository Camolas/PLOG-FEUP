getPeca(Tabuleiro, Nlinha, NCol, Peca) :-
	getElePos(NLinha, Tabuleiro, Linha),
	getElePos(NCol, Linha, Peca).

/* nLinha e nCol são decrementados a cada chamada. */

getElePos(1, [Elemento|_], Elemento).

getElePos(Pos, [_|Resto], Elemento) :-
	Pos > 1,
	Next is Pos-1,
	getElePos(Next, Resto, Elemento).

%--------------------------------------------------------------

setPeca(TabIn, NLinha, NCol, Peca, TabOut) :-
	setNaLinha(NLinha, TabIn, NCol, Peca, TabOut).

setNaLinha(1, [Linha|Resto], NCol, Peca, [NovaLinha|Resto]):-
	setNaColuna(NCol, Linha, Peca, NovaLinha).

setNaLinha(Pos, [Linha|Resto], NCol, Peca, [Linha|NovoResto]):-
	Pos > 1,
	Next is Pos-1,
	setNaLinha(Next, Resto, NCol, Peca, NovaLinha).

setNaColuna(1, [_|Resto], Peca, [Peca|Resto]).

setNaColuna(Pos, [X|Resto], Peca, [X|NovoResto]):-
	Pos > 1,
	Next is Pos-1,
	setNaColuna(Next, Resto, Peca, NovoResto).


%--------------------------------------------------------------
/* Usar biblioteca de listas */
:-use_module(library(lists)).
/*
- nth1?
- nth1(2,[a,b,c],X).
	X = b
- nth0(2,[a,b,c],X).
	X = c */

%---------------------------------------------------------------
printBoard(Board) :-
	
	printBorders,
	printRowByRow(Board),
	printBlackLine.

printBlackLine :-
	nl,
	write('---------------------'),
	nl.

printRowByRow([]).
printRowByRow([Line|Rest]) :-
	put_code(186),
	printSingleRow(Line),
	printRowByRow(Rest),
	put_code(186).

printDelimiters(x):-write(X),nl,write('|'),
read(X),write(X), %"bla"  [98,109,97]
get_code(X),get_char(Y),
put_code(X),put_char(Y). %get code e get_char
	
printSingleRow([Cell]):-
	write(Cell),
	write('|'),
	printBlackLine.

printSingleRow([Cell|More]):-
	write(Cell),
	write('|'),
	printSingleRow(More).
	
printBorders :- put_code(201),boardesign,boardesign, nl.

boardesign:-put_code(218),hdesign,hdesign,put_code(191).
/*
hdesign:- put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(196),put_code(223),put_code(223),put_code(223).
*/
hdesign:- put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(205),put_code(196),put_code(223),put_code(223),put_code(223).
/*put_code(223),put_code(223),
put_code(220),put_code(220),put_code(178),put_code(219),put_code(196),put_code(220),put_code(220).*/