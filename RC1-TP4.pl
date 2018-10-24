%use_module(library(lists)).

ligado(a,b). 
ligado(f,i).
ligado(a,c). 
ligado(f,j).
ligado(b,d). 
ligado(f,k).
ligado(b,e). 
ligado(g,l).
ligado(b,f). 
ligado(g,m).
ligado(c,g). 
ligado(k,n).
ligado(d,h). 
ligado(l,o).
ligado(d,i). 
ligado(i,f). 

pesq_prof(Ef,Ef,[Ef]).
pesq_prof(E,Ef,[E|Es]):-
	ligado(E,E1),
	pesq_prof(E1,Ef,Es).

%?- pesq_prof(a,d,L).
%L=[a,b,d]

%pesquisa em profundidade sem ciclos
pp_sc(E, Visit, Ef, S):- reverse(Visit,S).
pp_sc(E, Visit, Ef, S):-
	ligado(E,E1),
	\+ member(E1,Visit),
	pp_sc(E1,[E1|Visit],Ef,S).

%?- pp_sc(a,[a],g,L).

%pesquisa em largura (Cam = Caminho)
pl([[Ef|Cam]|Es],Ef,S):- reverse([Ef|Cam],S).
pl([[E|Cam]|Es],Ef,S):-
	findall([E1|[E|Cam]],ligado(E,E1),LE1),
	append(Es,LE1,L2),
	pl(L2,Ef,S).

