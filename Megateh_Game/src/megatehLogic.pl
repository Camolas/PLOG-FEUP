move(Row,Col,Piece,Game,NextGame):-
        get_actual_board(Game, PieceBoard, HeightBoard, NumPiecesBoard),
        check(Row,Col,Piece,PieceBoard,NumPiecesBoard),
        %nl, write('passed the test'), nl,
        put_piece(Row,Col,Piece,
                  PieceBoard, HeightBoard, NumPiecesBoard,
                  NextPieceBoard, NextHeightBoard, NextNumPiecesBoard),
        nl, write('piece put'), nl,
        update_piece_info(Game, Piece, GameInfo),
        %nl, write('info updated'), nl,
        set_pieceBoard(GameInfo, NextPieceBoard, GameInfoP),
        %nl, write(NextPieceBoard), nl,
        set_heightBoard(GameInfoP, NextHeightBoard, GameInfoPH),
        %nl, write(NextHeightBoard), nl,
        set_numPiecesBoard(GameInfoPH, NextNumPiecesBoard, GameInfoPHNP),
        %nl, write(NextNumPiecesBoard), nl,
        change_player(GameInfoPHNP, NextGame).

get_actual_board(Game, PieceBoard, HeightBoard, NumPiecesBoard):-
        get_pieceBoard(Game, PieceBoard),
        get_heightBoard(Game, HeightBoard),
        get_numPiecesBoard(Game, NumPiecesBoard).

check(R,C,P,Pb,NPb):-
        check_type(R,C,P,Pb),
        check_number(R,C,NPb).

check_type(R,C,P,Pb):-
        (P == 'h' ; P == 'f' ; P =='dF' ; P == 'dH'),
        search_board(R,C,Pb,PieceThere),
        PieceThere \= 'dF',
        PieceThere \= 'dH'.


check_number(R,C,NPb):-
        search_board(R,C,NPb,HowManyThere),
        HowManyThere < 2.

put_piece(Row,Col,Piece,
          PieceBoard, HeightBoard, NumPiecesBoard,
          NextPB, NextHB, NextNPB):-
        
                get_piece_type(Piece,Type),
                get_piece_height(Type, PieceHeight),
                
                
                search_board(Row, Col, HeightBoard, ActualHeight),
                NextHeight is ActualHeight + PieceHeight,
                
                search_board(Row, Col, NumPiecesBoard, ActualNum),
                NextNum is ActualNum + 1,
                
                change_cell(Row, Col, PieceBoard, Type, NextPB),
                change_cell(Row, Col, HeightBoard, NextHeight, NextHB),
                change_cell(Row, Col, NumPiecesBoard, NextNum, NextNPB).
        
        
        
        