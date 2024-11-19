% -------------------------------------------------------------------
%  Programa: 12.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Decodificar una lista codificada mediante Run-Length.
%   
% -------------------------------------------------------------------

% class Program
% {
%     // Método para decodificar una lista codificada por Run-Length.
%     static List<T> Decode<T>(List<(int, T)> encodedList)
%     {
%         var result = new List<T>();
% 
%         foreach (var (count, value) in encodedList)
%         {
%             var expanded = Expand(value, count);  // Expande cada par (N, X)
%             result.AddRange(expanded);  // Agrega los elementos a la lista final
%         }
% 
%         return result;
%     }
% 
%     // Método para expandir un elemento X en una lista de longitud N.
%     static List<T> Expand<T>(T value, int count)
%     {
%         var expandedList = new List<T>();
%         for (int i = 0; i < count; i++)
%         {
%             expandedList.Add(value);  // Agrega el elemento N veces
%         }
%         return expandedList;
%     }
% 
%     static void Main()
%     {
%         var encoded = new List<(int, char)>
%         {
%             (2, 'a'),
%             (3, 'b'),
%             (1, 'c'),
%             (2, 'a')
%         };
% 
%         var decoded = Decode(encoded);
% 
%         Console.WriteLine(string.Join(", ", decoded));
%     }
% }

% Decodifica una lista codificada mediante Run-Length.
% Expande cada par (N, X) en una lista con N elementos X.
decode([], []).
decode([[N,X]|T], R) :- decode(T, R1), expand(X, N, E), append(E, R1, R).

% Expande un elemento X en una lista de longitud N.
expand(_, 0, []).
expand(X, N, [X|T]) :- N > 0, N1 is N - 1, expand(X, N1, T).
