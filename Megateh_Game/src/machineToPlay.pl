
%%% predicates to run when the player is the machine
machineTurn(Game,NextGame):-
        get_actual_board(Game, PieceBoard, HeightBoard, NPBoard),
        display_board(PieceBoard,4,NPBoard,HeightBoard),
        repeat,
        display_actualInfo(Game),
        
        random(1,5,TempRow),
        random(0,4,Col),
        Row is 4 - TempRow,
        number_char(Col,TempCol),
        
        get_machine_piece(TempPiece),
        parse_piece(TempPiece,Piece),
        get_piece_type(Piece,Type),
        
        display_machine_move(TempRow, TempCol, Type),
        
        move(Row,Col,Piece,Game,NextGame),
        !.

%%% returns the desired piece from the machine turn
get_machine_piece(Piece):-
        random(0,4,Random),
        generate_piece(Random,Piece),
        !.


%%% generates the piece from the value returned from the random function.
generate_piece(Random,f):-
        Random == 0.

generate_piece(Random,h):-
        Random == 1.

generate_piece(Random,ff):-
        Random == 2.

generate_piece(Random,hh):-
        Random == 3.

%%% shows the random position and piece to move.
display_machine_move(Row, Col, Piece):-
        
        write('Machine puts '), write(Piece), write(' in '),
        write(Col),write(Row),nl,nl.


