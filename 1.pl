% -------------------------------------------------------------------
%  Programa: 1.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 5 de Septiembre de 2024
%  Objetivo: Encontrar el ultimo elemento de una lista
%   
% -------------------------------------------------------------------
%
%
%  static void Main()
%    {
%        List<int> numeros = new List<int> { 1, 2, 3, 4, 5 };
%        int ultimoElemento = numeros.Last();
%        Console.WriteLine("Último elemento: " + ultimoElemento);
%    }

% Encuentra el último elemento de una lista.
% La lista debe tener al menos un elemento.
my_last(X, [X]).
my_last(X, [_|T]) :- my_last(X, T).