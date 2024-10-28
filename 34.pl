% -------------------------------------------------------------------
%  Programa: 34.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 27 de Octubre de 2024
%  Objetivo: Determinar los factores primos de un número entero positivo.
%   
% -------------------------------------------------------------------

%using System;
%using System.Collections.Generic;
%
%class Program
%{
%    static void Main()
%    {
%        Console.WriteLine("Ingrese un número entero positivo:");
%        int n = Convert.ToInt32(Console.ReadLine());
%
%        if (n <= 0)
%        {
%            Console.WriteLine("El número debe ser positivo.");
%            return;
%        }
%
%        List<int> factoresPrimos = ObtenerFactoresPrimos(n);
%        Console.WriteLine($"Los factores primos de {n} son: {string.Join(", ", factoresPrimos)}");
%    }
%
%    static List<int> ObtenerFactoresPrimos(int n)
%    {
%        List<int> factores = new List<int>();
%
%        // Verificar el número de veces que 2 es un factor
%        while (n % 2 == 0)
%        {
%            if (!factores.Contains(2))
%            {
%                factores.Add(2);
%            }
%            n /= 2;
%        }
%
%        // Verificar los factores impares
%        for (int i = 3; i <= Math.Sqrt(n); i += 2)
%        {
%            while (n % i == 0)
%            {
%                if (!factores.Contains(i))
%                {
%                    factores.Add(i);
%                }
%                n /= i;
%            }
%        }
%
%        // Si n es un número primo mayor que 2
%        if (n > 2)
%        {
%            factores.Add(n);
%        }
%
%        return factores;
%    }
%}

% Encuentra los factores primos de un número entero positivo.
prime_factors(N, L) :- N > 1, prime_factors(N, 2, L).

prime_factors(1, _, []).
prime_factors(N, F, [F|L]) :- N > 1, 0 is N mod F, N1 is N // F, prime_factors(N1, F, L).
prime_factors(N, F, L) :- N > 1, F * F < N, next_factor(F, F1), prime_factors(N, F1, L).

next_factor(2, 3).
next_factor(F, F1) :- F > 2, F1 is F + 2.
