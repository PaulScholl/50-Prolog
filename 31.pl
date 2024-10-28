% -------------------------------------------------------------------
%  Programa: 31.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 28 de Octubre de 2024
%  Objetivo: Determinar el máximo común divisor de dos números positivos.
%   
% -------------------------------------------------------------------
%using System;
%class Program
%{
%    // Método para calcular el MCD utilizando el algoritmo de Euclides
%    static int CalcularMCD(int a, int b)
%    {
%        while (b != 0)
%        {
%            int temp = b;
%            b = a % b;  // Obtener el resto de a dividido por b
%            a = temp;   // Actualizar a
%        }
%        return a; // Cuando b es 0, a es el MCD
%    }
%
%    static void Main()
%    {
%        Console.Write("Ingrese el primer número positivo: ");
%        int num1 = int.Parse(Console.ReadLine());
%
%        Console.Write("Ingrese el segundo número positivo: ");
%        int num2 = int.Parse(Console.ReadLine());
%
%        int mcd = CalcularMCD(num1, num2);
%        Console.WriteLine($"El máximo común divisor de {num1} y {num2} es: {mcd}");
%    }
%}

% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).
