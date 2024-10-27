% -------------------------------------------------------------------
%  Programa: 25.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Generar una permutacion aleatoria en los elementos de una lista
%   
% -------------------------------------------------------------------

% class Program
% {
%     static void Main()
%     {
%         List<int> numeros = new List<int> { 1, 2, 3, 4, 5 };
%         List<int> permutacion = PermutacionAleatoria(numeros);
% 
%         // Mostrar el resultado
%         Console.WriteLine("Permutación aleatoria: " + string.Join(", ", permutacion));
%     }
% 
%     static List<int> PermutacionAleatoria(List<int> lista)
%     {
%         Random rand = new Random();
%         return lista.OrderBy(x => rand.Next()).ToList(); // Reordenar de forma aleatoria
%     }
% }

% Genera una lista con todos los enteros dentro de un rango dado.
% Caso base: cuando el inicio y el final son iguales.
range(I, I, [I]).
% Caso recursivo: agrega el inicio a la lista y continúa con el siguiente número.
range(I, K, [I|R]) :- I < K, I1 is I + 1, range(I1, K, R).

% Extrae un número dado de elementos aleatorios de una lista.
% Caso base: seleccionar 0 elementos resulta en una lista vacía.
rnd_select(_, 0, []).

% Caso recursivo: selecciona un elemento aleatorio de la lista y llama recursivamente.
rnd_select(L, N, [X|R]) :- 
    length(L, Len), 
    Len > 0,                       % Asegúrate de que la lista no esté vacía.
    random(1, Len, I), 
    element_at(X, L, I),           % Obtiene el elemento en la posición I.
    delete(L, X, L1),              % Elimina el elemento seleccionado de la lista.
    N1 is N - 1,                   % Decrementa el contador de elementos restantes.
    rnd_select(L1, N1, R).          % Llama recursivamente con la lista reducida.

% Extrae el elemento en la posición I de la lista L.
element_at(X, [X|_], 1).                    % Caso base: el primer elemento es el que buscamos.
element_at(X, [_|T], I) :-                    % Caso recursivo: busca en la cola.
    I > 1, 
    I1 is I - 1, 
    element_at(X, T, I1).

% Genera una permutación aleatoria de los elementos de una lista.
% Utiliza la selección aleatoria para construir la permutación.
rnd_permu(L, P) :- length(L, Len), rnd_select(L, Len, P).
