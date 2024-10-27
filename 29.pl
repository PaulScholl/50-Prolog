% -------------------------------------------------------------------
%  Programa: 29.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Ordenar una lista de listas según la frecuencia de la longitud de las sublistas.
%   
% -------------------------------------------------------------------

% class Program
% {
%     static void Main()
%     {
%         List<List<int>> listas = new List<List<int>>
%         {
%             new List<int> { 1, 2, 3 },
%             new List<int> { 4, 5 },
%             new List<int> { 6 },
%             new List<int> { 7, 8, 9, 10 },
%             new List<int> { 11, 12 },
%             new List<int> { 13, 14, 15 }
%         };
% 
%         // Ordenar la lista de listas por la frecuencia de la longitud de las sublistas
%         List<List<int>> resultado = OrdenarPorFrecuenciaDeLongitud(listas);
% 
%         // Mostrar el resultado
%         foreach (var sublista in resultado)
%         {
%             Console.WriteLine("[" + string.Join(", ", sublista) + "]");
%         }
%     }
% 
%     static List<List<int>> OrdenarPorFrecuenciaDeLongitud(List<List<int>> listas)
%     {
%         // Crear un diccionario para contar las frecuencias de las longitudes
%         var frecuenciaLongitud = listas
%             .GroupBy(sublista => sublista.Count)
%             .ToDictionary(grupo => grupo.Key, grupo => grupo.Count());
% 
%         // Ordenar las listas de acuerdo a la frecuencia de su longitud
%         return listas
%             .OrderBy(sublista => frecuenciaLongitud[sublista.Count])
%             .ThenBy(sublista => sublista.Count) // En caso de empate, ordenar por la longitud
%             .ToList();
%     }
% }

% Codifica la frecuencia de elementos consecutivos en una lista de pares.
encode([], []).
encode([(K, _)|T], [count(K, N)|R]) :-
    count(K, T, N, NewT),  % Cuenta cuántas veces K aparece y devuelve el resto de la lista.
    encode(NewT, R).

% Cuenta las ocurrencias de un elemento en una lista.
count(_, [], 0, []).
count(K, [(K, _)|T], N, R) :- 
    count(K, T, N1, R), 
    N is N1 + 1.  % Incrementa el contador.
count(K, [H|T], N, [H|R]) :- 
    H \= (K, _), 
    count(K, T, N, R).  % Continúa sin contar el elemento.

% Ordena una lista de listas de acuerdo con la frecuencia de la longitud de las sublistas.
length_frequency(L, F) :- 
    map_list_to_pairs(length, L, P),
    msort(P, SP),
    encode(SP, F).
