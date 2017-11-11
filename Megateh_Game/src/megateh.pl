:- use_module(library(random)).
:- use_module(library(system)).
:-use_module(library(lists)).
:-use_module(library(det)).

:-include('board&pieces.pl').
:-include('interface.pl').
:-include('gameSpecs.pl').
:-include('misc.pl').
:-include('humanToPlay.pl').
:-include('megatehLogic.pl').
 

megateh:-
        print_main,
        repeat,
        read(Ans),
        get_return_key,
        parse_answer(Ans),
        !.

player(player_1).
player(player_2).
player(machine).

player_userName(player_1, 'PLAYER 1').
player_userName(player_2, 'PLAYER 2').
player_userName(machine, 'MACHINE').

play(Game):-
        get_mode(Game, Mode),
        Mode = hh,
        
        get_state(Game,State),
        State \= yes,
        
        humanTurn(Game, NextGame),
        play(NextGame).

play(Game):-
        get_mode(Game, Mode),
        Mode = hm,
        
        get_state(Game,State),
        State \= yes,
        
        get_playerToPlay(Game, PlayerToPlay),
        PlayerToPlay == player_1,
        
        humanTurn(Game, NextGame),
        play(NextGame).

%still to implement
play(Game):-
        get_mode(Game, Mode),
        Mode = hm,
        
        get_state(Game,State),
        State \= yes,
        
        get_playerToPlay(Game, PlayerToPlay),
        PlayerToPlay == player_2,
       
        machineTurn(Game, NextGame), 
        play(NextGame).

play(Game):-
        get_mode(Game, Mode),
        Mode = mm,
        
        get_state(Game,State),
        State \= yes,
        
        machineTurn(Game, NextGame),
        play(NextGame).

play(Game):-
        get_pieceBoard(Game,PieceBoard),
        display_board(PieceBoard,4),
        get_state(Game,State),
        State == yes,
        true.


        


