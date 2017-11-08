
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
        
        Game = [PieceBoard, HeightBoard, NumPiecesBoard, player_1, no, mm, 8 ,8, 8].


get_pieceBoard(Game,PieceBoard):-
        search_list(0, Game, PieceBoard).

get_heightBoard(Game,HeightBoard):-
        search_list(1, Game, HeightBoard).

get_numPiecesBoard(Game,NumPiecesBoard):-
        search_list(2, Game, NumPiecesBoard).

get_playerToPlay(Game, PlayerToPlay):-
        search_list(3, Game, PlayerToPlay).

get_winner(Game, Winner):-
        search_list(4,Game,Winner).

get_mode(Game,Mode):-
        search_list(5,Game,Mode).

get_numFPieces(Game, NumFPieces):-
       search_list(6,Game,NumFPieces). 

get_numHPieces(Game, NumHPieces):-
       search_list(7,Game,NumHPieces). 

get_numDoublePieces(Game, NumDoublePieces):-
       search_list(8,Game,NumDoublePieces). 


