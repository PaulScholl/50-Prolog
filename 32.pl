% -------------------------------------------------------------------
%  Programa: 32.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 27 de Octubre de 2024
%  Objetivo: Verificar si un numero es primo o no
%   
% -------------------------------------------------------------------
%using System;
%
%class Program
%{
%    static void Main()
%    {
%        Console.WriteLine("Ingrese el primer número positivo:");
%        int num1 = Convert.ToInt32(Console.ReadLine());
%
%        Console.WriteLine("Ingrese el segundo número positivo:");
%        int num2 = Convert.ToInt32(Console.ReadLine());
%
%        if (num1 <= 0 || num2 <= 0)
%        {
%            Console.WriteLine("Ambos números deben ser positivos.");
%            return;
%        }
%
%        if (SonCoprimos(num1, num2))
%        {
%            Console.WriteLine($"{num1} y {num2} son coprimos.");
%        }
%        else
%        {
%            Console.WriteLine($"{num1} y {num2} no son coprimos.");
%        }
%    }
%
%    static bool SonCoprimos(int a, int b)
%    {
%        return CalcularMCD(a, b) == 1;
%    }
%
%    static int CalcularMCD(int a, int b)
%    {
%        while (b != 0)
%        {
%            int temp = b;
%            b = a % b;
%            a = temp;
%        }
%        return a;
%    }
%}

% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

% Dos números son coprimos si su máximo común divisor es 1.
coprime(X, Y) :- gcd(X, Y, 1).
