% -------------------------------------------------------------------
%  Programa: 28.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Ordenar una lista de listas de acuerdo con la longitud de las sublistas.
%   
% -------------------------------------------------------------------
% 
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
%         // Ordenar la lista de listas por la longitud de las sublistas
%         List<List<int>> resultado = OrdenarPorLongitud(listas);
% 
%         // Mostrar el resultado
%         foreach (var sublista in resultado)
%         {
%             Console.WriteLine("[" + string.Join(", ", sublista) + "]");
%         }
%     }
% 
%     static List<List<int>> OrdenarPorLongitud(List<List<int>> listas)
%     {
%         // Ordenar las sublistas de acuerdo a su longitud
%         return listas.OrderBy(sublista => sublista.Count).ToList();
%     }
% }

% Ordena una lista de listas de acuerdo con la longitud de las sublistas.
lsort(L, S) :- map_list_to_pairs(length, L, P), keysort(P, SP), pairs_values(SP, S).