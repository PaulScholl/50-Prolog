% -------------------------------------------------------------------
%  Programa: 30.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Verificar si un numero es primo o no
%   
% -------------------------------------------------------------------

% class Program
% {
%     static void Main()
%     {
%         Console.WriteLine("Ingrese un número entero:");
%         int numero = int.Parse(Console.ReadLine());
% 
%         if (EsPrimo(numero))
%         {
%             Console.WriteLine($"{numero} es un número primo.");
%         }
%         else
%         {
%             Console.WriteLine($"{numero} no es un número primo.");
%         }
%     }
% 
%     static bool EsPrimo(int numero)
%     {
%         // Casos especiales
%         if (numero <= 1) return false;  // Números menores o iguales a 1 no son primos
%         if (numero == 2) return true;   // El 2 es el único número primo par
% 
%         // Si el número es divisible por 2 o por cualquier número impar hasta √n, no es primo
%         if (numero % 2 == 0) return false;  // Descartar números pares mayores que 2
% 
%         // Probar divisores desde 3 hasta la raíz cuadrada de 'numero'
%         for (int i = 3; i <= Math.Sqrt(numero); i += 2)
%         {
%             if (numero % i == 0)
%             {
%                 return false;
%             }
%         }
% 
%         return true;  // Si no se encontró divisor, es primo
%     }
% }

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

% Ejemplo de uso:
% ?- is_prime(7).  % Debería retornar true.
% ?- is_prime(10). % Debería retornar false.

