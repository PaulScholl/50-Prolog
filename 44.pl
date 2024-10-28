% Importante: representa cada símbolo y su frecuencia como fr(Simbolo, Frecuencia)
% por ejemplo, fr(a, 5).

% Genera el árbol de Huffman dado un conjunto de frecuencias (Fs).
huffman(Fs, Hs) :-
    length(Fs, Len), Len > 1,
    sort(2, @=<, Fs, Sorted),          % Ordena la lista de frecuencias por la frecuencia ascendente
    huffman_tree(Sorted, Hs).

% Caso base para construir el árbol de Huffman: un solo símbolo en la lista
huffman_tree([fr(X, _) | []], hc(X, '0')). % Si hay solo un elemento, asigna el código '0'

% Construcción recursiva del árbol de Huffman
huffman_tree([fr(X1, F1), fr(X2, F2) | Rest], Hs) :-
    F3 is F1 + F2,                       % Suma las frecuencias de los dos elementos más bajos
    NewNode = fr(hc(X1, X2), F3),        % Crea un nuevo nodo combinado
    insert_sorted(NewNode, Rest, NewList), % Inserta el nuevo nodo en la lista de forma ordenada
    huffman_tree(NewList, Hs).           % Llama recursivamente para construir el árbol completo

% Inserta un elemento en una lista ordenada por la segunda posición
insert_sorted(X, [], [X]).
insert_sorted(fr(X, F1), [fr(Y, F2) | Rest], [fr(X, F1), fr(Y, F2) | Rest]) :- F1 =< F2.
insert_sorted(fr(X, F1), [fr(Y, F2) | Rest], [fr(Y, F2) | SortedRest]) :-
    F1 > F2,
    insert_sorted(fr(X, F1), Rest, SortedRest).
