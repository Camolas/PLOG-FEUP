humanTurn(Game,NextGame):-
        
        get_pieceBoard(Game,PieceBoard),
        get_numPiecesBoard(Game, NPBoard),
        get_heightBoard(Game,HeightBoard),
        display_board(PieceBoard,4,NPBoard,HeightBoard),
        repeat,
        display_actualInfo(Game),nl,
        ask_position(Row, Col),
        ask_piece(NewPiece),
        move(Row,Col,NewPiece,Game,NextGame),
        !.

ask_position(Row, Col):-
        write('Where do you want to put your piece?'),nl,
        write('Row: '),
        read(TempRow),
        get_return_key,
        write('Col: '),
        get_col(Col),
        Row is 4 - TempRow,
        parse_position(Row,Col).

ask_piece(Piece):-
        write('And what piece?'),nl,
        write('       f for flat'),nl,
        write('       h for holed'),nl,
        write('       ff for double-flat'),nl,
        write('       hh for double-holed.'),nl,
        read(TempPiece),
        parse_piece(TempPiece,Piece),
        get_return_key.

