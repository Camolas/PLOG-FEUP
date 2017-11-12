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

display_board([],_):-
        write('        '), put37code(220), nl, nl,
        write('     '), write('      A         B         C         D '), nl.

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

display_board([Head|Tail],NumRows):- 
        write('    '), write('   ---------------------------------'),nl,
        write('        '),put37code(220),nl,
        write('    '), draw_empty_line([]), 
        write('  '), write(NumRows), draw_line(Head), nl,
        write('    '), draw_number_line(Head),
        NewNumRows is NumRows - 1,
        display_board(Tail, NewNumRows).

draw_empty_line([]):-
        write('   '), write('|'),write('        '),  
        write(' |'),write('        '), write(' |'),
        write('         '), write('|'), write('         '),
        write('|'), nl.


draw_number_line([]) :-
        write('   |    '),
        nl.

draw_number_line([Head|Tail]):-
        get_piece_height(Head, Level), 
        write('   |     '), write(Level),
        draw_number_line(Tail).


draw_line([]) :-
        write('    |    ').

draw_line([Head|Tail]) :-
        char(Head,S),
        write('    |    '), write(S), 
        draw_line(Tail).

get_piece_type(Char, Meaning):- char(Meaning,Char).

get_piece_height(Piece, Height):- height(Piece,Height).
