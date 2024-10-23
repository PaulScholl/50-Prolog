% -------------------------------------------------------------------
%  Programa: 22.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Crear una lista con todos los enteros dentro de un rango dado.
%   
% -------------------------------------------------------------------
% class Program
% {
%     static void Enlist( int start, int finish){
%     List<int> lista = new List<int>();
%     lista.AddRange(Enumerable.Range(start,finish+1-start));
%     }
%     static void Main(string[] args){
%         Program.Enlist(4,10);
%     }
% }
% Crea una lista con todos los enteros dentro de un rango dado.
% Caso base: cuando el inicio y el final son iguales.
range(I, I, [I]).
% Caso recursivo: agrega el inicio a la lista y continúa con el siguiente número.
range(I, K, [I|R]) :- I < K, I1 is I + 1, range(I1, K, R).