% Construye un árbol binario completamente equilibrado con N nodos.
cbal_tree(0, nil).
cbal_tree(N, t('x', L, R)) :-
    N > 0,
    N1 is N - 1,
    divide(N1, N2, N3),       % Divide los nodos restantes en dos partes
    cbal_tree(N2, L),         % Construye el subárbol izquierdo
    cbal_tree(N3, R).         % Construye el subárbol derecho

% Divide el número de nodos entre los dos subárboles de manera equilibrada.
divide(N, N1, N2) :-
    N1 is N // 2,
    N2 is N - N1.

% Comprueba si un árbol binario es simétrico.
symmetric(nil).
symmetric(t(_, L, R)) :- mirror(L, R).

% Verifica si un árbol es el espejo de otro.
mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :- mirror(L1, R2), mirror(R1, L2).

% Genera todos los árboles binarios simétricos y completamente equilibrados con N nodos.
sym_cbal_trees(N, Ts) :- 
    findall(T, (cbal_tree(N, T), symmetric(T)), Ts).
