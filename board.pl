/* -*- Mode:Prolog; coding:iso-8859-1; indent-tabs-mode:nil; prolog-indent-width:8; prolog-paren-indent:3; tab-width:8; -*- */

:- use_module(library(lists)).


%:- include('Interfaces.pl').
% Get piece from board
%	      +      +      +      -
getPiece(Row, Column, Board, Piece):-
	nth1(Row, Board, R),
	nth1(Column, R, Piece).
getPiece([Row,Col], Board, Piece) :- getPiece(Row, Col, Board, Piece).

pos(empty).
pos(flat).
pos(hole).
pos(flat_2).
pos(hole_2).

symb(empty,' ').
symb(flat, 'f').
symb(hole, 'h').
symb(flat_2,'ff').
symb(hole_2, 'hh').
 

initial_board([
                [empty, empty,empty, empty],
                [empty, empty,empty, empty],
                [empty, empty,empty, empty],
                [empty, empty,empty, empty]
             ]).

final_board([
               [empty, empty,empty, empty],
               [hole, hole,hole, hole],
               [empty, empty,empty, empty],
               [empty, empty,empty, empty]
            ]).

draw_board([],_):-
        write('   ---------------------------------').

draw_line([]) :-
        write('   |   ').

draw_line([H|T]) :-
        symb(H,S),
        write('   |   '), write(S), 
        draw_line(T).

draw_board([H|T],Num):- 
        write('   ---------------------------------'),nl,
        draw_line(H), nl,
        Next_num is Num - 1,
        draw_board(T,Next_num).

megateh:-displayColumns,initial_board(B), draw_board(B,4).
megatehf:-final_board(B), draw_board(B,4).



displayColumns :- 
write('   '),put_code(218),sizehozletter,sizehozletter,sizehozletter,sizehozletter,sizehozletter,put_code(191),
nl,put_code(179),write('   a      b      c      d   '),put_code(179),nl,nl.

sizehozletter :- put_code(196),put_code(196),put_code(196),put_code(196),put_code(196),put_code(196).
