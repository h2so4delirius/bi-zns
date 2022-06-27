/*
Prvni priklad logickeho programu.

Cast rodokmenu rodiny, zalozene ceskym kralem Janem Lucemburskym,
a jeho manzelkou Eliskou Premyslovnou.
*/

% muzi

muz(abe_simpson).
muz(herb_simpson).
muz(homer_simpson).
muz(bart_simpson).
muz(clancy_bouvier).


% zeny

zena(mona_simpson).
zena(liza_simpson).
zena(maggie_simpson).
zena(jacqueline_bouvier).
zena(marge_bouvier).
zena(patty_bouvier).
zena(selma_bouvier).
zena(ling_bouvier).


% vztah manzelstvi

manzelka(abe_simpson,mona_simpson).
manzelka(homer_simpson,marge_bouvier).
manzelka(clancy_bouvier,jacqueline_bouvier).


% vztah otcovstvi

otec(abe_simpson,homer_simpson).
otec(abe_simpson,herb_simpson).
otec(clancy_bouvier,marge_bouvier).
otec(clancy_bouvier,patty_bouvier).
otec(clancy_bouvier,selma_bouvier).
otec(homer_simpson,bart_simpson).
otec(homer_simpson,liza_simpson).
otec(homer_simpson,maggie_simpson).

% vztah materstvi

matka(mona_simpson,homer_simpson).
matka(mona_simpson,herb_simpson).
matka(clancy_bouvier,marge_bouvier).
matka(clancy_bouvier,patty_bouvier).
matka(clancy_bouvier,selma_bouvier).
matka(marge_bouvier,bart_simpson).
matka(marge_bouvier,liza_simpson).
matka(marge_bouvier,maggie_simpson).
matka(selma_bouvier,ling_bouvier).
matka(jacqueline_bouvier,marge_bouvier).
matka(jacqueline_bouvier,selma_bouvier).
matka(jacqueline_bouvier,clancy_bouvier).

% vztahy definovane na zaklade predchozich pomoci pravidel

bratr(X,Y) :-
   muz(X),otec(O,X),matka(M,X),otec(O,Y),matka(M,Y).

sestra(X,Y) :-
   zena(X),otec(O,X),matka(M,X),otec(O,Y),matka(M,Y).

deda(X,Y) :-
   muz(X),otec(X,Z),(otec(Z,Y);matka(Z,Y)).

baba(X,Y) :-
   zena(X),matka(X,Z),(otec(Z,Y);matka(Z,Y)).

vnuk(X,Y) :-
   muz(X),(deda(Y,X);baba(Y,X)).

vnucka(X,Y) :-
   zena(X),(deda(Y,X);baba(Y,X)).

rodic(X,Y) :- otec(X,Y);matka(X,Y).	
