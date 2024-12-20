% -------------------------------------------------------------------
%  Programa: 37.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 27 de Octubre de 2024
%  Objetivo: Comparar dos métodos para calcular la función totiente de Euler.
%   
% -------------------------------------------------------------------

%static int CalcularTotienteConMultiples(int m)
%{
%    bool[] esCoprimo = new bool[m + 1];
%    for (int i = 1; i <= m; i++)
%    {
%        esCoprimo[i] = true;
%    }
%
%    for (int p = 2; p <= m; p++)
%    {
%        if (esCoprimo[p])
%        {
%            for (int k = p; k <= m; k += p)
%            {
%                esCoprimo[k] = false;
%            }
%        }
%    }
%
%    int contador = 0;
%    for (int i = 1; i <= m; i++)
%    {
%        if (esCoprimo[i])
%        {
%            contador++;
%        }
%    }
%
%    return contador;
%}

% Cálculo de la función totiente de Euler para N.

% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

% La función totiente (φ(N)) es el número de enteros positivos hasta N que son coprimos con N.

% Definición básica de totient usando factorización
totient(N, Phi) :- 
    findall(P, (between(1, N, P), gcd(P, N, 1)), Coprimes), % Encuentra todos los coprimos de N
    length(Coprimes, Phi).  % Cuenta cuántos hay

% Definición mejorada de totient
totient_improved(N, Phi) :-
    N1 is N, 
    prime_factors(N1, Factors),     % Obtener factores primos
    unique(Factors, UniqueFactors),  % Asegurarse de que los factores sean únicos
    calculate_totient(N, UniqueFactors, Phi).  % Calcular φ usando los factores únicos

% Obtener los factores primos de un número
prime_factors(1, []).
prime_factors(N, [F|Fs]) :- 
    between(2, N, F), 
    N mod F =:= 0, 
    N1 is N // F, 
    prime_factors(N1, Fs).

% Asegurarse de que los factores sean únicos
unique([], []).
unique([H|T], [H|UniqueT]) :- 
    \+ member(H, T), 
    unique(T, UniqueT).
unique([H|T], UniqueT) :- 
    member(H, T), 
    unique(T, UniqueT).

% Calcular φ(N) usando factores primos únicos
calculate_totient(N, Factors, Phi) :- 
    totient_formula(N, Factors, 1, Phi).

totient_formula(_, [], Acc, Acc).
totient_formula(N, [F|Fs], Acc1, Phi) :-
    NewAcc is Acc1 * (F - 1) * N // F,  % Aplicar la fórmula de la función totiente
    totient_formula(N, Fs, NewAcc, Phi).

% Comparar ambos métodos
compare_totient(N) :- 
    totient(N, Phi1), 
    totient_improved(N, Phi2), 
    write('Phi (método básico): '), write(Phi1), nl, 
    write('Phi (método mejorado): '), write(Phi2), nl.
