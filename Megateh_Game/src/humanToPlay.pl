humanTurn(Game,NextGame):-
        repeat,
        get_pieceBoard(Game,PieceBoard),
        get_numPiecesBoard(Game, NPBoard),
        get_heightBoard(Game,HeightBoard),
        display_board(PieceBoard,4,NPBoard,HeightBoard),
        display_actualInfo(Game),nl,
        ask_position(Row, Col),
        ask_piece(NewPiece),
        move(Row,Col,NewPiece,Game,NextGame),
        !.

ask_position(Row, Col):-
        write('Where do you want to put your piece? (e.g a1)'),nl,
        get_coords(Row,Col).

ask_piece(Piece):-
        write('And what piece?'),nl,
        write('       f for flat'),nl,
        write('       h for holed'),nl,
        write('       ff for double-flat'),nl,
        write('       hh for double-holed.'),nl,
        repeat,
        read(TempPiece),
        parse_piece(TempPiece,Piece),
        get_return_key.

