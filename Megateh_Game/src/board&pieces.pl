piece(flat).
piece(holed).
piece(doubleFlat).
piece(doubleHoled).
piece(empty).

char(flat,'f').
char(holed, 'h').
char(doubleFlat, 'F').
char(doubleHoled, 'H').
char(empty, ' ').

mainType(flat,flatMain).
mainType(doubleFlat,flatMain).
mainType(holed,holedMain).
mainType(doubleHoled,holedMain).
mainType(empty,empty).


height(empty,0).
height(flat,1).
height(holed,1).
height(doubleFlat,2).
height(doubleHoled,2).


char_number('a',0).     %char_number('A',0).

char_number('b',1).     %char_number('B',1).

char_number('c',2).     %char_number('C',2).

char_number('d',3).     %char_number('D',3).

char_number(_,10).

number_char(Number,Char):- char_number(Char,Number).


empty_board([[empty,empty,empty,empty],
             [empty,empty,empty,empty],
             [empty,empty,empty,empty],
             [empty,empty,empty,empty]
            ]).

empty_height([[0,0,0,0],
              [0,0,0,0],
              [0,0,0,0],
              [0,0,0,0]
             ]).

empty_numPieces([[0,0,0,0],
                 [0,0,0,0],
                 [0,0,0,0],
                 [0,0,0,0]
                ]).



put2code(Code):-
    put_code(Code),put_code(Code).

put4code(Code):-
    put2code(Code),put2code(Code).

put8code(Code):-
    put4code(Code),put4code(Code).   

put16code(Code):-
    put8code(Code),put8code(Code).

put32code(Code):-
    put16code(Code),put16code(Code).
            
put37code(Code):-
        put32code(Code),put4code(Code),put2code(Code),put_code(Code).

display_board([],_,_,_):-
        write('        '), put37code(220), nl, nl,
        write('     '), write('      A         B         C         D '), nl.

display_board([Head|Tail],NumRows, [HeadNP|TailNP], [HeadH|TailH]):- 
        %write('    '), write('   ---------------------------------'),nl,
        write('        '),put37code(220),nl,
        write('    '), draw_empty_line([]), 
        write('  '), write(NumRows), draw_line(Head), nl,
        write('       '), draw_number_line(HeadNP,HeadH),
        NewNumRows is NumRows - 1,
        display_board(Tail, NewNumRows, TailNP, TailH).

draw_empty_line([]):-
        write('   '), write('|'),write('        '),  
        write(' |'),write('        '), write(' |'),
        write('         '), write('|'), write('         '),
        write('|'), nl.


draw_number_line([], []) :-
        write('|    '),
        nl.

draw_number_line([Head|Tail],[HeadH|TailH]):-
    
        write('| '), write(Head),write('     '),write(HeadH),write(' '),
        draw_number_line(Tail,TailH).


draw_line([]) :-
        write('    |    ').

draw_line([Head|Tail]) :-
        char(Head,S),
        write('    |    '), write(S), 
        draw_line(Tail).

get_piece_type(Char, Meaning):- char(Meaning,Char).

get_piece_height(Piece, Height):- height(Piece,Height).
