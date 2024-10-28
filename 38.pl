% -------------------------------------------------------------------
%  Programa: 38.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 27 de Octubre de 2024
%  Objetivo: Lista de números primos en un rango.
%   
% -------------------------------------------------------------------

%using System;
%using System.Collections.Generic;
%
%class Program
%{
%    static void Main()
%    {
%        Console.WriteLine("Ingrese el límite superior para encontrar números primos:");
%        int limiteSuperior = Convert.ToInt32(Console.ReadLine());
%
%        if (limiteSuperior < 2)
%        {
%            Console.WriteLine("El límite debe ser al menos 2.");
%            return;
%        }
%
%        List<int> primos = ObtenerPrimosEnRango(limiteSuperior);
%        Console.WriteLine($"Números primos hasta {limiteSuperior}: {string.Join(", ", primos)}");
%    }
%
%    static List<int> ObtenerPrimosEnRango(int limite)
%    {
%        bool[] esPrimo = new bool[limite + 1];
%        for (int i = 2; i <= limite; i++)
%        {
%            esPrimo[i] = true; // Asumir que todos son primos inicialmente
%        }
%
%        for (int p = 2; p * p <= limite; p++)
%        {
%            if (esPrimo[p])
%            {
%                for (int k = p * p; k <= limite; k += p)
%                {
%                    esPrimo[k] = false; // Marcar múltiplos como no primos
%                }
%            }
%        }
%
%        List<int> primos = new List<int>();
%        for (int i = 2; i <= limite; i++)
%        {
%            if (esPrimo[i])
%            {
%                primos.Add(i); // Añadir a la lista de primos
%            }
%        }
%
%        return primos;
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
