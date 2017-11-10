search_list(0,[Head|_],Head).

search_list(Index,[_|Tail],Char):-
        Index > 0,
        NextIndex is Index-1,
        search_list(NextIndex,Tail,Char).

get_return_key:-
        get_code(_).

get_coords(Row,Col):-
        get_integer(R),
        get_integer(C),
        get_return_key,
        Row is 4-R,
        Col is C-49.

get_integer(Value):-
        get_code(TempV),
        Value is TempV - 48.
