% Cálculo de la función totiente de Euler para N.
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
    write('Phi (método mejorado): 
