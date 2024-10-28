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