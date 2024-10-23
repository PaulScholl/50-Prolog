% -------------------------------------------------------------------
%  Programa: 19.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Rotar una lista un numero N de lugares a la izquierda
%   
% -------------------------------------------------------------------

% class Program
% {
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 3, 4, 5 };
%         int n = 2; // Número de lugares a rotar a la izquierda
% 
%         Console.WriteLine("Lista original: " + string.Join(", ", lista));
%         
%         RotarIzquierda(lista, n);
% 
%         Console.WriteLine("Lista rotada: " + string.Join(", ", lista));
%     }
% 
%     static void RotarIzquierda(List<int> lista, int n)
%     {
%         int longitud = lista.Count;
% 
%         // Asegurarse de que n esté dentro del rango de la longitud de la lista
%         n = n % longitud;
% 
%         // Rotar utilizando slicing
%         List<int> rotada = new List<int>(lista.GetRange(n, longitud - n));
%         rotada.AddRange(lista.GetRange(0, n));
%         
%         // Actualizar la lista original
%         lista.Clear();
%         lista.AddRange(rotada);
%     }
% }

% Rota una lista N lugares a la izquierda.
% Utiliza la longitud de la lista para manejar rotaciones mayores que la longitud.
rotate(L, N, R) :- length(L, Len), N1 is N mod Len, split(L, N1, L1, L2), append(L2, L1, R).