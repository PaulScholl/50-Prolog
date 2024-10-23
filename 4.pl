% -------------------------------------------------------------------
%  Programa: 4.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Encontrar el número de elementos de una lista
%   
% -------------------------------------------------------------------

% class Program
% {    
%     static void longitud(List<string> lista){
%         Console.WriteLine(lista.Count());
%     }
% 
%     static void Main(string[] args)
%     {
%         Program.longitud(new List<string> {"Paul","Jairo","Oswaldo","Franco","Geras","Boro"});
%     }
% }

% Calcula el número de elementos de una lista.
% Caso base: una lista vacía tiene longitud 0.
list_length([], 0).
% Caso recursivo: la longitud es 1 más que la longitud de la cola.
list_length([_|T], N) :- list_length(T, N1), N is N1 + 1.