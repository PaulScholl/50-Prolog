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
