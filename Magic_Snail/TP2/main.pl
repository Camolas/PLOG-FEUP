:- use_module(library(clpfd)).
:- use_module(library(lists)).
:- include('board.pl').
:- include('magic_snail.pl').
:- include('misc.pl').


magicSnail(Key, BoardLength):-
    atom_chars(Key,KeyList),
    length(KeyList, KeyLength),
    setPuzzle(Spiral,BoardLength,KeyLength),
    placeKeys(Spiral, AtomList, KeyList),
    listToMatrix(AtomList, BoardLength, Matrix),
    buildBoard(Matrix, BoardLength, Board),
    displayBoard(Board).
