% -------------------------------------------------------------------
%  Programa: 41.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Tabla de verdad para expresiones lógicas.
%   
% -------------------------------------------------------------------

%using System;
%
%class Program
%{
%    static void Main()
%    {
%        Console.WriteLine("Tabla de Verdad para A y B");
%        Console.WriteLine("| A | B | A AND B | A OR B | NOT A |");
%        Console.WriteLine("|---|---|----------|--------|-------|");
%
%        // Iterar sobre todas las combinaciones posibles de A y B
%        foreach (bool A in new bool[] { true, false })
%        {
%            foreach (bool B in new bool[] { true, false })
%            {
%                bool andResult = A && B;
%                bool orResult = A || B;
%                bool notAResult = !A;
%
%                // Mostrar los resultados en formato tabla
%                Console.WriteLine($"| {Convert.ToInt32(A)} | {Convert.ToInt32(B)} |   {Convert.ToInt32(andResult)}    |   {Convert.ToInt32(orResult)}  |   {Convert.ToInt32(notAResult)}  |");
%            }
%        }
%    }
%}

% Genera una tabla de verdad para una expresión lógica en dos variables.
% A y B son las variables lógicas y Expr es la expresión lógica que se evalúa.
table(A, B, Expr) :- write(A), write(' '), write(B), write(' '), call(Expr), nl, fail.
table(_, _, _).
