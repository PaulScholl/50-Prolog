% -------------------------------------------------------------------
%  Programa: 25.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Generar una permutacion aleatoria en los elementos de una lista
%   
% -------------------------------------------------------------------

% class Program
% {
%     static void Main()
%     {
%         List<int> numeros = new List<int> { 1, 2, 3, 4, 5 };
%         List<int> permutacion = PermutacionAleatoria(numeros);
% 
%         // Mostrar el resultado
%         Console.WriteLine("Permutación aleatoria: " + string.Join(", ", permutacion));
%     }
% 
%     static List<int> PermutacionAleatoria(List<int> lista)
%     {
%         Random rand = new Random();
%         return lista.OrderBy(x => rand.Next()).ToList(); // Reordenar de forma aleatoria
%     }
% }

% Genera una permutación aleatoria de los elementos de una lista.
% Utiliza la selección aleatoria para construir la permutación.
rnd_permu(L, P) :- length(L, Len), rnd_select(L, Len, P).