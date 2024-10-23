% -------------------------------------------------------------------
%  Programa: 21.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Insertar un elemento en una lista en una posición dada.
%   
% -------------------------------------------------------------------

% class Program
% {
%     static void Insertar(List<int> list, int index, int value){
%         list.Insert(index,value);
%     }
% 
%     static void Main(string[] args)
%     {
%         List<int> lista = new List<int>{1,2,3,4,5,6};
%         Program.Insertar(lista,4,10);
%     }
% }

% Inserta un elemento en una lista en la posición dada.
% El índice K debe ser mayor que 0.
insert_at(X, L, 1, [X|L]).
insert_at(X, [H|T], K, [H|R]) :- K > 1, K1 is K - 1, insert_at(X, T, K1, R).

