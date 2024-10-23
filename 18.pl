% -------------------------------------------------------------------
%  Programa: 18.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Extraer una porcion de una lista.
%   
% -------------------------------------------------------------------

% class Program
% {
%     // Método para extraer una porción de la lista, dado un rango.
%     static List<T> Slice<T>(List<T> list, int start, int length)
%     {
%         var result = new List<T>();
% 
%         // Validar que los índices sean mayores que 0.
%         if (start <= 0 || length <= 0)
%         {
%             return result;  // Retornar lista vacía si los índices no son válidos.
%         }
% 
%         // Llamar al método recursivo para obtener la porción deseada.
%         SliceHelper(list, start, length, result);
%         return result;
%     }
% 
%     // Método recursivo para llenar la lista resultante.
%     static void SliceHelper<T>(List<T> list, int start, int length, List<T> result)
%     {
%         if (list.Count == 0 || length <= 0)
%         {
%             return;  // Si la lista está vacía o la longitud es 0, salir.
%         }
% 
%         if (start == 1)
%         {
%             // Si el índice de inicio es 1, agregar el elemento a la lista resultante.
%             result.Add(list[0]);
%             // Llamar recursivamente para el resto de la lista, decrementando la longitud.
%             SliceHelper(list.GetRange(1, list.Count - 1), start, length - 1, result);
%         }
%         else
%         {
%             // Si el índice de inicio es mayor que 1, avanzar al siguiente elemento.
%             SliceHelper(list.GetRange(1, list.Count - 1), start - 1, length, result);
%         }
%     }
% 
%     static void Main()
%     {
%         var input = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
%         int start = 3;   // Índice de inicio (1-based)
%         int length = 4;  // Longitud de la porción
%         var result = Slice(input, start, length);
% 
%         Console.WriteLine("Porción extraída: " + string.Join(", ", result));
%     }
% }

% Extrae una porción de una lista, dado un rango.
% Los índices I y K deben ser mayores que 0.
slice([H|_], 1, 1, [H]).
slice([H|T], 1, K, [H|R]) :- K > 1, K1 is K - 1, slice(T, 1, K1, R).
slice([_|T], I, K, R) :- I > 1, I1 is I - 1, K1 is K - 1, slice(T, I1, K1, R).