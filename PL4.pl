
ligado(a,b). ligado(f,i).
ligado(a,c). ligado(f,j).
ligado(b,d). ligado(f,k).
ligado(b,e). ligado(g,l).
ligado(b,f). ligado(g,m).
ligado(c,g). ligado(k,n).
ligado(d,h). ligado(l,o).
ligado(d,i). ligado(i,f). 

pesq_prof(Ef,Ef,[Ef]).
pesq_prof(E,Ef,[E|Ef],[E|Es]):-
		ligado(E,E1),%dou um passo no meu grafo
		pesq_prof(E1,Ef,Es).
		
		
pp_sc(E, Visit, Ef, S):-
	ligado(E,E1),
	\+ member(E1,Visit),
	pp_sc(E1,[E1|Visit],Ef,S).
	%que é 
	
	%use_module(library(lists)).
	%[a,b,d,i]
	%acrescentar um elemento no final da lista é muito fácil!
	
	%[Ei|[i,d,b,a]]
	
	
	pl([Ef|Cam]|Es],Ef ).
	pl([E|Es],Ef):-
		reverse([Ef|Cam],S).
		findall(E1,ligado(E,E1),LE1),
		append(Es,LE1,L2),%obter todas as soluções para um determinado objectivo: é o findAll, obter todas as soluções possíveis para este objectivo.. (o que quero obter,o objectivo, lista de E1 de sucessões com aquele objectivo!)
		pl(L2,Ef).%[E1 = [b,c]  daquele objectivo o que quero tomar reconhecer da solução, da lista S.. desta lista eu só vou querer 1 elemento!
	
	% vou querer ter a lista BC.. quero analisar só depois de analisar o nó C. Quero concatená-los.. o que é que vou primeiro. Fazer append de Es com a lista de LE1s 