unificavel([],_,[]).
unificavel([X|Xs],T,[X|Ys]):-
	T=X,
	unificavel(Xs,T,Ys).
