% -------------------------------------------------------------------
%  Programa: 16.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Eliminar cada n-ésimo elemento de una lista.
%   
% -------------------------------------------------------------------

% class Program
% {
%     // Método principal para eliminar cada n-ésimo elemento de la lista.
%     static List<T> DropEveryNth<T>(List<T> list, int n)
%     {
%         return Drop(list, n, n);
%     }
% 
%     // Método recursivo que utiliza un contador para eliminar elementos.
%     static List<T> Drop<T>(List<T> list, int counter, int n)
%     {
%         var result = new List<T>();
% 
%         for (int i = 0; i < list.Count; i++)
%         {
%             if (counter == 1)
%             {
%                 // Si el contador es 1, omitir el elemento y reiniciar el contador.
%                 counter = n;
%             }
%             else
%             {
%                 // Si no es 1, conservar el elemento y decrementar el contador.
%                 result.Add(list[i]);
%                 counter--;
%             }
%         }
% 
%         return result;
%     }
% 
%     static void Main()
%     {
%         var input = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
%         int n = 3;  // Eliminar cada tercer elemento
%         var result = DropEveryNth(input, n);
% 
%         Console.WriteLine(string.Join(", ", result));
%     }
% }


% Elimina cada n-ésimo elemento de una lista.
% Utiliza un contador para determinar cuándo eliminar un elemento.
drop(L, N, R) :- drop(L, N, N, R).

% Caso base: cuando la lista está vacía, el resultado es vacío.
drop([], _, _, []).
% Si el contador llega a 1, omite el primer elemento y reinicia el contador.
drop([_|T], 1, N, R) :- drop(T, N, N, R).
% Caso recursivo: disminuye el contador y conserva el elemento.
drop([H|T], K, N, [H|R]) :- K > 1, K1 is K - 1, drop(T, K1, N, R).