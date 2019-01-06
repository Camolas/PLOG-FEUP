
setPuzzle(Spiral, BoardLength, KeyLength):-
    Spiral_len is BoardLength*BoardLength,
    length(Spiral, Spiral_len),
  %domain
    domain(Spiral, 0, KeyLength),
  %constraints
    checkRow(Spiral, BoardLength, KeyLength), %making sure each element of the key shows up only once every row
    checkCol(Spiral, BoardLength, KeyLength,1), %making sure each element of the key shows up only once every column
    checkSequence(Spiral, BoardLength), %making sure the sequence of the elements in the spiral is right
  %result
    labeling([ffc], Spiral).

checkRow([],_,_):-!.
checkRow(Spiral, BoardLength, KeyLength):-
    splitByLength(BoardLength, Spiral, SplitElems), %gets a list of the first row elems
    append(SplitElems,RestElems,Spiral), %to get the rest of the list
    checkRow(RestElems,BoardLength, KeyLength),
    
    getKeyIndexedList(KeyLength,IndexedList), %gets an indexed list from 1 to the key's length
    setEachIndexCount(IndexedList, SplitElems, 1). %makes sure that there's only 1 of each index on the split part

%gets a version of the list in which the order of the elements is like they've written there by columns
checkCol([],_,_,_):-!.
checkCol(_,BoardLength,_, N):-
    N > BoardLength,!.
checkCol(Spiral, BoardLength, KeyLength, N1):-
    Next is N1+1,
    checkCol(Spiral, BoardLength, KeyLength, Next),
    getColElems(N1, BoardLength, Spiral, ColElems),
    checkRow(ColElems, BoardLength, KeyLength).


checkSequence(List, BoardLength):-
    setSpiralPath(BoardLength, Path), %gets a list in which the elements are the direction of the spiral
    setSpiral(List,Path, BoardLength,Spiral,0,0), %sets the indexes in the list as if it was a matrix
    setSequence(Spiral,BoardLength,1,0). %sets the constraints of the sequence



%fills a list with the direction of the next 'move', considering the board's length
setSpiralPath(1,[]):-!.
setSpiralPath(N,Path):-
    N2 is N-2,
    setSpiralPath(N2, PathTail),
    N1 is N-1,
    setListAt(Right, d, N1), 
    setListAt(Down, s, N1),
    setListAt(Left, a, N1),
    setListAt(Up, w, N2),

    append(Right, Down, RD),
    append(RD, Left, RDL),
    append(RDL, Up, RDLU),
    append(RDLU, [d], TmpPath),

    append(TmpPath, PathTail, Path).

setSpiral(List, [], BoardLength, Spiral ,Row,Column):-
    Index is Row*BoardLength + Column,
    nth0(Index, List, Elem),
    Spiral = [Elem].
    
setSpiral(List, [Direction|PathTail], BoardLength, Spiral, Row,Column):-
    switch(Direction, [
        d:(NewCol is Column+1, NewRow is Row),
        a:(NewCol is Column-1,NewRow is Row),
        s:(NewCol is Column, NewRow is Row+1),
        w:(NewCol is Column, NewRow is Row-1)]),
    setSpiral(List, PathTail, BoardLength, SpiralTail,NewRow,NewCol),
    Index is Row*BoardLength + Column,
    nth0(Index, List, Elem),
    Spiral = [Elem | SpiralTail].


setSequence(_,BoardLength, N,_):-
    N>BoardLength.
setSequence(Spiral,BoardLength,Counter, LastOccur):-
    keyCounter(Spiral, 1, Counter, Index1),
    keyCounter(Spiral, 2, Counter, Index2),
    keyCounter(Spiral, 3, Counter, Index3),
            LastOccur#<Index1,
            Index1#<Index2,
            Index2#<Index3,
    Next is Counter+1,
    setSequence(Spiral,BoardLength,Next, Index3).
 
keyCounter(Spiral, Element, Limit, Index) :-
  keyCounterLimit(Spiral,Element, 0, Limit, Index, 0),
  element(Index,Spiral,Element). 

keyCounterLimit(_,_,Count,Count,Index,Index).
keyCounterLimit([Head|Tail], Element, Aux, Count, Index, IndexAux) :-
    Head #= Element #<=> Bool,
    Aux2 #= Aux + Bool,
    N_Index is IndexAux + 1,
    keyCounterLimit(Tail, Element, Aux2, Count, Index, N_Index).

setIndexCount(_, [], 0).
setIndexCount(Value, [Head | Tail], Count) :-
    setIndexCount(Value, Tail, Count2),
    Value #= Head #<=> Bool,
    Count #= Count2 + Bool.

setEachIndexCount([],_,_).
setEachIndexCount([Value|Rest], List, Count):-
    setEachIndexCount(Rest, List, Count),
    setIndexCount(Value,List,Count).
