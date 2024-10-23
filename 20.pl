% -------------------------------------------------------------------
%  Programa: 20.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Eliminar el k-ésimo elemento de una lista
%   
% -------------------------------------------------------------------

% class Program
% {
%     // Método para eliminar el k-ésimo elemento de la lista.
%     static (T removedElement, List<T> updatedList) RemoveAt<T>(List<T> list, int k)
%     {
%         // Validar que k sea mayor que 0.
%         if (k <= 0 || k > list.Count)
%         {
%             throw new ArgumentOutOfRangeException(nameof(k), "El índice debe ser mayor que 0 y menor o igual a la longitud de la lista.");
%         }
% 
%         // Llamar al método recursivo para eliminar el elemento.
%         return RemoveAtHelper(list, k);
%     }
% 
%     // Método recursivo para eliminar el k-ésimo elemento.
%     static (T removedElement, List<T> updatedList) RemoveAtHelper<T>(List<T> list, int k)
%     {
%         if (k == 1)
%         {
%             // Si k es 1, se elimina el primer elemento.
%             return (list[0], list.GetRange(1, list.Count - 1)); // Devolver el elemento eliminado y la lista actualizada.
%         }
%         else
%         {
%             // Si k es mayor que 1, avanzar al siguiente elemento.
%             var (removedElement, updatedList) = RemoveAtHelper(list.GetRange(1, list.Count - 1), k - 1);
%             return (removedElement, new List<T> { list[0] }.Concat(updatedList).ToList()); // Retornar el elemento eliminado y la lista actualizada.
%         }
%     }
% 
%     static void Main()
%     {
%         var input = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
%         int k = 4;  // Índice del elemento a eliminar
%         var (removedElement, updatedList) = RemoveAt(input, k);
% 
%         Console.WriteLine($"Elemento eliminado: {removedElement}");
%         Console.WriteLine("Lista actualizada: " + string.Join(", ", updatedList));
%     }
% }

% Elimina el k-ésimo elemento de una lista.
% El índice K debe ser mayor que 0.
remove_at(X, [X|T], 1, T).
remove_at(X, [H|T], K, [H|R]) :- K > 1, K1 is K - 1, remove_at(X, T, K1, R).