splitByLength(Limit,List,SplitList):-
    splitByLength(Limit,List,SplitList,0).

splitByLength(Count, _, [],Count).
splitByLength(Limit, [Value|Rest], SplitList,Count) :-
    Count1 is Count+1,
    splitByLength(Limit, Rest, SplitList_rest,Count1),

    append([Value], SplitList_rest, SplitList).
    
getKeyIndexedList(0, []):-!.
getKeyIndexedList(N, List):-
    Next is N-1,
    getKeyIndexedList(Next,Rest),
    append(Rest,[N],List).

getColElems(_,_,[],[]):-!.
getColElems(NColumn, BoardLength, List, Result):-
    splitByLength(BoardLength, List, SplitElems),
    append(SplitElems,Rest,List),

    getColElems(NColumn, BoardLength, Rest, TmpResult),

    nth1(NColumn, SplitElems, Value),
    append([Value], TmpResult, Result).

setListAt([], _, 0):-!.
setListAt([Value|Tail], Value, N):- 
    N1 is N-1, 
    setListAt(Tail, Value, N1).

placeKeys([], [], _).
placeKeys([Elem|Rest], After, Key):-
    placeKeys(Rest, AfterRest, Key),
    ifelse(nth1(Elem, Key, Atom),
        After = [Atom|AfterRest],
        After = [empty|AfterRest]).

listToMatrix([], _, []).
listToMatrix(List, Size, [Row|Matrix]):-
  listToMatrixRow(List, Size, Row, Tail),
  listToMatrix(Tail, Size, Matrix).

listToMatrixRow(Tail, 0, [], Tail).
listToMatrixRow([Item|List], Size, [Item|Row], Tail):-
  NSize is Size-1,
  listToMatrixRow(List, NSize, Row, Tail).


ifelse(Condition, If, _Else) :- Condition, !, If.
ifelse(_, _, Else) :- Else.

not(X) :- X, !, fail.
not(_X).

switch(X, [Case:Then|Cases]) :-
    ( X=Case ->
        call(Then)
    ;
        switch(X, Cases)
    ).
