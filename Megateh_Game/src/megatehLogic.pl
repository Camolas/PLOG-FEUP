move(Row,Col,Piece,Game,NextGame):-
        get_actual_board(Game, PieceBoard, HeightBoard, NumPiecesBoard),
        check(Row,Col,Piece,PieceBoard,NumPiecesBoard),
        put_piece(Row,Col,Piece,
                  PieceBoard, HeightBoard, NumPiecesBoard,
                  NextPieceBoard, NextHeightBoard, NextNumPiecesBoard),
        update_piece_info(Game, Piece, GameInfo),
        \+check_draw(GameInfo, NextGame),
        set_pieceBoard(GameInfo, NextPieceBoard, GameInfoP),
        set_heightBoard(GameInfoP, NextHeightBoard, GameInfoPH),
        set_numPiecesBoard(GameInfoPH, NextNumPiecesBoard, GameInfoPHNP),
        check_winner(NextPieceBoard,GameInfoPHNP,GameInfoPHNPWinner),
        change_player(GameInfoPHNPWinner, NextGame).


move(Row,Col,Piece,Game,NextGame):-
        get_actual_board(Game, PieceBoard, HeightBoard, NumPiecesBoard),
        check(Row,Col,Piece,PieceBoard,NumPiecesBoard),
        put_piece(Row,Col,Piece,
                  PieceBoard, HeightBoard, NumPiecesBoard,
                  NextPieceBoard, NextHeightBoard, NextNumPiecesBoard),
        update_piece_info(Game, Piece, GameInfo),
        %check_draw(GameInfo, NextGame),!,
        set_pieceBoard(GameInfo, NextPieceBoard, GameInfoP),
        set_heightBoard(GameInfoP, NextHeightBoard, GameInfoPH),
        set_numPiecesBoard(GameInfoPH, NextNumPiecesBoard, GameInfoPHNP),
        change_player(GameInfoPHNP, NextGame).


get_actual_board(Game, PieceBoard, HeightBoard, NumPiecesBoard):-
        get_pieceBoard(Game, PieceBoard),
        get_heightBoard(Game, HeightBoard),
        get_numPiecesBoard(Game, NumPiecesBoard).

check(R,C,P,Pb,NPb):-
        check_type(R,C,P,Pb),
        check_number(R,C,NPb).

check_type(R,C,P,Pb):-
        (P == 'h' ; P == 'f' ; P =='F' ; P == 'H'),
        search_board(R,C,Pb,PieceThere),
        PieceThere \= doubleFlat,
        PieceThere \= doubleHoled.
        %nl, write('You cannot put any piece on top of a double one! Try again'),nl,nl.


check_number(R,C,NPb):-
        search_board(R,C,NPb,HowManyThere),
        HowManyThere < 2.
        %nl,write('There are already 2 pieces in that cell. Try again!'),nl,nl.

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

check_draw(Game,NextGame):-
        get_numFPieces(NextGame, FPieces),
        get_numHPieces(NextGame, HPieces),
        get_numDoublePieces(NextGame, DPieces),
        FPieces == 0, HPieces == 0, DPieces == 0,
        set_state(Game,'yes',NextGame),
        nl,write('It\'s a draw!'),nl.
        
        
%%%%%%%%%%%% 4-in-a-row horizontal

check_winner(Board,Game,NextGame):-
        four_line(Board),
        set_game_winner(Game,NextGame).

%%%%%%%%%%% 4-in-a-row vertical
check_winner(Board,Game,NextGame):-
        transpose(Board,TransBoard),
        four_line(TransBoard),
        set_game_winner(Game,NextGame).

%%%%%%%%%%% 4-in-a-row diagonal
check_winner(Board,Game,NextGame):-
        get_diagonal(Board,0,Diagonal),
        check_row(Diagonal),
        set_game_winner(Game,NextGame).

check_winner(Board,Game,NextGame):-
        reverse(Board,RevBoard),
        get_diagonal(RevBoard,0,Diagonal),
        check_row(Diagonal),
        set_game_winner(Game,NextGame).


get_diagonal([],_,[]).
get_diagonal([Head|Tail], Col, [Piece|Rest]):-
        search_list(Col,Head,TempPiece),
        Piece = TempPiece,
        NextCol is Col + 1,
        get_diagonal(Tail,NextCol,Rest).

   
four_line([]):- fail.

four_line([Row|NextRows]):-
        check_row(Row);
        four_line(NextRows).

check_row(Row):-
        check_type(Row);
        check_height(Row).


check_type([Pivot,Second,Third,Fourth]):-
        char(Pivot,Char),
        get_piece_type(Char,Type),
        Type \= empty,
        char(Second,Char),
        char(Third, Char),
        char(Fourth, Char).
        

check_height([Pivot,Second, Third, Fourth]):-
        height(Pivot,Height),
        Height \= 0,
        height(Second,Height),
        height(Third,Height),
        height(Fourth,Height).
        
        

        
        
        
        
           
        
        
        