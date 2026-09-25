% ==================================================
% PROGRAMACION III - ACTIVIDAD 1
% ==================================================

% ==================================================
% EJERCICIO 1 - ARBOL GENEALOGICO
% ==================================================

% Genero
hombre(abraham).
hombre(herbert).
hombre(homero).
hombre(bart).
hombre(clancy).
hombre(ling).

mujer(mona).
mujer(marge).
mujer(lisa).
mujer(maggie).
mujer(jacqueline).
mujer(patty).
mujer(selma).

% Relaciones directas
padre(abraham, herbert).
padre(abraham, homero).
madre(mona, herbert).
madre(mona, homero).

padre(clancy, patty).
padre(clancy, selma).
madre(jacqueline, patty).
madre(jacqueline, selma).

padre(homero, bart).
padre(homero, lisa).
padre(homero, maggie).
madre(marge, bart).
madre(marge, lisa).
madre(marge, maggie).

madre(selma, ling).

% Reglas
progenitor(X, Y) :-
    padre(X, Y).
progenitor(X, Y) :-
    madre(X, Y).

abuelo(X, Y) :-
    progenitor(X, Z),
    progenitor(Z, Y).

hermano(X, Y) :-
    progenitor(P, X),
    progenitor(P, Y),
    X \= Y.

tio(X, Y) :-
    hermano(X, P),
    progenitor(P, Y).

nieto(X, Y) :-
    progenitor(Y, P),
    progenitor(P, X).


% ==================================================
% EJERCICIO 2 - CORONEL WEST
% ==================================================

americano(west).

misil(m1).
misil(m2).
misil(m3).

tiene(nono, m1).
tiene(nono, m2).
tiene(nono, m3).

enemigo(nono).

vendio(west, m1, nono).
vendio(west, m2, nono).
vendio(west, m3, nono).

criminal(X) :-
    americano(X),
    vendio(X, Arma, Y),
    misil(Arma),
    enemigo(Y).
