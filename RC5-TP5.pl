unificavel([X|Xs],T,[X|Ys]):-
			T=X,
			unificavel(Xs,T,Ys).
%instancia T como X

unificavel([],_,[]).

%----------------------------------------------

unificavel([X|Xs],T,Ys):-
			X\=T, !
			unificavel(Xs,T,Ys).
%se X=T, ! para a condição
			
unificavel([X|Xs],T,[X|Ys]):-
			unificavel(Xs,T,Ys).
	
unificavel([],_,[]).

%?- unificavel([X,Y,a],b,L).
%L=[X,Y]