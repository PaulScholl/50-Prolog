% Construye un árbol binario de búsqueda a partir de una lista de enteros.
% Un árbol binario de búsqueda es un árbol en el cual, para cada nodo, todos los elementos en el subárbol izquierdo son menores y en el subárbol derecho son mayores.
construct([], nil).
construct([X|Xs], T) :- construct(Xs, T1), add(X, T1, T).

% Añade un nodo a un árbol binario de búsqueda.
add(X, nil, t(X, nil, nil)).
add(X, t(Root, L, R), t(Root, NL, R)) :- X < Root, add(X, L, NL).
add(X, t(Root, L, R), t(Root, L, NR)) :- X >= Root, add(X, R, NR).