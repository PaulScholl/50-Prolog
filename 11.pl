% -------------------------------------------------------------------
%  Programa: 11.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Modificar la codificación Run-Length de una lista.
% -------------------------------------------------------------------



% Agrupa duplicados consecutivos en sublistas.
pack([], []).
pack([X|Xs], [[X|Ys]|Zs]) :- transfer(X, Xs, Ys, Rest), pack(Rest, Zs).

transfer(X, [], [], []).
transfer(X, [Y|Ys], [], [Y|Ys]) :- X \= Y.
transfer(X, [X|Xs], [X|Ys], Rest) :- transfer(X, Xs, Ys, Rest).

% Codifica una lista usando codificación Run-Length.
encode(L, R) :- pack(L, P), transform(P, R).

% Transforma sublistas en parejas (N, X), donde N es la cantidad de elementos.
transform([], []).
transform([[X|Xs]|Ys], [[N, X]|Zs]) :- length([X|Xs], N), transform(Ys, Zs).

% Codificación Run-Length modificada.
encode_modified(L, R) :- encode(L, Enc), modify(Enc, R).

% Modifica la codificación: si un elemento no tiene duplicados, se mantiene sin empaquetar.
modify([], []).
modify([[1, X]|T], [X|R]) :- modify(T, R).
modify([[N, X]|T], [[N, X]|R]) :- N > 1, modify(T, R).
