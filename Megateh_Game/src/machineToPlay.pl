machineTurn(Game,NextGame):-
        repeat,
        get_pieceBoard(Game,PieceBoard),
        display_board(PieceBoard,4),
        display_actualInfo(Game),nl,
        random(0,3,Row),
        random(0,3,Col),
        write([Row,Col]),
        get_machine_piece(TempPiece),
        parse_piece(TempPiece,Piece),
        nl,write(Piece),nl,
        move(Row,Col,Piece,Game,NextGame),
        !.

get_machine_piece(Piece):-
        random(0,3,Random),
        repeat,
        generate_piece(Random,Piece),
        !.

generate_piece(Random,f):-
        Random == 0.

generate_piece(Random,h):-
        Random == 1.

generate_piece(Random,ff):-
        Random == 2.

generate_piece(Random,hh):-
        Random == 3.
