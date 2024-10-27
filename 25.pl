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


% Genera una permutación aleatoria de los elementos de una lista.
% Utiliza la selección aleatoria para construir la permutación.

% rnd_permu(+List, -Perm)
rnd_permu(L, P) :- length(L, Len), rnd_select(L, Len, P).

% rnd_select(+List, +N, -Selected)
% Selecciona N elementos aleatorios de List sin repetición
rnd_select([], 0, []). % Caso base: seleccionar 0 elementos
rnd_select(L, N, [X|Rest]) :- 
    N > 0, 
    random_member(X, L), % Selecciona un elemento aleatorio
    delete(L, X, L1), % Elimina el elemento seleccionado de la lista
    N1 is N - 1, 
    rnd_select(L1, N1, Rest). % Llama recursivamente para seleccionar el resto

% Para seleccionar un miembro aleatorio de la lista
random_member(X, List) :- 
    length(List, Len), 
    random_between(1, Len, Index), 
    nth1(Index, List, X). % nth1 para obtener el elemento en la posición Index

