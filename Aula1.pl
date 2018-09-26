homem(rui).
homem(andre).
mulher(maria).
mulher(ana).
%pais(F,P,M).%: os pais do F são P e M
pais(andre, rui, maria).%  pais/3
pais(ana,rui, maria).
%pais  não me interessa o que lá está - underscore etc!!
%Regra:clausula completa com cabeça e corpo
%e fazer uma view!!!
pai(P,F):- pais(F,P,_).
mae(M,F):- pais(F,_,M).
pai(P):-pai(P,_). % vai-nos dizer se é ou não é Pai.
filha(F,F):-pais(F,_,_), mulher(F).
filha(F,X):-
		mulher(F),
		(pai(X,F);mae(X,F)).
		
filho(F,X) :- homem(F), pai(X,F).
filho(F,X):-hoem(F),mae(X,F).

filho(F,X):-
	homem(F),
	(pai(X,F);mae(X,F)).


irmaos(F1,F2):-
	filho(F1,X),filho(F2,X).
	
irmao(I1,I2):-
		homem(I1), %I1 \= I2: Uma variável não instanciada unifica com qualquer coisa! Diz não que colocar esta condição aqui!
		pais(I1,P,M), %variaveis logicas, representa um conceito único (uma vez que são partilháveis)
		pais(I2,P,M),
		I1 \= I2.%não representam o mesmo objecto I1, só posso fazer este teste depois de as variáveis estarem instânciadas!!
%irmaos %um homem implica maria e ana não
%RC1
% Knowledge Base
male(aldo).
male(lincoln).
male(michael).
male(lj).
female(christina).
female(lisa).
female(sara).
female(ella).
parent(aldo,lincoln).
parent(aldo,michael).
parent(christina,michael).
parent(christina,lincoln).
parent(lisa,lj).
parent(lincoln,lj).
parent(michael,ella).
parent(sara,ella).

% Questions
parent(X,michael).
parent(aldo,Y).
%RC2
pilot(lamb).
pilot(besenyei).
pilot(chambliss).
pilot(maclean).
pilot(mangold).
pilot(jones).
pilot(bonhome).
team(breitling,lamb).
team(redbull,besenyei).
team(redbull,chambliss).
team(mediterraneanracingteam,maclean).
team(cobra,mangold).
team(matador,bonhome).
team(matador,jones).
plane(mx2, lamb).
plane(edge540,besenyei).
plane(edge540,chambliss).
plane(edge540,maclean).
plane(edge540,mangold).
plane(edge540,jones).
plane(edge540,bonhome).
circuit(istanbul).
circuit(budapest).
circuit(porto).
winner(porto,jones).
winner(budapest,mangold).
winner(istanbul,mangold).
gates(istanbul,9).
gates(budapest,6).
gates(porto,5).
%Questions
%winner(porto,P). %isto esta a ser atribuído como um facto.., a dizer que toda a gente ganhou no porto.. daí o erro!
twinner(R,T):-winner(R,P),team(T,P).
% d)gates(C,N),N>8.   % @> @< @>= @=< 
% gates('Porto',5). os facto nunca tem variável!! pouco provável algo de errado ou porto se colocar Porto é como se tivesse um X
%@< %para não ter simétricos, alfabeticamente menor que ... e daí aparecer somente 1
%error twinner(porto,T):-winner(porto,P),team(T,P).

aluno(joao, paradigmas).
aluno(maria, paradigmas).
aluno(joel, lab2).
aluno(joel, estruturas).
frequenta(joao, feup).
frequenta(maria, feup).
frequenta(joel, ist).
professor(carlos, paradigmas).
professor(ana_paula, estruturas).
professor(pedro, lab2).
funcionario(pedro, ist).
funcionario(ana_paula, feup).
funcionario(carlos, feup).