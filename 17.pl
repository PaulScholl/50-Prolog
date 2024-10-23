% -------------------------------------------------------------------
%  Programa: 17.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Dividir una lista en dos partes.
%   
% -------------------------------------------------------------------

% class Program
% {
%     // Método principal para dividir la lista.
%     static (List<T> firstPart, List<T> secondPart) Split<T>(List<T> list, int n)
%     {
%         var firstPart = new List<T>();
%         var secondPart = new List<T>();
% 
%         SplitHelper(list, n, firstPart, secondPart);
% 
%         return (firstPart, secondPart);
%     }
% 
%     // Método recursivo que llena las dos partes de la lista.
%     static void SplitHelper<T>(List<T> list, int n, List<T> firstPart, List<T> secondPart)
%     {
%         if (n == 0)
%         {
%             // Si n es 0, agrega el resto de la lista a la segunda parte.
%             secondPart.AddRange(list);
%             return;
%         }
% 
%         if (list.Count == 0)
%         {
%             return;  // Si la lista está vacía, salir.
%         }
% 
%         // Agrega el primer elemento a la primera parte.
%         firstPart.Add(list[0]);
%         // Llama recursivamente para el resto de la lista.
%         SplitHelper(list.GetRange(1, list.Count - 1), n - 1, firstPart, secondPart);
%     }
% 
%     static void Main()
%     {
%         var input = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
%         int n = 4;  // Longitud de la primera parte
%         var (firstPart, secondPart) = Split(input, n);
% 
%         Console.WriteLine("Primera parte: " + string.Join(", ", firstPart));
%         Console.WriteLine("Segunda parte: " + string.Join(", ", secondPart));
%     }
% }

% Divide una lista en dos partes.
% La longitud de la primera parte está dada por el segundo argumento.
split(L, 0, [], L).
split([H|T], N, [H|L1], L2) :- N > 0, N1 is N - 1, split(T, N1, L1, L2).