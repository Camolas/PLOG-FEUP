
meaning(empty, '     '):-!.
meaning(h_line, '------'):-!.
meaning(v_empty, ' '):-!.
meaning(v_line, '|'):-!.
meaning(h_empty, '     '):-!.
meaning(X, Res):-
    atom_concat('  ', X, X1),
    atom_concat(X1, '  ', Res).


buildBoard(Matrix, BoardLength, Board):-
    horizontalLines(BoardLength, HLine),
    verticalLines(BoardLength, VLine),
    buildBoard(Matrix, HLine, VLine, BoardLength, Board).

buildBoard([], [RowHLine], [], _, [Result]):-
    parseHorizontalLine(RowHLine, Result).

buildBoard([Row|RestElems], 
           [RowHLine|RestHLine], 
           [RowVLine|RestVLine], BoardLength, Result):-
    buildBoard(RestElems, RestHLine, RestVLine, BoardLength, RestResult),
    parseHorizontalLine(RowHLine, RowHead),
    parseVerticalLine(RowVLine, Row, RowContent),

    Result = [RowHead, RowContent|RestResult].

horizontalLines(0, _):- !,fail.
horizontalLines(1, [[h_line],[h_line]]):-!.
horizontalLines(N, FrontierBoard):-
    N2 is N-2,
    horizontalLines(N2,FrontierBoardRest),
    setListAt(Top, h_line, N),
    horizontalLinesAux(N, FrontierBoardRest, Center),
    setListAt(Bottom, h_line, N),
    append([Top], Center, TC),
    append(TC, [Bottom], FrontierBoard).

horizontalLinesAux(_,[],[]).
horizontalLinesAux(N, [Row|Rest], Center):-
    N1 is N-1,
    length([Row|Rest],N1),
    !,
    horizontalLinesAux(N, Rest, CenterRest),
    append([h_line],Row,HLineRest),
    append(HLineRest,[h_empty],NewRow),

    append([NewRow], CenterRest, Center).

horizontalLinesAux(N, [Row|Rest], Center):-
    !,
    horizontalLinesAux(N, Rest, CenterRest),

    append([h_empty],Row,HEmptyRest),
    append(HEmptyRest,[h_empty],NewRow),

    append([NewRow], CenterRest, Center).


verticalLines(0, _):- !,fail.
verticalLines(1, [[v_empty,v_line]]):-!.
verticalLines(N, FrontierBoard):-
    N2 is N-2,
    verticalLines(N2, FrontierBoardRest),
    setListAt(ATop, v_empty, N),
    append(ATop, [v_line], Top),
    verticalLinesAux(N, FrontierBoardRest, Center),
    N1 is N-1,
    setListAt(CBottom,v_empty,N1),
    append([v_line], CBottom, LBottom),
    append(LBottom, [v_line], Bottom),
    append([Top], Center, TC),
    append(TC, [Bottom], FrontierBoard).
    
verticalLinesAux(_,[],[]).
verticalLinesAux(N, [Row|Rest], Center):-
    verticalLinesAux(N, Rest, CenterRest),

    append([v_line],Row,VLineRest),
    append(VLineRest,[v_line],NewRow),

    append([NewRow], CenterRest, Center).

parseHorizontalLine([], [' ']).
parseHorizontalLine([R1|Rest], Result):-
    parseHorizontalLine(Rest,Result1),
    meaning(R1, Ascii),
    Result = [Ascii|Result1].

parseVerticalLine([R1], [], Result):-
    meaning(R1, Ascii),
    Result = [Ascii].
parseVerticalLine([R1|Rest], [Elem|Tail], Result):-
    parseVerticalLine(Rest, Tail, Result1),
    meaning(R1, Ascii),
    meaning(Elem, TElem),
    Result = [Ascii,TElem|Result1].


displayBoard([]).
displayBoard([Row|Tail]):-
    write('               '),
    displayRow(Row), nl,
    displayBoard(Tail).
 
displayRow([]).
displayRow([Elem|Rest]):-
    write(Elem),
    displayRow(Rest).   



