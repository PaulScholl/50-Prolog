% -------------------------------------------------------------------
%  Programa: 13.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo:  Codificación Run-Length de una lista (solución directa).
%   
% -------------------------------------------------------------------

% class Program
% {
%     // Método para codificar directamente usando Run-Length.
%     static List<(int, T)> EncodeDirect<T>(List<T> list)
%     {
%         var result = new List<(int, T)>();
%         int i = 0;
% 
%         while (i < list.Count)
%         {
%             T currentElement = list[i];
%             int count = CountConsecutive(list, i, currentElement, out int nextIndex);
%             result.Add((count, currentElement));
%             i = nextIndex;  // Avanza al índice del siguiente grupo
%         }
% 
%         return result;
%     }
% 
%     // Método para contar cuántos elementos consecutivos son iguales.
%     static int CountConsecutive<T>(List<T> list, int startIndex, T element, out int nextIndex)
%     {
%         int count = 0;
%         int i = startIndex;
% 
%         // Cuenta los elementos iguales consecutivos.
%         while (i < list.Count && EqualityComparer<T>.Default.Equals(list[i], element))
%         {
%             count++;
%             i++;
%         }
% 
%         nextIndex = i;  // Devuelve el índice del primer elemento diferente
%         return count;
%     }
% 
%     static void Main()
%     {
%         var input = new List<char> { 'a', 'a', 'b', 'b', 'b', 'c', 'a', 'a' };
%         var encoded = EncodeDirect(input);
% 
%         // Imprime el resultado de la codificación.
%         foreach (var (count, value) in encoded)
%         {
%             Console.WriteLine($"({count}, {value})");
%         }
%     }
% }

% Codifica directamente una lista usando codificación Run-Length.
% Cuenta cuántos elementos consecutivos son iguales.
encode_direct([], []).
encode_direct([X|Xs], [[N,X]|R]) :- count(X, [X|Xs], N, Rest), encode_direct(Rest, R).

% Cuenta cuántos elementos consecutivos son iguales.
count(_, [], 0, []).
count(X, [X|Xs], N, Rest) :- count(X, Xs, N1, Rest), N is N1 + 1.
count(X, [Y|Ys], 0, [Y|Ys]) :- X \= Y.
