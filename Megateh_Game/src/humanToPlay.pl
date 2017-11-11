humanTurn(Game,NextGame):-
        repeat,
        get_pieceBoard(Game,PieceBoard),
        display_board(PieceBoard,4),
        display_actualInfo(Game),nl,
        ask_position(Row, Col),
        nl, write(Row), nl, write(Col),nl,
        ask_piece(NewPiece),
        move(Row,Col,NewPiece,Game,NextGame),
        !.

ask_position(Row, Col):-
        write('Where do you want to put your piece? (e.g a1)'),nl,
        get_coords(Col,Row).

ask_piece(Piece):-
        write('And what piece?'),nl,
        write('       f for flat'),nl,
        write('       h for holed'),nl,
        write('       dF for double-flat'),nl,
        write('       dH for double-holed.'),nl,
        read(Piece),
        get_return_key.

