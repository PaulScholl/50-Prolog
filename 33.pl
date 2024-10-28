% -------------------------------------------------------------------
%  Programa: 33.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Calcular la función totiente de Euler phi(m).
%   
% -------------------------------------------------------------------

%using System;
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
%        for (int p = 2; p * p <= m; p++)
%        {
%            // Verificar si p es un factor primo de m
%            if (m % p == 0)
%            {
%                // Si es un factor, aplicar la fórmula
%                while (m % p == 0)
%                {
%                    m /= p;
%                }
%                resultado -= resultado / p;
%            }
%        }
%        // Si m es un número primo mayor que 1
%        if (m > 1)
%        {
%            resultado -= resultado / m;
%        }
%        return resultado;
%    }
%}

% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

% Dos números son coprimos si su máximo común divisor es 1.
coprime(X, Y) :- gcd(X, Y, 1).

% Calcula la función totiente de Euler, que cuenta cuántos números menores que M son coprimos con M.
% https://es.wikipedia.org/wiki/Función_φ_de_Euler
totient(1, 1).
totient(M, Phi) :- M > 1, totient_acc(M, M, 0, Phi).

totient_acc(_, 0, Acc, Acc).
totient_acc(M, K, Acc, Phi) :- K > 0, coprime(M, K), Acc1 is Acc + 1, K1 is K - 1, totient_acc(M, K1, Acc1, Phi).
totient_acc(M, K, Acc, Phi) :- K > 0, \\+ coprime(M, K), K1 is K - 1, totient_acc(M, K1, Acc, Phi).
