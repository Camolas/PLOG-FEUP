print_main:-
        write('       WELCOME TO MEGATEH     '), nl, nl,
        write('  Please choose your game mode: '), nl,
        write('  1 - Human vs. Human'), nl,
        write('  2 - Human vs. Computer'), nl,
        write('  3 - Computer vs. Computer'), nl,
        write('  0 - Exit Game'),nl.

parse_answer(Input):-
        Input == 1, 
        write('        Human VS Human'),nl,nl,
        human_human(Game), 
        play(Game),
        !.

parse_answer(Input):-
        Input == 2, 
        write('        Human VS Machine'),nl,nl,
        human_machine(Game), 
        play(Game),
        !.

parse_answer(Input):-
        Input == 3, 
        write('        Machine VS Machine'),nl,nl,
        machine_machine(Game), 
        play(Game),
        !.
parse_answer(Input):-
        Input == 0, 
        write('Exiting...'), nl,
        halt(0),
        !.

display_actualInfo(Game):-
        get_playerToPlay(Game, PlayerToPlay),
        player_userName(PlayerToPlay, PlayerUserName),
        
        get_numFPieces(Game, NumFPieces),
        get_numHPieces(Game, NumHPieces),
        get_numDoublePieces(Game, NumDoublePieces),
        
        nl,write(PlayerUserName),write(', IT\'S YOUR TURN TO PLAY! '),nl,
        write('Pieces still to play: '), nl,
        write('Flat: '), write(NumFPieces),
        write('     Holed: '), write(NumHPieces),
        write('     Double: '), write(NumDoublePieces), nl, nl.


set_game_winner(Game,NextGame):-
        get_playerToPlay(Game,ActualPlayer),
        set_state(Game,'yes',NextGame),
        write(ActualPlayer),
        write(' Won!'),nl,true,!.

       
       
       
                
                                       
                                    
                                    