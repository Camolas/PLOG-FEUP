:- use_module(library(clpfd)).
:- use_module(library(lists)).
:- include('board.pl').
:- include('logic.pl').
:- include('misc.pl').


magicSnail(Key, BoardLength):-
    statistics(walltime, [TimeSinceStart | [TimeSinceLastCall]]),
    atom_chars(Key,KeyList),
    length(KeyList, KeyLength),
    setPuzzle(Spiral,BoardLength,KeyLength),
    placeKeys(Spiral, Result, KeyList),
    listToMatrix(Result, BoardLength, Matrix),
    buildBoard(Matrix, BoardLength, Board),
    displayBoard(Board),
    statistics(walltime, [NewTimeSinceStart | [ExecutionTime]]),
    write('Execution took '), write(ExecutionTime), write(' ms.'), nl.
 
   