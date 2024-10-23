% -------------------------------------------------------------------
%  Programa: 10.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Codificación Run-Length de una lista.
%   
% -------------------------------------------------------------------
% class Program
% {
%     static void Main()
%     {
%         List<int> numeros = new List<int> { 1, 1, 2, 3, 3, 3, 4, 4, 5 };
%         List<(int, int)> lista = RunLength(numeros);
% 
%         // Mostrar el resultado
%         foreach (var item in lista)
%         {
%             Console.WriteLine($"Elemento: {item.Item1}, Repeticiones: {item.Item2}");
%         }
%     }
% 
%     static List<(int, int)> RunLength(List<int> lista)
%     {
%         List<(int, int)> resultado = new List<(int, int)>();
%         if (lista.Count == 0) return resultado;
% 
%         int valorActual = lista[0];
%         int contador = 1;
% 
%         for (int i = 1; i < lista.Count; i++)
%         {
%             if (lista[i] == valorActual)
%             {
%                 // Si el elemento es igual al anterior, incrementa el contador
%                 contador++;
%             }
%             else
%             {
%                 // Si cambia, añade el valor actual y su cantidad al resultado
%                 resultado.Add((valorActual, contador));
%                 valorActual = lista[i];
%                 contador = 1;
%             }
%         }
% 
%         // Añadir el último elemento y su cantidad
%         resultado.Add((valorActual, contador));
% 
%         return resultado;
%     }
% }

% Codifica una lista usando codificación Run-Length.
% Primero agrupa los duplicados y luego transforma las sublistas en parejas (N, X).
encode(L, R) :- pack(L, P), transform(P, R).

% Transforma sublistas en parejas (N, X), donde N es la cantidad de elementos.
transform([], []).
transform([[X|Xs]|Ys], [[N,X]|Zs]) :- length([X|Xs], N), transform(Ys, Zs).