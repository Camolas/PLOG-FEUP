search_list(0,[Head|_],Head).

search_list(Index,[_|Tail],Char):-
        Index > 0,
        NextIndex is Index-1,
        search_list(NextIndex,Tail,Char).

change_list_at(0,[_|Tail], NewInput, [NewInput|Tail]).

change_list_at(Index,[Head|ActualTail], NewInput, [Head|NextTail]):-
        Index > 0,
        NextIndex is Index - 1,
        change_list_at(NextIndex, ActualTail, NewInput, NextTail).

get_return_key:-
        get_code(_).


get_col(Col):-
        read(Input),
        get_return_key,
        char_number(Input,Col).

search_board(0, Col, [Head|_], Piece):-
        search_list(Col, Head, Piece).

search_board(Row, Col, [_|Tail], Piece):-
        Row > 0,
        NextRow is Row - 1,
        search_board(NextRow, Col, Tail, Piece).

change_cell(0, Col, [Head|ActualTail], NewInput, [NextHead|ActualTail]):-
        change_list_at(Col, Head, NewInput, NextHead).
        
change_cell(Row, Col, [Head|ActualTail], NewInput, [Head|NextTail]):-
        Row > 0,
        NextRow is Row - 1,
        change_cell(NextRow, Col, ActualTail, NewInput, NextTail).



change_player(Game,NextGame):-
        get_mode(Game,Mode),
        Mode == hh,
        get_playerToPlay(Game,ActualPlayer),
        (ActualPlayer == player_1 -> NextPlayer = player_2;
         ActualPlayer == player_2 -> NextPlayer = player_1),
        set_playerToPlay(Game,NextPlayer,NextGame).

change_player(Game,NextGame):-
        get_mode(Game,Mode),
        Mode == hm,
        get_playerToPlay(Game,ActualPlayer),
        (ActualPlayer == player_1 -> NextPlayer = machine;
         ActualPlayer == machine -> NextPlayer = player_1),
        set_playerToPlay(Game,NextPlayer,NextGame).

change_player(Game,NextGame):-
        get_mode(Game,Mode),
        Mode == mm,
        set_playerToPlay(Game,machine,NextGame).

get_board_row(Row,Board,RowList):-
        nth0(Row,Board,RowList).                  
                                       
initialize_random_seed:-
        now(Usec), Seed is Usec mod 30269,
        getrand(random(X, Y, Z, _)),
        setrand(random(Seed, X, Y, Z)), !.

parse_piece(TempPiece,Piece):-
        ((TempPiece == 'f' ; TempPiece == 'h') -> Piece = TempPiece
        ;       (TempPiece == 'ff' -> Piece = 'F'
                ;    (TempPiece == 'hh' -> Piece = 'H')
                )
        ).              

parse_position(Row,Col):-
        Row >= 0,
        Row =< 3,
        Col >=0,
        Col =< 3.
            
