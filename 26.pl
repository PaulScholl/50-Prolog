% -------------------------------------------------------------------
%  Programa: 26.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Generar combinaciones de K elementos distintos seleccionados de una lista de N elementos.
%   
% -------------------------------------------------------------------

% class Program
% {
%     static void Main()
%     {
%         List<int> numeros = new List<int> { 1, 2, 3, 4, 5 };
%         int k = 3;  // Número de elementos en cada combinación
% 
%         List<List<int>> combinaciones = GenerarCombinaciones(numeros, cantidad);
% 
%         // Mostrar todas las combinaciones
%         foreach (var combinacion in combinaciones)
%         {
%             Console.WriteLine("[" + string.Join(", ", combinacion) + "]");
%         }
%     }
% 
%     static List<List<int>> GenerarCombinaciones(List<int> lista, int cantidad)
%     {
%         List<List<int>> resultado = new List<List<int>>();
%         List<int> combinacionActual = new List<int>();
%         Combinar(lista, cantidad, 0, combinacionActual, resultado);
%         return resultado;
%     }
% 
%     static void Combinar(List<int> lista, int cantidad, int inicio, List<int> combinacionActual, List<List<int>> resultado)
%     {
%         // Caso base: si hemos seleccionado exactamente cantidad elementos, añadimos la combinación a los resultados
%         if (combinacionActual.Count == cantidad)
%         {
%             resultado.Add(new List<int>(combinacionActual));
%             return;
%         }
% 
%         // Recorremos los elementos a partir de "inicio"
%         for (int i = inicio; i < lista.Count; i++)
%         {
%             combinacionActual.Add(lista[i]);
%             // Llamada recursiva: seleccionar los siguientes elementos
%             Combinar(lista, cantidad, i + 1, combinacionActual, resultado);
%             // Eliminar el último elemento y retroceder
%             combinacionActual.RemoveAt(combinacionActual.Count - 1);
%         }
%     }
% }

% Genera todas las combinaciones de K elementos seleccionados de una lista dada.
combination(0, _, []).
combination(K, [H|T], [H|Comb]) :- K > 0, K1 is K - 1, combination(K1, T, Comb).
combination(K, [_|T], Comb) :- K > 0, combination(K, T, Comb).