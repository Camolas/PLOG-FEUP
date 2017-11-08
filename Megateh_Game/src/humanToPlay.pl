humanTurn(Game,NextGame):-
       % repeat,
        get_pieceBoard(Game,PieceBoard),
        display_board(PieceBoard,4),
        display_actualInfo(Game),nl,
        ask_position(SrcRow,SrcCol),
        ask_piece(NewPiece),
        make_move(SrcRow,SrcCol,NewPiece,Game,NextGame),
        !.

ask_position(Row, Col):-
        write('Where do you want to put your piece? (e.g a1)'),nl,
        get_coords(Row, Col).

ask_piece(Piece):-
        write('And what piece? '),nl,
        read(Piece),
        get_return_key.

make_move(R,C,NP,G,NG):-
        write(R),
        write(C),
        write(NP),
        write(G),
        write(NG).
        