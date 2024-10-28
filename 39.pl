% -------------------------------------------------------------------
%  Programa: 39.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 27 de Octubre de 2024
%  Objetivo: Conjetura de Goldbach.
%   
% -------------------------------------------------------------------

%using System;
%using System.Collections.Generic;
%
%class Program
%{
%    static void Main()
%    {
%        Console.WriteLine("Ingrese un límite superior para verificar la conjetura de Goldbach (número par mayor que 2):");
%        int limiteSuperior = Convert.ToInt32(Console.ReadLine());
%
%        if (limiteSuperior <= 2 || limiteSuperior % 2 != 0)
%        {
%            Console.WriteLine("El límite debe ser un número par mayor que 2.");
%            return;
%        }
%
%        List<int> primos = ObtenerPrimosHasta(limiteSuperior);
%        VerificarConjeturaGoldbach(limiteSuperior, primos);
%    }
%
%    static List<int> ObtenerPrimosHasta(int limite)
%    {
%        bool[] esPrimo = new bool[limite + 1];
%        for (int i = 2; i <= limite; i++)
%        {
%            esPrimo[i] = true;
%        }
%
%        for (int p = 2; p * p <= limite; p++)
%        {
%            if (esPrimo[p])
%            {
%                for (int k = p * p; k <= limite; k += p)
%                {
%                    esPrimo[k] = false;
%                }
%            }
%        }
%
%        List<int> primos = new List<int>();
%        for (int i = 2; i <= limite; i++)
%        {
%            if (esPrimo[i])
%            {
%                primos.Add(i);
%            }
%        }
%
%        return primos;
%    }
%
%    static void VerificarConjeturaGoldbach(int limite, List<int> primos)
%    {
%        for (int n = 4; n <= limite; n += 2)
%        {
%            bool encontrado = false;
%            foreach (int p in primos)
%            {
%                if (p > n) break;
%                if (primos.Contains(n - p))
%                {
%                    encontrado = true;
%                    Console.WriteLine($"{n} = {p} + {n - p}");
%                    break;
%                }
%            }
%
%            if (!encontrado)
%            {
%                Console.WriteLine($"No se encontró representación para {n}.");
%            }
%        }
%    }
%}

% Define el predicado principal is_prime/1
is_prime(N) :-
    N > 1,                % Debe ser mayor que 1
    \+ has_divisor(N, 2). % No debe tener divisores entre 2 y la raíz cuadrada de N.

% Verifica si hay un divisor de N entre D y la raíz cuadrada de N.
has_divisor(N, D) :-
    D * D =< N,           % Solo comprobar hasta la raíz cuadrada de N
    (   N mod D =:= 0     % Si N es divisible por D
    ;   D2 is D + 1,      % Incrementa D
        has_divisor(N, D2) % Llama recursivamente
    ).

% Genera una lista de números primos en un rango dado.
prime_list(Low, High, Primes) :- findall(P, (between(Low, High, P), is_prime(P)), Primes).

% Encuentra dos números primos que sumen un número par dado según la conjetura de Goldbach.
% https://es.wikipedia.org/wiki/Conjetura_de_Goldbach
goldbach(N, [P1, P2]) :- N > 2, N mod 2 =:= 0, prime_list(2, N, Primes), member(P1, Primes), P2 is N - P1, is_prime(P2).
