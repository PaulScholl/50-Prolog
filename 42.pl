% -------------------------------------------------------------------
%  Programa: 42.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 27 de Octubre de 2024
%  Objetivo: Tabla de verdad para expresiones lógicas (operadores).
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

% Utiliza operadores lógicos para definir expresiones y generar tablas de verdad.
% Definición de los operadores básicos AND, OR, NAND, NOR, XOR, IMPLICACIÓN, EQUIVALENCIA.
and(A, B) :- A, B.
or(A, _) :- A.
or(_, B) :- B.
nand(A, B) :- \+ (A, B).
nor(A, B) :- \+ (A; B).
xor(A, B) :- A, \+ B; \+ A, B.
impl(A, B) :- \+ A; B.
equ(A, B) :- A, B; \+ A, \+ B.
