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

get_coords(Col,Row):-
        get_integer(R),
        get_integer(C),
        get_return_key,
        Row is 51 - R,
        Col is C.%-49.

get_integer(Value):-
        get_code(TempV),
        Value is TempV - 49.
       

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
        get_playerToPlay(Game,ActualPlayer),
        (ActualPlayer == player_1 -> NextPlayer = player_2;
         ActualPlayer == player_2 -> NextPlayer = player_1),
        set_playerToPlay(Game,NextPlayer,NextGame).

                       
                                                     


