ask_Size(Piece):-
        write('And what piece?'),nl,
        write('       write a algarism'),nl,
        read(TempPiece),
        parse_piece(TempPiece,Piece),
        get_return_key.

write("DISPLAY THE PUZZLE").

displayPuzzle(P) :-
		repeat,
		write('Puzzle size:'),nl,
		once(getInt(N)),
		