% -------------------------------------------------------------------
%  Programa: 36.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 27 de Octubre de 2024
%  Objetivo: Calcular la función totiente de Euler phi(m) mejorada.
%   
% -------------------------------------------------------------------

%using System;
%using System.Collections.Generic;
%
%class Program
%{
%    static void Main()
%    {
%        Console.WriteLine("Ingrese un número entero positivo (m):");
%        int m = Convert.ToInt32(Console.ReadLine());
%
%        if (m <= 0)
%        {
%            Console.WriteLine("El número debe ser positivo.");
%            return;
%        }
%
%        int resultado = CalcularTotienteEuler(m);
%        Console.WriteLine($"La función totiente de Euler φ({m}) es: {resultado}");
%    }
%
%    static int CalcularTotienteEuler(int m)
%    {
%        int resultado = m;
%        int n = m;
%
%        // Verificar los factores primos
%        for (int p = 2; p * p <= n; p++)
%        {
%            if (n % p == 0)
%            {
%                // Si p es un factor primo, aplicamos la fórmula
%                while (n % p == 0)
%                {
%                    n /= p;
%                }
%                resultado -= resultado / p;
%            }
%        }
%
%        // Si n es un número primo mayor que 1
%        if (n > 1)
%        {
%            resultado -= resultado / n;
%        }
%
%        return resultado;
%    }
%}

% Encuentra los factores primos de un número entero positivo.
prime_factors(N, L) :- N > 1, prime_factors(N, 2, L).

prime_factors(1, _, []).
prime_factors(N, F, [F|L]) :- N > 1, 0 is N mod F, N1 is N // F, prime_factors(N1, F, L).
prime_factors(N, F, L) :- N > 1, F * F < N, next_factor(F, F1), prime_factors(N, F1, L).

next_factor(2, 3).
next_factor(F, F1) :- F > 2, F1 is F + 2.

% Determina los factores primos con su multiplicidad.
prime_factors_mult(N, L) :- prime_factors(N, F), encode(F, L).

% Calcula la función totiente usando los factores primos con multiplicidad para mejorar la eficiencia.
% https://es.wikipedia.org/wiki/Función_φ_de_Euler
totient_improved(N, Phi) :- prime_factors_mult(N, F), totient_phi(F, Phi).

totient_phi([], 1).
totient_phi([[P, M]|T], Phi) :- totient_phi(T, Phi1), Phi is Phi1 * (P - 1) * P ** (M - 1).
