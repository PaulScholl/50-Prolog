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

% Verifica si un número entero dado es primo.
is_prime(2).
is_prime(3).
is_prime(P) :- P > 3, P mod 2 =\= 0, \\+ has_factor(P, 3).

% Verifica si un número tiene factores.
has_factor(N, L) :- N mod L =:= 0.
has_factor(N, L) :- L * L < N, L2 is L + 2, has_factor(N, L2).
