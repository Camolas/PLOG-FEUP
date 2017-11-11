
human_human(Game):-
        empty_board(PieceBoard),
        
        empty_height(HeightBoard),
        
        empty_numPieces(NumPiecesBoard),
        
        Game = [PieceBoard, HeightBoard, NumPiecesBoard, player_1, no, hh, 8 ,8, 8].

human_machine(Game):-
        empty_board(PieceBoard),
       
        empty_height(HeightBoard),
        
        empty_numPieces(NumPiecesBoard),
        
        Game = [PieceBoard, HeightBoard, NumPiecesBoard, player_1, no, hm, 8 ,8, 8].

machine_machine(Game):-
        empty_board(PieceBoard),
        
        empty_height(HeightBoard),
        
        empty_numPieces(NumPiecesBoard),
        
        Game = [PieceBoard, HeightBoard, NumPiecesBoard, machine, no, mm, 8 ,8, 8].


get_pieceBoard(Game,PieceBoard):-
        search_list(0, Game, PieceBoard).

set_pieceBoard(Game, NewPB, NewGame):-
        change_list_at(0, Game, NewPB, NewGame).



get_heightBoard(Game,HeightBoard):-
        search_list(1, Game, HeightBoard).

set_heightBoard(Game, NewHB, NewGame):-
        change_list_at(1, Game, NewHB, NewGame).



get_numPiecesBoard(Game,NumPiecesBoard):-
        search_list(2, Game, NumPiecesBoard).

set_numPiecesBoard(Game, NewNPB, NewGame):-
        change_list_at(2, Game, NewNPB, NewGame).



get_playerToPlay(Game, PlayerToPlay):-
        search_list(3, Game, PlayerToPlay).

set_playerToPlay(Game, NextPlayer, NewGame):-
        change_list_at(3, Game, NextPlayer, NewGame).



get_winner(Game, Winner):-
        search_list(4,Game,Winner).

set_winner(Game, Winner, NewGame):-
        change_list_at(4, Game, Winner, NewGame).



get_mode(Game,Mode):-
        search_list(5,Game,Mode).



get_numFPieces(Game, NumFPieces):-
       search_list(6,Game,NumFPieces). 

set_numFPieces(Game, NumFPieces, NewGame):-
        change_list_at(6, Game, NumFPieces, NewGame).



get_numHPieces(Game, NumHPieces):-
       search_list(7,Game,NumHPieces). 

set_numHPieces(Game, NumHPieces, NewGame):-
        change_list_at(7, Game, NumHPieces, NewGame).



get_numDoublePieces(Game, NumDoublePieces):-
       search_list(8,Game,NumDoublePieces). 

set_numDPieces(Game, NumDPieces, NewGame):-
        change_list_at(8, Game, NumDPieces, NewGame).




update_piece_info(Game, Piece, NGame):-
        Piece == 'f',
        get_numFPieces(Game, N_f),
        N_f > 0,
        Next_nF is N_f - 1,
        set_numFPieces(Game, Next_nF, NGame).

update_piece_info(Game, Piece, NGame):-
        Piece == 'h',
        get_numHPieces(Game, N_h),
        N_h > 0,
        Next_nH is N_h - 1,
        set_numHPieces(Game, Next_nH, NGame).

update_piece_info(Game, Piece, NGame):-
        (Piece == 'df' ; Piece == 'dH'),
        get_numDoublePieces(Game, N_d),
        N_d > 0,
        Next_nD is N_d - 1,
        set_numFPieces(Game, Next_nD, NGame).


